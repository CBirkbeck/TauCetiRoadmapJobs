# Period and index on real surfaces

This roadmap plans Olivier Benoist's work on the period-index problem for function fields of real algebraic surfaces
(*The period-index problem for real surfaces*, Publ. Math. IHÉS 130 (2019), 63–110), from what Mathlib and Tau Ceti
contain at the pinned commits (Mathlib `082e2d3`, Tau Ceti `f790474`) to the paper's main theorems. It is a new roadmap
in the area *arithmetic geometry*. It plans what is specific to Benoist's argument, the real-function-field theory and
the Brauer-class arithmetic that no roadmap owns yet, and imports equivariant cohomology and cycle classes of real
varieties, Brauer residues, families and Hodge filtrations, weak Lefschetz, resolution and Enriques invariants from the
roadmaps that own them.

## The theorems

Let S be a connected smooth projective surface over ℝ, ℝ(S) its function field, and for α ∈ Br(ℝ(S)) let per(α) be its
order and ind(α) its index (the degree of the division algebra in its class; equivalently the least, and the greatest
common divisor, of the degrees of finite splitting fields). De Jong's theorem over ℂ and a norm argument already give
ind(α) ∈ {per(α), 2 per(α)}. The targets are:

- **Theorem 0.3.** If S(ℝ) = ∅, then ind(α) = per(α) for every α ∈ Br(ℝ(S)), ramified or not.
- **Theorem 0.4.** If U is a connected smooth real surface and α ∈ Br(U) evaluates to 0 ∈ Br(ℝ) at every real point of U,
  then ind(α) = per(α).
- **Theorem 0.5.** Let α ∈ Br(S) have period n and let Θ ⊂ S(ℝ) be the union of the components where α evaluates
  nontrivially. If n is odd, or if some lift ξ ∈ H²_G(S(ℂ), 𝔽₂) of (n/2)α in the real Kummer sequence has first real
  component [ξ]₁ vanishing on Θ, then ind(α) = n; otherwise ind(α) = 2n.
- **Theorem 0.6.** A real Enriques surface carries an unramified class with ind ≠ per exactly when S(ℝ) is
  nonorientable and, if exactly one of its two halves is nonempty, S(ℝ) has an odd number of components of odd Euler
  characteristic. (The second clause never holds: a real Enriques surface has an even number of components of odd Euler
  characteristic, PI.9/enriques-w1-square and E25.)
- **Proposition 0.7.** Over the real Puiseux field K = ⋃ ℝ((t^{1/n})) there is a K3 surface S with H¹(S(K), 𝔽₂) = 0 and a
  class of Br(S)[2] of index 4: the topological criterion of Theorem 0.5 fails over non-archimedean real closed fields.
- **Theorem 0.10.** If S(ℝ) = ∅, every quadratic form of rank ≥ 5 over ℝ(S) is isotropic.
- **Theorem 0.12.** Every field of transcendence degree 2 over ℝ has Elman–Lam u-invariant ≤ 4 (the maximal dimension of an
  anisotropic form with zero signature at every ordering), with equality for function fields of real surfaces.
- **Theorem 0.13.** If C is an integral curve over ℝ with C(ℝ) = ∅, every del Pezzo surface of degree 4 over ℝ(C) has a
  rational point.

Lang's conjecture (function fields of i-dimensional real varieties without real points are C_i) and Pfister's
conjecture (u(K) ≤ 2^i in transcendence degree i) are the context of Theorems 0.10 and 0.12; they are stated here only
as context and never used. Lieblich's bound ind | per² over finite fields (Theorem 0.2 of the paper) is background.

## The argument

The core is the case of period 2, Proposition 6.6. Given α of period 2 whose ramification divisor R is SNC, Benoist
builds double covers p : T → S branched along R and a moving curve D, with prescribed real topology, so that
α_{ℝ(T)} is unramified (Proposition 4.2), its topological obstruction in H³_G(T(ℂ), ℤ(1)) vanishes (Proposition 4.4), and
an integral lift β of it can be adjusted so that p_*(β − 2γ) is algebraic (Proposition 4.5). The family of such covers
contains a cover carrying a real-pointless curve C whose Noether–Lefschetz locus has the expected dimension
(Proposition 5.4); the real analogue of Green's infinitesimal criterion then moves β − 2γ into an open cone of classes
that become algebraic on a nearby real fibre, and the real Lefschetz (1,1) theorem kills α on that fibre. An induction
on the period (Proposition 6.7) gives Theorems 0.3, 0.4 and the first half of 0.5. The obstruction (Proposition 7.1, the
second half of Theorem 0.5) comes from a topological analysis of covers of even degree: trace sequences of permutation
sheaves, an alternating double cover and circle double covers detecting the first real component. Pfister's criterion
turns Theorem 0.4 into Theorem 0.12, and Amer–Brumer turns Theorem 0.10 into Theorem 0.13. Section 1 of the paper runs
the same strategy over ℂ, where Voisin's kernel-cone theorem gives a new proof of de Jong's theorem for unramified
classes.

Propositions 4.4, 4.5 and 6.6 are planned under uniform real evaluation on the avoided set Ψ: their printed proofs use,
without saying so, that the half-period class evaluates nontrivially on all of Ψ (E3), and the induction only applies them
when that evaluation is constant on Ψ. The final step of Proposition 6.6 transports the Kummer representative together
with the pair (T, p⁻¹R) (PI.6/family-pair-stratification, PI.6/kummer-lift-transport).

## What the libraries contain

Mathlib has Brauer groups of fields (`BrauerGroup`), ring preorderings and orderings (`RingPreordering`,
`RingPreordering.IsOrdering`), semireal and real closed fields (`IsSemireal`, `IsRealClosed`), quadratic forms with
anisotropy, diagonalisation and Sylvester's law over ℝ, quadratic algebras (`QuadraticAlgebra`), Clifford algebras,
Hahn and Laurent series, transcendence degree (`Algebra.trdeg`), and schemes with function fields. Tau Ceti adds the
group structure on the Brauer group of a field, base change of Brauer classes, central division representatives, the
index of a central simple algebra (`TauCeti.Algebra.index`), the Brauer group of ℝ, hyperbolic planes and base change of
quadratic forms, and the crossed-product comparison Br(K) ≅ H²(G_K, K_s^×) (`TauCeti.brauerCohomologyEquiv`). Neither
library has the Harrison topology, signatures at arbitrary orderings, the Elman–Lam invariant, corestriction or the period
and index of a Brauer class, Brauer groups of schemes, equivariant Betti cohomology of real varieties, cycle class maps or
variations of Hodge structure; the roadmap takes those from their owners or plans them here.

## Ownership

- PI.0 is the real-function-field tranche that QuadraticFormInvariantsPartII proposed as a separate roadmap
  QuadraticFormsRealFunctionFields, which does not exist; it is owned here. It also owns corestriction and the period and
  index of a Brauer class of a field, which no roadmap states: Tau Ceti has the index of a central simple algebra
  (`TauCeti.Algebra.index`) and a splitting field of that degree, ProfiniteCohomology Layer 6 the corestriction of
  profinite cohomology, and SemisimpleAlgebras Layer 6 the index through maximal subfields. PI.0 never imports PI.1–PI.9.
- Equivariant Betti and semialgebraic cohomology of real varieties, the real–complex sequences, the canonical real-locus
  decompositions, Krasnov's and Borel–Haefliger's cycle classes, equivariant purity and pushforward are
  MotivesAndAlgebraicCycles §§7.6a–7.6b; the complex and real Lefschetz (1,1) theorems are §7.8; the real Picard image and
  cl_R(K) = w₁ on real Enriques surfaces are §7.10; Gersten complexes are §0.5b.
- The specialised topology of double covers (free descent, twisted Bocksteins, the localisation splitting and the class γ,
  loop representatives, sign local systems and trace triangles, permutation quotients and trace-quotient lifts, circle
  extensions, equivariant Ehresmann and stratified pair transport, the double-cover chase, the finite-index lattice) is
  AlgebraicTopologyPartII AT2.6–AT2.16; each target consumed from it is a declared supplier gap.
- Brauer residues, purity and residues of pullbacks are HeightsRationalPointsAndObstructions §2.16b; Brauer groups of
  schemes, the Kummer sequence and Tsen's theorem are SchemeAndStackFoundations §§2.11, 2.16 and 2.22; principalization,
  SNC compactification and resolution are ResolutionOfSingularitiesCharacteristicZero §§5.1, 6.2 and 7.8; projective
  bundles and ample powers are AlgebraicModuliForArithmeticGeometry §§1.1 and 1.4; Tsen–Lang is
  QuadraticFormInvariantsPartII Q2.5 (a declared gap).
- Ehresmann's theorem, Gauss–Manin connections, relative Hodge bundles and the Artin comparison over ℂ are
  ComplexComparisonPartII §§C5.2, C5.3, C6.2 and C6.3, which is also asked for the comparison over ℝ (a declared gap); the
  carrier of variations of Hodge structure is ShimuraData §3.1; integral weak Lefschetz and the cohomological dimension of
  affine varieties are AffineMorseLefschetz §§A5 and A3.
- Enriques surfaces: the predicate is WeilConjectures WC.7 and the characteristic-zero invariants are EnriquesSurfaces
  E1a, E1c and E1d. The Puiseux field is FormalLaurentPuiseux L4; only its order and its real closedness are planned here.
- Owned here: everything specific to Benoist's argument (the double covers and their topology, the Noether–Lefschetz
  locus, the real-locus control, the splitting, the induction, the obstruction and the examples) and the inputs no
  roadmap states: the Kummer and topological Brauer sequences and Lemma 2.1 of the source, the invariance of period and
  index under extension of algebraically closed fields and de Jong's reduction to unramified classes, the variation of a
  family of surfaces with Griffiths' formula, Voisin's open cone, Green's criterion over ℝ and the Kodaira–Spencer
  factorisation, the stratification of the double-cover family, the degree-four del Pezzo model, and the classical inputs
  of Witt, Springer, Amer–Brumer, Albert, Elman–Lam, Pfister, Bröcker, Bochnak–Coste–Roy and Colliot-Thélène–Parimala.
- Propositions 4.4, 4.5 and 6.6 of the source are planned in their uniform-evaluation form
  (PI.4/uniform-obstruction-vanishing, PI.4/uniform-pushforward-adjustment, PI.6/degree-two-splitting-uniform), the only
  form the induction uses (E3).

## Conventions

ℝ is the real numbers except where an arbitrary real closed field is named (PI.0, PI.2/real-closed-norm-bound, PI.9).
G = Gal(ℂ/ℝ) acts on X(ℂ) with fixed locus X(ℝ). H^i(Y) means H^i(Y, 𝔽₂). ℤ(j) is ℤ with conjugation acting by
(−1)^j (Benoist's i^jℤ); ω ∈ H¹_G(pt, ℤ(1)) is the nonzero class. Equivariant cohomology is Borel/Grothendieck
equivariant sheaf cohomology. Br(X) = H²_ét(X, 𝔾_m) ⊂ Br(k(X)) for smooth integral X. [ξ]_i is the degree-i real component
of an equivariant class: restriction to X(ℝ), canonical decomposition H^k_G(X(ℝ), 𝔽₂) = ⊕ H^i(X(ℝ)), projection. Θ(α) is
the nonzero evaluation locus; Ψ ⊃ Θ the set a cover must avoid; Ξ = S(ℝ) ∖ Ψ. The Elman–Lam invariant counts forms of
zero signature at every ordering; for nonreal fields it is the classical u-invariant. Each target names a suggested Lean
module.

## Layers

| Layer | Content |
|---|---|
| PI.0 | orderings, real closures, signatures, Elman–Lam invariant, corestriction, period and index, Witt, Springer, Amer–Brumer, Albert, Pfister |
| PI.1 | unramified loci, Kummer and topological Brauer sequences, real evaluation, de Jong's two reductions |
| PI.2 | variations of families, unramified classes on complex surfaces (Section 1), de Jong's theorem, the norm bound |
| PI.3 | ramified double covers and their topology (Section 3) |
| PI.4 | pulling back a period-two class (Section 4) |
| PI.5 | Kodaira–Spencer factorisation, Noether–Lefschetz loci for double covers (Section 5) |
| PI.6 | real-locus control, Green's criterion over ℝ and the degree-two splitting (§§6.1–6.2) |
| PI.7 | the main theorems and the u-invariant (§§6.3–6.4) |
| PI.8 | the obstruction (Section 7) |
| PI.9 | real Enriques surfaces and the Puiseux counterexample (Section 8) |

Locators to Benoist 2019 refer to the published version (printed pages 63–110). Each target gives its
statement, hypotheses, a proof or construction outline, its uses, API and unit tests for definitions and constructions,
acceptance checks, direct prerequisites and sources.


## Layer PI.0: Real function fields: orderings, real closures and the Elman–Lam invariant

The space of orderings X\_F of a field with the Harrison topology, its compactness and inverse limits; real closures at a specified ordering (built on upstream RealAlgebraicGeometry Layer 1, `exists_realClosure`); signatures of quadratic forms at orderings; the clopen locus of orderings where a Brauer class survives; the Elman–Lam u-invariant (zero total signature); corestriction and the period and index of a Brauer class; the u-invariant of a real curve function field is ≤ 2; Witt's theorem on Brauer classes of real curves (classes vanishing at all real closures, or at a dense set of real points, are zero, ramified or not); Springer's theorem over complete discretely valued fields; the Amer–Brumer theorem; Albert's isotropy criterion for Albert forms; the Elman–Lam bound for fields with u(F(√−1)) ≤ 4; Pfister's criterion (index two for real-closure-trivial classes implies u ≤ 4) in transcendence degree 2. This layer is the real-function-field tranche that QuadraticFormInvariantsPartII proposed as QuadraticFormsRealFunctionFields; it never imports the applications of PI.7.

*Builds on:* ProfiniteCohomology Layer 6; QuadraticFormInvariantsPartII Q2.5/transcendental-ci (gap:q2-tsen-lang); SchemeAndStackFoundations §2.16; Tau Ceti roadmap `TauCetiRoadmap/QuadraticFormInvariants#layer-0-square-classes-diagonal-calculus-and-chain-equivalence`; Tau Ceti roadmap `TauCetiRoadmap/QuadraticFormInvariants#layer-1-hyperbolic-planes-and-witt-theory`; Tau Ceti roadmap `TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion`; Tau Ceti roadmap `TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`; Tau Ceti roadmap `TauCetiRoadmap/QuadraticFormInvariants#layer-5-the-brauer-valued-invariants`; Tau Ceti roadmap `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-6-the-brauer-group-and-splitting-fields`.

<a id="pi-0-ordering-space"></a>

### The space of orderings with the Harrison topology

`PI.0/ordering-space` · definition

For a field F, the space of orderings X\_F is the set of positive cones P ⊂ F of field orderings, that is the ring preorderings P of F with P ∪ (−P) = F and P ∩ (−P) = {0} (Mathlib's RingPreordering with RingPreordering.IsOrdering). For a ∈ Fˣ write a >\_P 0 when a ∈ P, and H(a) = {P ∈ X\_F : a >\_P 0}. The Harrison topology on X\_F is the topology generated by the sets H(a), a ∈ Fˣ. A field embedding ι : F → L induces the restriction map X\_L → X\_F, Q ↦ ι⁻¹(Q). X\_F is empty exactly when F is nonreal, that is when −1 is a sum of squares in F.

**Hypotheses and conventions.** F is a field; orderings are positive cones of total orders compatible with the field operations. The topology is generated by the subbasis H(a), a ∈ Fˣ; complements H(a)ᶜ = H(−a) are again basic.

**Construction.**

1. Take the subtype of RingPreordering F satisfying RingPreordering.IsOrdering; H(a) is the set of P containing a.
2. The complement of H(a) in X\_F is H(−a), because for a ≠ 0 exactly one of a, −a lies in P; so each H(a) is clopen.
3. Restriction along ι sends an ordering Q of L to ι⁻¹(Q), an ordering of F, and pulls H(a) back to H(ι a); hence it is continuous.
4. Emptiness: an ordering contains all sums of squares and not −1; conversely if −1 is not a sum of squares, the sums of squares form a proper preordering, contained in an ordering by Zorn (the preordering-extension lemma of upstream RealAlgebraicGeometry Layer 1, which uses Mathlib's RingPreordering API).

**Uses.** Benoist 2019, §6.4, pp. 95–96: the sets Z\_i of orderings where a Brauer class survives are closed subsets of the compact space X\_{K\_i}. PI.0/signature-at-ordering: signatures are functions on X\_F. PI.0/elman-lam-u: the Elman–Lam invariant quantifies over all of X\_F. PI.0/brauer-nonvanishing-locus: the nonvanishing locus of a Brauer class is a clopen subset of X\_F.

**API.**

- `RealFunctionField.OrderingSpace` (data): The type of orderings of F, the subtype of RingPreordering F cut out by RingPreordering.IsOrdering.
- `RealFunctionField.OrderingSpace.harrisonSet` (constructor): H(a) = {P : a ∈ P} for a ∈ Fˣ.
- `RealFunctionField.OrderingSpace.instTopologicalSpace` (instance): The Harrison topology, generated by the sets H(a).
- `RealFunctionField.OrderingSpace.isClopen_harrisonSet` (characterisation): Each H(a) is clopen, with complement H(−a).
- `RealFunctionField.OrderingSpace.restrict` (functoriality): A field embedding ι : F →+\* L gives a continuous map X\_L → X\_F, Q ↦ ι⁻¹(Q), with restrict id = id and restrict (ι' ∘ ι) = restrict ι ∘ restrict ι'.
- `RealFunctionField.OrderingSpace.restrict_preimage_harrisonSet` (simp): restrict ι ⁻¹' H(a) = H(ι a).
- `RealFunctionField.OrderingSpace.isEmpty_iff` (characterisation): X\_F is empty iff ¬ IsSemireal F, that is iff −1 is a sum of squares.
- `RealFunctionField.OrderingSpace.sign` (data): sign\_P(a) ∈ {±1} for a ∈ Fˣ, with sign\_P(ab) = sign\_P(a) sign\_P(b) and sign\_P(c²) = 1.
- `RealFunctionField.OrderingSpace.ofLinearOrder` (compatibility): A linear order making F a strictly ordered ring gives the ordering {a : 0 ≤ a}, and every ordering arises this way.

**Unit tests.**

- `RealFunctionField.OrderingSpace.subsingleton_real` (computation): OrderingSpace ℝ has exactly one element, the cone of nonnegative reals.
- `RealFunctionField.OrderingSpace.isEmpty_complex` (degenerate): OrderingSpace ℂ is empty.
- `RealFunctionField.OrderingSpace.card_sqrt_two` (computation): For K = ℚ(√2) (any field with finrank ℚ K = 2 containing a square root of 2), OrderingSpace K has exactly two elements.
- `RealFunctionField.OrderingSpace.sumSq_not_ordering` (non-example): The preordering of sums of squares of the rational function field ℝ(t) is not an ordering: neither t nor −t is a sum of squares.

**Acceptance.** X\_ℝ consists of one point, the cone of nonnegative reals. X\_ℂ is empty, since −1 is a square. X\_{ℚ(√2)} has exactly two points, distinguished by the sign of √2.

**Direct prerequisites:** `RingPreordering` (Mathlib); `RingPreordering.IsOrdering` (Mathlib); `IsSemireal` (Mathlib); `TopologicalSpace.generateFrom` (Mathlib).

**Source:** BCR, Example 7.1.4 a), p. 135: The real spectrum of a field is its set of orderings with the Harrison topology; it is nonempty exactly when the field is real. B19, §6.4, p. 95: The proof of Theorem 0.12 uses the space of orderings of each finite extension K\_i with the Harrison topology. EKM, §33, p. 133: The order space of a formally real field and continuous functions on it, used for the total signature.

*Suggested home:* `TauCeti/FieldTheory/Ordering/RealFunctionField/Harrison`, namespace `TauCeti.RealFunctionField`.

<a id="pi-0-harrison-compact"></a>

### Compactness of the Harrison space and inverse limits

`PI.0/harrison-compact` · theorem

For every field F the space X\_F is compact, Hausdorff and totally disconnected. If F is the directed union of subfields F\_i, the restriction maps identify X\_F with the inverse limit of the X\_{F\_i}; consequently, if Z\_i ⊂ X\_{F\_i} are closed subsets with restriction mapping Z\_j into Z\_i for F\_i ⊂ F\_j, and the inverse limit of the Z\_i is empty, then some Z\_i is empty.

**Hypotheses and conventions.** F is a field; the F\_i form a directed family of subfields with union F.

**Proof.**

1. Embed X\_F into the product {±1}^{Fˣ} by P ↦ (sign\_P(a))\_a; the image is closed, being cut out by the cone axioms, each of which involves finitely many coordinates.
2. Tychonoff gives compactness; the product is Hausdorff and totally disconnected, and so is the closed subspace.
3. An ordering of F is the union of its restrictions to the F\_i, and compatible orderings of the F\_i glue, so X\_F → lim X\_{F\_i} is a continuous bijection of compact Hausdorff spaces, hence a homeomorphism.
4. An inverse limit of nonempty compact Hausdorff spaces is nonempty; so empty limit forces some Z\_i to be empty.

**Acceptance.** For F = ℝ(t) the space X\_F is infinite and compact. For the directed union of the finite extensions K\_i of a finitely generated K\_0 ⊂ K, the limit statement is exactly the Tychonoff step of Benoist p. 96.

**Direct prerequisites:** [The space of orderings with the Harrison topology](#pi-0-ordering-space); `isCompact_univ_pi` (Mathlib); `IsClosed` (Mathlib).

**Source:** BCR, Example 7.1.4 a), p. 135; Proposition 7.1.7, p. 136: The space of orderings with the Harrison topology is compact, totally disconnected and Hausdorff; ring maps induce continuous maps of real spectra. B19, §6.4, p. 96: The closed sets Z\_i are compact and Tychonoff's theorem gives an index with Z\_i empty.

*Suggested home:* `TauCeti/FieldTheory/Ordering/RealFunctionField/Harrison`, namespace `TauCeti.RealFunctionField`.

<a id="pi-0-real-closure-at-ordering"></a>

### Real closure at a specified ordering

`PI.0/real-closure-at-ordering` · definition

For a field F and an ordering P ∈ X\_F, a real closure of F at P is a field R with IsRealClosed R together with a ring homomorphism ι : F → R making R algebraic over F, such that ι(P) is contained in the set of squares of R (equivalently ι is order-preserving for P and the unique ordering of R). Every pair (F, P) has a real closure. A class β ∈ Br(F) vanishes at P if β becomes trivial in Br(R) for every real closure (R, ι) at P; it vanishes at all real closures if this holds for every P.

**Hypotheses and conventions.** F a field, P an ordering of F; R real closed; ι algebraic. No uniqueness of the real closure is used: the vanishing predicates quantify over all real closures at P.

**Construction.**

1. Existence: convert P into a linear order on F with LinearOrder.mkOfAddGroupCone and IsOrderedRing.mkOfCone, then apply the upstream RealAlgebraicGeometry Layer 1 target exists\_realClosure, which gives an algebraic ordered real closure with a strictly monotone embedding.
2. Strict monotonicity sends P into the nonnegative elements of R, which are the squares of R because R is real closed (IsRealClosed.isSquare\_neg\_of\_not\_isSquare).
3. Brauer groups restrict along ι by TauCeti.BrauerGroup.baseChange; for real closed R, Br(R) has two elements, the trivial class and the quaternion class (−1,−1), because R(i) is algebraically closed and Br(R(i)/R) ≅ Rˣ/(R(i)ˣ norms) = Rˣ/R\_{>0}.

**Uses.** Benoist 2019, §6.4, p. 95: the hypothesis of Pfister's criterion: α vanishes over every real closure of K. PI.0/brauer-nonvanishing-locus: the set of orderings where a class survives over a real closure. PI.0/pfister-brauer-criterion: the real-closure vanishing hypothesis. PI.7/real-closure-pointwise-triviality: a real point of a surface gives a real closure of the function field through iterated Puiseux series.

**API.**

- `RealFunctionField.RealClosureAt` (structure): A real closed field R, a ring map ι : F →+\* R with R algebraic over F, and ι(P) ⊆ squares of R.
- `RealFunctionField.RealClosureAt.nonempty` (constructor): Every ordering P of F has a real closure (from upstream exists\_realClosure).
- `RealFunctionField.RealClosureAt.ordering_eq` (characterisation): ι⁻¹ of the cone of squares of R is P.
- `RealFunctionField.RealClosureAt.ofIsRealClosed` (constructor): If F is real closed, (F, id) is a real closure at its unique ordering.
- `RealFunctionField.RealClosureAt.restrict` (functoriality): A real closure of L at Q, composed with F → L, is a real closure of F at the restricted ordering when L/F is algebraic.
- `RealFunctionField.brauerGroup_realClosed` (equivalence): For real closed R, Br(R) ≃\* Multiplicative (ZMod 2), generated by the class of the quaternion algebra (−1,−1); for R = ℝ this is Tau Ceti's TauCeti.Quaternion.brauerGroupMulEquiv.
- `RealFunctionField.VanishesAtRealClosures` (data): The predicate on β ∈ Br(F): for every P and every real closure (R, ι) at P, baseChange ι β = 1.

**Unit tests.**

- `RealFunctionField.RealClosureAt.real_self` (computation): (ℝ, RingHom.id ℝ) is a RealClosureAt of ℝ at the cone of nonnegative reals.
- `RealFunctionField.VanishesAtRealClosures.of_not_isSemireal` (degenerate): If F is nonreal, every β ∈ Br(F) vanishes at all real closures (there are no orderings).
- `RealFunctionField.VanishesAtRealClosures.quaternion_real` (non-example): Over F = ℝ the Hamilton quaternion class does not vanish at all real closures.
- `RealFunctionField.brauerGroup_realClosed_real` (compatibility): For R = ℝ the equivalence brauerGroup\_realClosed agrees with TauCeti.Quaternion.brauerGroupMulEquiv.

**Acceptance.** (ℝ, id) is a real closure of ℝ at its unique ordering. The real algebraic numbers with the inclusion form a real closure of ℚ at its unique ordering. ℂ with an embedding of ℝ is not a real closure: it is not real closed.

**Direct prerequisites:** [The space of orderings with the Harrison topology](#pi-0-ordering-space); `IsRealClosed` (Mathlib); `IsRealClosed.isSquare_neg_of_not_isSquare` (Mathlib); `Algebra.IsAlgebraic` (Mathlib); `TauCeti.BrauerGroup.baseChange` (Tau Ceti); `TauCeti.Quaternion.brauerGroupMulEquiv` (Tau Ceti).

**Source:** B19, §6.4, p. 95: Pfister's criterion is phrased through Brauer classes vanishing over all real closures of K. BCR, §1.3 and Example 7.1.4 a), pp. 9–14, 135: Real closures of ordered fields and orderings as points of the real spectrum of a field.

*Suggested home:* `TauCeti/FieldTheory/Ordering/RealFunctionField/RealClosure`, namespace `TauCeti.RealFunctionField`.

<a id="pi-0-signature-at-ordering"></a>

### Signature of a quadratic form at an ordering

`PI.0/signature-at-ordering` · definition

Let F be a field of characteristic 0, q a nondegenerate quadratic form on a finite-dimensional F-vector space and P ∈ X\_F. The signature sign\_P(q) ∈ ℤ is #{i : a\_i >\_P 0} − #{i : a\_i <\_P 0} for any orthogonal diagonalisation q ≅ ⟨a\_1, …, a\_n⟩. It does not depend on the diagonalisation (Sylvester's law of inertia over an ordered field). The form q has zero total signature if sign\_P(q) = 0 for every P ∈ X\_F; for nonreal F this condition is empty.

**Hypotheses and conventions.** char F = 0 (2 invertible suffices); q nondegenerate on a finite-dimensional space. Diagonalisations are those of Mathlib's QuadraticForm.equivalent\_weightedSumSquares\_units\_of\_nondegenerate'.

**Construction.**

1. Diagonalise q over F (Mathlib, nondegenerate case).
2. Base change to a real closure (R, ι) at P (PI.0/real-closure-at-ordering): positive diagonal entries become squares, so q\_R ≅ ⟨1,…,1,−1,…,−1⟩ with r entries 1 and s entries −1.
3. Sylvester's law over the ordered field R: r is the largest dimension of a subspace on which q\_R is positive definite, so r and s are independent of the diagonalisation; this is the argument of Mathlib's real classification, run over R.
4. Additivity under orthogonal sums, multiplicativity under tensor products and invariance under isometry follow from diagonal calculus (upstream QuadraticFormInvariants Layers 0–1); local constancy in P holds because each sign\_P(a\_i) is constant on H(a\_i) and on H(−a\_i).

**Uses.** Benoist 2019, §0.5 and §6.4, pp. 66, 96: zero-signature forms are the forms counted by the Elman–Lam invariant; the form ⟨1, y₁, −y₂, −y₁y₂⟩ has zero signatures. PI.0/elman-lam-u: definition of the invariant. PI.0/brauer-nonvanishing-locus: the signature of the reduced trace form detects whether a Brauer class survives at P. PI.0/pfister-brauer-criterion: a zero-signature form becomes hyperbolic over every real closure.

**API.**

- `RealFunctionField.signatureAt` (data): sign\_P(q) ∈ ℤ for a nondegenerate quadratic form q and an ordering P.
- `RealFunctionField.signatureAt_weightedSumSquares` (simp): On ⟨a\_1,…,a\_n⟩ with units a\_i, the signature is Σ sign\_P(a\_i).
- `RealFunctionField.signatureAt_congr` (characterisation): Isometric forms have equal signatures (Sylvester's law).
- `RealFunctionField.signatureAt_prod` (relation): sign\_P(q ⊥ q') = sign\_P(q) + sign\_P(q').
- `RealFunctionField.signatureAt_smul` (relation): sign\_P(a·q) = sign\_P(a)·sign\_P(q) for a ∈ Fˣ.
- `RealFunctionField.signatureAt_hyperbolicPlane` (simp): sign\_P(H) = 0.
- `RealFunctionField.signatureAt_baseChange` (compatibility): sign\_P(q) equals the signature of q\_R over a real closure (R, ι) at P.
- `RealFunctionField.signatureAt_continuous` (other): P ↦ sign\_P(q) is locally constant on X\_F.
- `RealFunctionField.signatureAt_modTwo` (relation): sign\_P(q) ≡ dim q (mod 2) and |sign\_P(q)| ≤ dim q.
- `RealFunctionField.HasZeroSignatures` (data): The predicate: sign\_P(q) = 0 for every P ∈ X\_F.

**Unit tests.**

- `RealFunctionField.signatureAt_one_one_real` (computation): Over ℝ, the signature of ⟨1,1⟩ is 2.
- `RealFunctionField.signatureAt_hyperbolic_zero` (degenerate): The hyperbolic plane has signature 0 at every ordering of every real field.
- `RealFunctionField.signatureAt_real_eq_sylvester` (compatibility): Over ℝ, signatureAt agrees with the count of +1 minus −1 weights in QuadraticForm.equivalent\_signType\_weighted\_sum\_squared.
- `RealFunctionField.signatureAt_not_rank` (non-example): ⟨1,1⟩ and ⟨1,−1⟩ have equal rank over ℝ but signatures 2 and 0.

**Acceptance.** sign(⟨1,1⟩) = 2 over ℝ. The hyperbolic plane has signature 0 at every ordering. Over ℝ(t), ⟨1, −t⟩ has signature 0 at orderings with t > 0 and 2 at orderings with t < 0.

**Direct prerequisites:** [The space of orderings with the Harrison topology](#pi-0-ordering-space); [Real closure at a specified ordering](#pi-0-real-closure-at-ordering); `QuadraticForm.equivalent_weightedSumSquares_units_of_nondegenerate'` (Mathlib); `QuadraticForm.equivalent_signType_weighted_sum_squared` (Mathlib); `TauCeti.hyperbolicPlane` (Tau Ceti); Tau Ceti roadmap `TauCetiRoadmap/QuadraticFormInvariants#layer-0-square-classes-diagonal-calculus-and-chain-equivalence`; Tau Ceti roadmap `TauCetiRoadmap/QuadraticFormInvariants#layer-1-hyperbolic-planes-and-witt-theory`; Tau Ceti roadmap `TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`.

**Source:** EKM, §33, pp. 133–137: Signatures at orderings and the total signature of forms over a formally real field, as continuous functions on the order space. B19, §0.5, p. 66: The Elman–Lam invariant counts anisotropic forms whose signature at every ordering is trivial.

*Suggested home:* `TauCeti/FieldTheory/Ordering/RealFunctionField/Signature`, namespace `TauCeti.RealFunctionField`.

<a id="pi-0-brauer-nonvanishing-locus"></a>

### The locus where a Brauer class survives is clopen

`PI.0/brauer-nonvanishing-locus` · theorem

Let F be a field of characteristic 0 and β ∈ Br(F). For an ordering P, whether β becomes trivial over a real closure at P does not depend on the real closure, and the set Z(β) = {P ∈ X\_F : β does not vanish at P} is clopen in X\_F. For a field extension L/F, Z(β\_L) is the preimage of Z(β) under restriction X\_L → X\_F.

**Hypotheses and conventions.** char F = 0; β ∈ Br(F) represented by a central simple algebra A of degree d.

**Proof.**

1. Let T\_A be the reduced trace form x ↦ Trd(x²) on A, a nondegenerate quadratic form of dimension d² over F.
2. Over a real closed field R, A\_R ≅ M\_d(R) or M\_{d/2}(ℍ\_R); the trace form of M\_d(R) has signature d (symmetric minus antisymmetric matrices), and that of ℍ\_R is 2⟨1,−1,−1,−1⟩ of signature −2, so the trace form of M\_{d/2}(ℍ\_R) has signature −d.
3. Hence β vanishes at P iff sign\_P(T\_A) = d, a condition independent of the real closure (PI.0/signature-at-ordering).
4. P ↦ sign\_P(T\_A) is locally constant, so Z(β) = {P : sign\_P(T\_A) = −d} is clopen.
5. Restriction: (T\_A)\_L = T\_{A\_L} and a real closure of L at Q is one of F at the restricted ordering when composed with F → L, which gives Z(β\_L) = res⁻¹ Z(β).

**Acceptance.** Over ℝ, Z of the quaternion class is the whole one-point space. For β = (−1, t) over ℝ(t), Z(β) = H(−t), the orderings with t < 0.

**Direct prerequisites:** [The space of orderings with the Harrison topology](#pi-0-ordering-space); [Real closure at a specified ordering](#pi-0-real-closure-at-ordering); [Signature of a quadratic form at an ordering](#pi-0-signature-at-ordering); [Compactness of the Harrison space and inverse limits](#pi-0-harrison-compact); `TauCeti.BrauerGroup.baseChange` (Tau Ceti); `TauCeti.BrauerGroup.exists_eq_mk_centralDivisionRing` (Tau Ceti); Tau Ceti roadmap `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-6-the-brauer-group-and-splitting-fields`.

**Source:** B19, §6.4, p. 96, citing Arason 1975, Hilfssatz 2: The set of orderings where the class survives over the associated real closure is closed, hence compact. ARA75, Hilfssatz 2 (not read; cited at Benoist's locator): Closedness of the nonvanishing locus of a mod-2 cohomology class on the space of orderings.

*Suggested home:* `TauCeti/FieldTheory/Ordering/RealFunctionField/BrauerLocus`, namespace `TauCeti.RealFunctionField`.

<a id="pi-0-elman-lam-u"></a>

### The Elman–Lam u-invariant

`PI.0/elman-lam-u` · definition

For a field F of characteristic 0, u(F) ∈ ℕ ∪ {∞} is the supremum of dim q over nondegenerate anisotropic quadratic forms q over F with zero total signature (sign\_P(q) = 0 for every P ∈ X\_F); the zero form counts with dimension 0. For nonreal F the signature condition is empty and u(F) is the classical maximal dimension of an anisotropic form. By definition u(F) ≤ n iff every nondegenerate form of dimension > n with zero total signature is isotropic.

**Hypotheses and conventions.** char F = 0. The supremum is taken in ℕ∞; forms with nonzero signature somewhere are not counted.

**Construction.**

1. Define the set of dimensions of anisotropic zero-signature forms and take its supremum in ℕ∞.
2. The characterisation of u(F) ≤ n is the definition of the supremum; isotropy is the negation of Mathlib's QuadraticMap.Anisotropic.
3. For nonreal F, HasZeroSignatures holds for every form because X\_F is empty (PI.0/ordering-space).

**Uses.** Benoist 2019, Theorems 0.10 and 0.12, p. 66: the bound u(K) ≤ 4 and the equality u(R(S)) = 4. PI.0/pfister-brauer-criterion: the conclusion u(K) ≤ 4. PI.0/elman-lam-c2-bound: the value set {0,1,2,4,6} when u(K(i)) ≤ 4. PI.7/rank-five-isotropy: for nonreal K the invariant is the classical one.

**API.**

- `RealFunctionField.elmanLamU` (data): u(F) : ℕ∞, the supremum of dimensions of anisotropic zero-signature forms.
- `RealFunctionField.elmanLamU_le_iff` (characterisation): u(F) ≤ n iff every nondegenerate zero-signature form of dimension > n is isotropic.
- `RealFunctionField.le_elmanLamU` (constructor): An anisotropic zero-signature form of dimension m gives m ≤ u(F).
- `RealFunctionField.elmanLamU_of_not_isSemireal` (compatibility): For nonreal F, u(F) is the supremum of dimensions of all anisotropic nondegenerate forms.
- `RealFunctionField.elmanLamU_of_isRealClosed` (simp): u(R) = 0 for real closed R.

**Unit tests.**

- `RealFunctionField.elmanLamU_complex` (computation): u(ℂ) = 1.
- `RealFunctionField.elmanLamU_real` (degenerate): u(ℝ) = 0.
- `RealFunctionField.elmanLamU_ratFunc_real` (computation): u(ℝ(t)) = 2: ⟨1, −(1 + t²)⟩ is anisotropic with zero signatures, and EKM Corollary 37.8 bounds u by 2.
- `RealFunctionField.sumSquares_not_counted` (non-example): Over ℝ(t), n⟨1⟩ is anisotropic for every n but has signature n everywhere, so the classical anisotropic-dimension supremum is ∞ while u(ℝ(t)) = 2.

**Acceptance.** u(ℂ) = 1. u(ℝ) = 0: a zero-signature form over ℝ is hyperbolic. u(ℝ(t)) = 2.

**Direct prerequisites:** [Signature of a quadratic form at an ordering](#pi-0-signature-at-ordering); [The space of orderings with the Harrison topology](#pi-0-ordering-space); `QuadraticMap.Anisotropic` (Mathlib); `ENat` (Mathlib).

**Source:** B19, §0.5, p. 66: Elman–Lam's generalisation of the u-invariant to real fields: maximal rank of an anisotropic form whose signature at every ordering is trivial. EKM, §37, p. 165: The u-invariant of a formally real field, defined through anisotropic torsion forms (equivalently, by Pfister's local–global principle, zero total signature). BEC05, §2, p. 2: u(F) is the supremum of dimensions of anisotropic torsion forms (Elman–Lam).

*Suggested home:* `TauCeti/FieldTheory/Ordering/RealFunctionField/UInvariant`, namespace `TauCeti.RealFunctionField`.

<a id="pi-0-curve-u-bound"></a>

### The u-invariant of a real curve function field

`PI.0/curve-u-bound` · theorem

If F has transcendence degree 1 over a real closed field, then u(F) ≤ 2. In particular, for every integral curve C over ℝ, every nondegenerate quadratic form of dimension ≥ 3 over ℝ(C) with zero total signature is isotropic.

**Hypotheses and conventions.** F/R of transcendence degree 1 with R real closed; char 0.

**Proof.**

1. F(√−1) has transcendence degree 1 over the algebraically closed field R(√−1), hence is C₁ by Tsen–Lang (QuadraticFormInvariantsPartII Q2.5/transcendental-ci, gap:q2-tsen-lang), so u(F(√−1)) ≤ 2.
2. Elman–Lam's comparison of u(F) with u(F(√−1)) for the quadratic extension F(√−1)/F, in the refined form EKM proves, gives u(F) ≤ 2.

**Acceptance.** u(ℝ(t)) ≤ 2, attained by ⟨1, −(1 + t²)⟩.

**Direct prerequisites:** [The Elman–Lam u-invariant](#pi-0-elman-lam-u); QuadraticFormInvariantsPartII Q2.5/transcendental-ci (gap:q2-tsen-lang).

**Source:** EKM, Corollary 37.8, p. 169: A field of transcendence degree one over a real closed field has u-invariant at most 2. BEC05, §1, p. 1: F(√−1) is C\_n for F of transcendence degree n over a real closed field, and the Elman–Lam bounds follow.

*Suggested home:* `TauCeti/FieldTheory/Ordering/RealFunctionField/UInvariant`, namespace `TauCeti.RealFunctionField`.

<a id="pi-0-witt-real-curve"></a>

### Witt's theorem on Brauer classes of real curves

`PI.0/witt-real-curve` · theorem

Let C be a smooth integral curve over ℝ with function field F = ℝ(C). (a) A class β ∈ Br(F) that vanishes at every real closure of F is zero. (b) If β is unramified at the points of a Euclidean-dense subset W of C(ℝ) and β(x) = 0 ∈ Br(ℝ) for x ∈ W, then β vanishes at every real closure, hence β = 0; the class may be ramified elsewhere. (c) If C(ℝ) = ∅, then F is nonreal and Br(F) = 0.

**Hypotheses and conventions.** C smooth, integral, of finite type and separated over ℝ; ramification of β at finitely many points is allowed. W ⊂ C(ℝ) dense for the Euclidean topology; evaluation at x ∈ W uses the unramified locus of PI.1/unramified-locus.

**Proof.**

1. Tsen: Br(ℂ(C)) = 0 (SchemeAndStackFoundations §2.16, `tsen_theorem`), so β is split by the quadratic extension F(i)/F and equals the quaternion class (−1, f) for some f ∈ Fˣ (cyclic algebras; upstream QuadraticFormInvariants Layers 2 and 5).
2. At an ordering P, β vanishes over the real closure iff f >\_P 0 (PI.0/real-closure-at-ordering, Br(R) = {0, (−1,−1)}).
3. (a) If f is positive at every ordering, the norm form ⟨1, 1, −f, −f⟩ of (−1, f) has zero total signature; by PI.0/curve-u-bound it is isotropic, so (−1, f) splits.
4. (b) Every ordering of F is centred at a real point of the smooth completion of C and is determined by a half-branch there; the sign of f at the ordering is its sign on that half-branch near the centre. Since W is dense, f > 0 near every real point along every half-branch, so f >\_P 0 for every P and (a) applies.
5. (c) If C(ℝ) = ∅, the smooth completion has no real points outside a finite set, so there are no half-branches and no orderings: F is nonreal, and (a) holds vacuously for every β.

**Acceptance.** Br(ℝ(C)) = 0 for the conic C : x² + y² = −1. Over ℝ(t), the class (−1, t) is nonzero: it does not vanish at the orderings with t < 0, matching (a). Over ℝ(t), the class (−1, 1 + t²) is zero, consistent with (b): it evaluates to 0 at every real point.

**Direct prerequisites:** [Real closure at a specified ordering](#pi-0-real-closure-at-ordering); [Signature of a quadratic form at an ordering](#pi-0-signature-at-ordering); [The u-invariant of a real curve function field](#pi-0-curve-u-bound); SchemeAndStackFoundations §2.16 (`tsen_theorem`); Tau Ceti roadmap `TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion`; Tau Ceti roadmap `TauCetiRoadmap/QuadraticFormInvariants#layer-5-the-brauer-valued-invariants`.

**Source:** B19, Proposition 4.2 proof, p. 80: A class over the function field of a real curve whose evaluations vanish at general real points is the class of a conic, and the conic is split. EKM, Corollary 37.8, p. 169: The bound u ≤ 2 in transcendence degree one over a real closed field. BCR, §10.3, pp. 254–256: Half-branches of real algebraic curves as points of the real spectrum of the function field.

*Suggested home:* `TauCeti/FieldTheory/Ordering/RealFunctionField/WittCurve`, namespace `TauCeti.RealFunctionField`.

<a id="pi-0-springer-complete-dvr"></a>

### Springer's theorem for complete discretely valued fields

`PI.0/springer-complete-dvr` · theorem

Let K be a complete discretely valued field with residue field k of characteristic ≠ 2 and uniformizer π. A diagonal form q = ⟨u\_1, …, u\_r⟩ ⊥ π⟨v\_1, …, v\_s⟩ with units u\_i, v\_j is anisotropic over K iff both residue forms ⟨ū\_1, …, ū\_r⟩ and ⟨v̄\_1, …, v̄\_s⟩ are anisotropic over k. Applied twice, the form ⟨1, y₁, −y₂, −y₁y₂⟩ is anisotropic over the iterated Laurent series field ℂ((y₁))((y₂)).

**Hypotheses and conventions.** K complete for a discrete valuation; char k ≠ 2; all u\_i, v\_j units.

**Proof.**

1. If a residue form is isotropic, Hensel's lemma (completeness, char k ≠ 2) lifts a nonsingular zero to a zero of the corresponding unit form, so q is isotropic.
2. Conversely, if q(x) = 0 with x primitive, compare valuations: the unit part and the π-part cannot cancel unless both reductions have a nontrivial zero; this is the anisotropy of reductions of anisotropic unimodular forms over a complete DVR.
3. The Witt-ring form: the two residue homomorphisms give a split exact sequence identifying W(K) with W(k) ⊕ W(k).
4. For ℂ((y₁))((y₂)): write ⟨1, y₁⟩ ⊥ (−y₂)⟨1, y₁⟩; both residue forms are ⟨1, y₁⟩ up to sign over ℂ((y₁)), which is anisotropic by the same theorem since ⟨1⟩ is anisotropic over ℂ.

**Acceptance.** ⟨1, t⟩ is anisotropic over ℂ((t)): its two residue forms ⟨1⟩ and ⟨1⟩ are anisotropic over ℂ. By contrast ⟨1, 1⟩ is isotropic over ℂ((t)), its first residue form ⟨1, 1⟩ being isotropic over ℂ. ⟨1, −1⟩ is isotropic over every K, and its residue form ⟨1, −1⟩ is isotropic.

**Direct prerequisites:** `QuadraticMap.Anisotropic` (Mathlib); `IsDiscreteValuationRing` (Mathlib); `HenselianLocalRing` (Mathlib); Tau Ceti roadmap `TauCetiRoadmap/QuadraticFormInvariants#layer-1-hyperbolic-planes-and-witt-theory`.

**Source:** EKM, Lemma 19.4, Lemma 19.10 and Exercise 19.15, pp. 80–82: Anisotropic forms over a complete DVR have anisotropic reductions; the two residue homomorphisms of the Witt ring; split exactness for complete DVRs with residue characteristic ≠ 2. B19, §6.4, p. 96, citing Springer 1955: The form ⟨1, y₁, −y₂, −y₁y₂⟩ is anisotropic over C((y₁))((y₂)) by Springer's results. SPR55, Springer 1955 (not read; cited at Benoist's locator): Springer's theorem on quadratic forms over complete discretely valued fields.

*Suggested home:* `TauCeti/FieldTheory/Ordering/RealFunctionField/Springer`, namespace `TauCeti.RealFunctionField`.

<a id="pi-0-amer-brumer"></a>

### The Amer–Brumer theorem

`PI.0/amer-brumer` · theorem

Let F be any field and φ, ψ quadratic forms on the same finite-dimensional F-vector space V. Then φ and ψ have a common nonzero isotropic vector in V iff the form φ + tψ on V ⊗ F(t) over the rational function field F(t) is isotropic.

**Hypotheses and conventions.** F arbitrary, including characteristic 2 (Leep's case of EKM Theorem 17.14); a form is isotropic when it has a nonzero zero; φ, ψ on the same space V.

**Proof.**

1. A common zero v gives the constant vector v with (φ + tψ)(v) = 0.
2. Conversely take a nonzero polynomial vector v(t) ∈ V\[t] with (φ + tψ)(v) = 0 of minimal degree; a degree-reduction argument (EKM Theorem 17.14) shows deg v = 0, and then the coefficients of 1 and t give φ(v) = ψ(v) = 0.

**Acceptance.** Over ℝ, φ = ⟨1, −1⟩ and ψ = ⟨1, −1⟩ share the isotropic vector (1, 1), and φ + tψ = (1 + t)⟨1, −1⟩ is isotropic over ℝ(t). Over ℝ, φ = ⟨1, 1⟩ and ψ = ⟨1, −1⟩ have no common nonzero zero, and φ + tψ = ⟨1 + t, 1 − t⟩ is anisotropic over ℝ(t), since −(1 + t)/(1 − t) is not a square there. For two forms in five variables over ℝ(C) with C(ℝ) = ∅, isotropy of φ + tψ over ℝ(C)(t) gives a rational point of their intersection. In characteristic 2, over 𝔽₂, φ = ψ = x² + xy + y² (the norm form of 𝔽₄) have no common nonzero zero, and φ + tψ = (1 + t)(x² + xy + y²) is anisotropic over 𝔽₂(t), because 𝔽₄ ⊗ 𝔽₂(t) is still a field.

**Direct prerequisites:** `QuadraticMap.Anisotropic` (Mathlib); `RatFunc` (Mathlib).

**Source:** EKM, Theorem 17.14, p. 74: The form φ + tψ over F(t) is isotropic iff φ and ψ have a common isotropic vector; due to Amer and Brumer, and Leep in all characteristics. B19, §0.5, p. 66: By the Amer–Brumer theorem, Theorem 0.10 implies that pairs of forms of rank ≥ 5 over the function field of a real curve without real points have a common zero.

*Suggested home:* `TauCeti/FieldTheory/Ordering/RealFunctionField/AmerBrumer`, namespace `TauCeti.RealFunctionField`.

<a id="pi-0-brauer-corestriction"></a>

### Corestriction of Brauer classes

`PI.0/brauer-corestriction` · construction

For a finite separable field extension L/K, the corestriction cor\_{L/K} : Br(L) → Br(K) is the group homomorphism that corresponds, under the crossed-product comparisons Br(L) ≅ H²(G\_L, K\_s^×) and Br(K) ≅ H²(G\_K, K\_s^×) (TauCeti.brauerCohomologyEquiv, after fixing a K-embedding of L into a separable closure K\_s), to the corestriction of continuous cohomology along the open subgroup G\_L ⊂ G\_K of index \[L : K]. It satisfies cor\_{L/K}(α\_L) = \[L : K]·α for every α ∈ Br(K), and cor\_{M/K} = cor\_{L/K} ∘ cor\_{M/L} for a tower M/L/K.

**Hypotheses and conventions.** L/K finite separable; in characteristic 0 every finite extension. The result does not depend on the chosen embedding of L into K\_s. Restriction Br(K) → Br(L) is TauCeti.BrauerGroup.baseChange; Br is written additively.

**Construction.**

1. A K-embedding L ↪ K\_s makes K\_s a separable closure of L and G\_L an open subgroup of G\_K of index \[L : K].
2. TauCeti.brauerCohomologyEquiv intertwines base change of Brauer classes with restriction of cohomology from G\_K to G\_L: for a finite Galois M ⊇ L inside K\_s, both send the class of the crossed product of a cocycle of Gal(M/K) to the inflated cocycle restricted to G\_L, and the comparison is determined by these values (TauCeti.brauerCohomologyEquiv\_unique).
3. Define cor\_{L/K} by transporting the corestriction of continuous cohomology (ProfiniteCohomology Layer 6); cor ∘ res = \[G\_K : G\_L] = \[L : K] and transitivity are the corresponding identities there.
4. Two K-embeddings of L differ by an element of G\_K, whose conjugation action on H²(G\_K, −) is trivial, so cor\_{L/K} is independent of the embedding.

**Uses.** PI.0/brauer-period-index: period divides index. PI.7/period-induction-step: cor(α\_{ℝ(T)}) = 2α for the quadratic extension ℝ(T)/ℝ(S). PI.9/enriques-complex-brauer: Br(S) is killed by 4.

**API.**

- `RealFunctionField.brauerCorestriction` (data): cor\_{L/K} : Br(L) → Br(K) for finite separable L/K, a group homomorphism.
- `RealFunctionField.brauerCorestriction_baseChange` (relation): cor\_{L/K}(α\_L) = \[L : K]·α.
- `RealFunctionField.brauerCorestriction_comp` (functoriality): cor\_{M/K} = cor\_{L/K} ∘ cor\_{M/L}.
- `RealFunctionField.brauerCohomologyEquiv_baseChange` (compatibility): TauCeti.brauerCohomologyEquiv intertwines base change and restriction of cohomology.

**Unit tests.**

- `RealFunctionField.brauerCorestriction_self` (degenerate): cor\_{K/K} is the identity.
- `RealFunctionField.brauerCorestriction_complex_real` (computation): For ℂ/ℝ, Br(ℂ) = 0, so cor\_{ℂ/ℝ} = 0, and cor ∘ res = 2 kills the quaternion class, consistently with Br(ℝ) ≅ ℤ/2.
- `RealFunctionField.brauerCorestriction_not_retraction` (non-example): For ℂ/ℝ and the quaternion class α, cor(res α) = 0 ≠ α: corestriction is not a left inverse of restriction.
- `RealFunctionField.brauerCorestriction_quadratic` (compatibility): For a separable quadratic extension L/K and α ∈ Br(K) with α\_L = 0, cor ∘ res gives 2α = 0; in characteristic ≠ 2 these α are the quaternion classes (a, b) with L = K(√a).

**Direct prerequisites:** `TauCeti.brauerCohomologyEquiv` (Tau Ceti); `TauCeti.BrauerGroup.baseChange` (Tau Ceti); ProfiniteCohomology Layer 6.

**Source:** CT05, §2.2, proof of Proposition 2.2, p. 383: For a finite field extension K/k there is a corestriction Br(K) → Br(k) whose composite with restriction is multiplication by the degree. B19, §6.3, proof of Proposition 6.7, p. 95: For the degree-2 cover T → S produced there, α\_{ℝ(T)} has period n/2.

*Suggested home:* `TauCeti/FieldTheory/Ordering/RealFunctionField/BrauerIndex`, namespace `TauCeti.RealFunctionField`.

<a id="pi-0-brauer-period-index"></a>

### Period and index of a Brauer class

`PI.0/brauer-period-index` · definition

Let K be a field and α ∈ Br(K). The period per(α) is the order of α. The index ind(α) is TauCeti.Algebra.index K A for any central simple K-algebra A of class α; it does not depend on A and is the degree of the central division algebra of class α. Equivalently ind(α) is the least degree, and also the greatest common divisor of the degrees, of finite separable extensions L/K with α\_L = 0; every finite splitting field has degree divisible by ind(α). Moreover per(α) divides ind(α), both have the same prime divisors, and for a finite extension L/K, ind(α\_L) divides ind(α), which divides \[L : K]·ind(α\_L).

**Hypotheses and conventions.** K any field; per(0) = ind(0) = 1. A splitting field of α is a finite field extension L/K with α\_L = 0 (TauCeti.BrauerGroup.baseChange).

**Construction.**

1. Every class has a central division representative D, unique up to isomorphism (TauCeti.BrauerGroup.exists\_eq\_mk\_centralDivisionRing); for any representative A ≅ M\_n(D), TauCeti.Algebra.index\_eq\_deg\_of\_algEquiv\_matrix gives TauCeti.Algebra.index K A = deg D, so ind(α) is well defined.
2. Some splitting field has degree ind(α) (TauCeti.Algebra.exists\_isSplittingField\_finrank\_eq\_index), and it may be chosen separable (a separable maximal subfield of D). If a finite L splits α, then D ⊗\_K L ≅ M\_d(L) acts on L^d, a left D-module of K-dimension d\[L : K], hence free of rank \[L : K]/d over D; so d = ind(α) divides \[L : K].
3. D ⊗\_K L ≅ M\_r(D′) gives ind(α\_L) = deg D′ dividing d; a splitting field of α\_L of degree ind(α\_L) over L splits α and has degree \[L : K]·ind(α\_L) over K, so ind(α) divides \[L : K]·ind(α\_L).
4. Corestriction (PI.0/brauer-corestriction) along a separable splitting field of degree ind(α) gives ind(α)·α = 0, so per(α) | ind(α); for a prime l not dividing per(α), the fixed field F of an l-Sylow subgroup of a Galois splitting field L has \[L : F] a power of l, so α\_F is killed both by per(α) and by a power of l, hence α\_F = 0 with \[F : K] prime to l, and l does not divide ind(α).

**Uses.** PI.0/albert-isotropy: the index of the Clifford invariant. PI.2/real-closed-norm-bound: ind(α) | \[L : F]·ind(α\_L) and the same prime divisors. PI.7/arbitrary-period-sufficiency: reverse index divisibility along the double cover.

**API.**

- `RealFunctionField.brauerIndex` (data): ind(α) := TauCeti.Algebra.index K D for the central division representative D of α.
- `RealFunctionField.brauerIndex_eq_index` (characterisation): ind(α) = TauCeti.Algebra.index K A for every central simple A of class α.
- `RealFunctionField.brauerIndex_dvd_finrank` (relation): Every finite splitting field L has ind(α) | \[L : K].
- `RealFunctionField.exists_splitting_finrank_eq_brauerIndex` (constructor): Some finite separable splitting field has degree ind(α).
- `RealFunctionField.brauerIndex_baseChange_dvd` (relation): ind(α\_L) | ind(α) | \[L : K]·ind(α\_L) for finite L/K.
- `RealFunctionField.orderOf_dvd_brauerIndex` (relation): per(α) | ind(α).
- `RealFunctionField.brauerIndex_primeFactors` (relation): per(α) and ind(α) have the same prime divisors.

**Unit tests.**

- `RealFunctionField.brauerIndex_quaternion_real` (computation): The Hamilton quaternion class over ℝ has per = ind = 2.
- `RealFunctionField.brauerIndex_zero` (degenerate): ind(0) = per(0) = 1.
- `RealFunctionField.brauerIndex_matrix_quaternion` (non-example): The class of M₂(ℍ) over ℝ has index 2 although the algebra has degree 4: the index is that of the division algebra in the class, not the degree of a representative.
- `RealFunctionField.brauerIndex_eq_index_compat` (compatibility): On a central division algebra, brauerIndex of its class agrees with TauCeti.Algebra.index.

**Acceptance.** For the Hamilton quaternions over ℝ, per = ind = 2. For α = 0, per = ind = 1.

**Direct prerequisites:** [Corestriction of Brauer classes](#pi-0-brauer-corestriction); `TauCeti.Algebra.index` (Tau Ceti); `TauCeti.Algebra.exists_isSplittingField_finrank_eq_index` (Tau Ceti); `TauCeti.BrauerGroup.exists_eq_mk_centralDivisionRing` (Tau Ceti); `TauCeti.BrauerGroup.baseChange` (Tau Ceti); Tau Ceti roadmap `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-6-the-brauer-group-and-splitting-fields`.

**Source:** CT05, §2.2 and Proposition 2.2, pp. 382–383: The index depends only on the Brauer class and is the least, and the gcd, of the degrees of finite separable splitting fields; the period divides the index and the primes dividing the index divide the period. B19, §0.1, p. 63: Period and index; per(α) | ind(α) with the same prime divisors.

*Suggested home:* `TauCeti/FieldTheory/Ordering/RealFunctionField/BrauerIndex`, namespace `TauCeti.RealFunctionField`.

<a id="pi-0-albert-isotropy"></a>

### Albert's isotropy criterion for six-dimensional forms

`PI.0/albert-isotropy` · theorem

Let F be a field of characteristic ≠ 2 and φ a nondegenerate quadratic form of dimension 6 and trivial discriminant (an Albert form). Its Clifford invariant c(φ) ∈ Br(F)\[2] is the class of a central simple algebra of degree 4, and φ is isotropic iff the index of c(φ) is at most 2.

**Hypotheses and conventions.** char F ≠ 2; dim φ = 6; signed discriminant of φ trivial.

**Proof.**

1. Scaling by e = −x₁x₂x₃ puts φ = ⟨x₁,…,x₆⟩ of trivial discriminant into the normal form eφ ≅ ⟨a, b, −ab, −c, −d, cd⟩ with a = ex₁, b = ex₂, c = −ex₄, d = −ex₅ (then ex₃ ≡ −ab and ex₆ ≡ cd modulo squares, the second because the signed discriminant −x₁⋯x₆ is a square) (diagonal calculus, upstream QuadraticFormInvariants Layer 0); similarity preserves isotropy and the Clifford invariant of an even-dimensional form of trivial discriminant.
2. For this normal form the even Clifford algebra is A × A with A = (a, b) ⊗ (c, d), so c(φ) = \[A] (upstream QuadraticFormInvariants Layer 5, Clifford invariant).
3. Albert's theorem: ⟨a, b, −ab, −c, −d, cd⟩ is isotropic iff the biquaternion algebra (a, b) ⊗ (c, d) is not a division algebra, that is iff its index is ≤ 2. If the factors are division algebras, a common value e of the pure-quaternion norm forms ⟨a, b, −ab⟩ and ⟨c, d, −cd⟩ is the same as a common quadratic subfield F(√e), so both directions are EKM Theorem 98.19; if a factor is split, the corresponding ternary subform is isotropic and the index is ≤ 2.

**Acceptance.** The Albert form ⟨a, b, −ab, −c, −d, cd⟩ over ℝ with a = b = c = d = −1 is isotropic, and (−1,−1) ⊗ (−1,−1) ≅ M₄(ℝ) has index 1. Over a field where (a,b) ⊗ (c,d) is a division algebra, the corresponding Albert form is anisotropic.

**Direct prerequisites:** `CliffordAlgebra.even` (Mathlib); `QuadraticMap.Anisotropic` (Mathlib); Tau Ceti roadmap `TauCetiRoadmap/QuadraticFormInvariants#layer-5-the-brauer-valued-invariants`; [Period and index of a Brauer class](#pi-0-brauer-period-index).

**Source:** BEC05, §2–§3, pp. 2–3: An Albert form is a six-dimensional form of trivial discriminant; the proof of Theorem 3.1 uses that an anisotropic torsion Albert form exists when u(F) = 6. EKM, Theorem 98.19, p. 392; Lemma 38.1 and Corollary 38.2, pp. 170–171: For division quaternion algebras Q₁, Q₂, the tensor product Q₁ ⊗ Q₂ fails to be a division algebra iff Q₁ and Q₂ share a separable quadratic subfield; a 6-dimensional form in I² whose Clifford invariant has index 4 is anisotropic.

*Suggested home:* `TauCeti/FieldTheory/Ordering/RealFunctionField/Albert`, namespace `TauCeti.RealFunctionField`.

<a id="pi-0-elman-lam-c2-bound"></a>

### Elman–Lam: u-invariants when u(F(√−1)) ≤ 4

`PI.0/elman-lam-c2-bound` · theorem

Let F be a field of characteristic ≠ 2 with u(F(√−1)) ≤ 4. Then I³F is torsion-free, u(F) ∈ {0, 1, 2, 4, 6}, and if u(F) = 6 there is an anisotropic Albert form over F with zero total signature. If F ⊇ ℝ has transcendence degree 2 over ℝ, then F(√−1) is C₂, so u(F(√−1)) ≤ 4 and these conclusions apply.

**Hypotheses and conventions.** char F ≠ 2; u(F(√−1)) ≤ 4 (for transcendence degree 2 over ℝ this follows from Tsen–Lang). Becher states the conclusion when u(F(√−1)) = 4, the case of a C₂ field such as ℂ(x, y). When u(F(√−1)) < 4 (for example F real closed, where F(√−1) is algebraically closed), no field having u-invariant 3 (EKM Corollary 36.4) gives u(F(√−1)) ≤ 2, hence u(F) ≤ 2 and I²F torsion-free (EKM Proposition 37.7 and its proof), so the conclusions hold with the Albert-form clause empty.

**Proof.**

1. For F of transcendence degree 2 over ℝ, F(√−1) has transcendence degree 2 over ℂ, hence is C₂ by Tsen–Lang (QuadraticFormInvariantsPartII Q2.5/transcendental-ci, gap:q2-tsen-lang), so every form of dimension ≥ 5 over it is isotropic and u(F(√−1)) ≤ 4.
2. If u(F(√−1)) = 4, Elman–Lam's analysis of torsion forms over F whose extension to F(√−1) is isotropic gives torsion-freeness of I³F and u(F) ∈ {0, 1, 2, 4, 6} (BEC05 §3, p. 3). If u(F(√−1)) < 4, then u(F(√−1)) ≤ 2 (EKM Corollary 36.4) and EKM Proposition 37.7 gives u(F) ≤ 2, with I²F, hence I³F, torsion-free.
3. If u(F) = 6, choose an anisotropic torsion form of dimension 6; Becher's argument (§3) produces from it an anisotropic torsion Albert form, using that I³F is torsion-free.

**Acceptance.** For F = ℝ(x, y), u(F(√−1)) = 4 and the bound gives u(F) ≤ 6 before Benoist's theorem; Theorem 0.12 excludes 6.

**Direct prerequisites:** [The Elman–Lam u-invariant](#pi-0-elman-lam-u); [Albert's isotropy criterion for six-dimensional forms](#pi-0-albert-isotropy); QuadraticFormInvariantsPartII Q2.5/transcendental-ci (gap:q2-tsen-lang); Tau Ceti roadmap `TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`.

**Source:** BEC05, §3, p. 3: If u(F(√−1)) = 4 then I³F is torsion-free, u(F) ∈ {0,1,2,4,6}, and u(F) = 6 forces an anisotropic torsion Albert form (citing Elman–Lam). EKM, Theorem 37.4 and Corollary 37.5, pp. 167–168: Comparison of u(F) with u(K) for quadratic extensions K/F and the bound for transcendence degree n over a real closed field. EKM, Corollary 36.4, p. 162; Proposition 37.7 and proof, pp. 168–169: No field has u-invariant 3, 5 or 7; if a finite normal extension K/F has u(K) ≤ 2, then u(F) ≤ 2, and I²F is torsion-free in the quadratic case. EL73, Elman–Lam 1973 (not read; cited through Becher 2005 and Benoist p. 66): Definition of the u-invariant of a real field and the comparison with F(√−1).

*Suggested home:* `TauCeti/FieldTheory/Ordering/RealFunctionField/UInvariant`, namespace `TauCeti.RealFunctionField`.

<a id="pi-0-pfister-brauer-criterion"></a>

### Pfister's criterion: index two implies u ≤ 4

`PI.0/pfister-brauer-criterion` · theorem

Let K be a field extension of ℝ of transcendence degree 2. If every nonzero class α ∈ Br(K)\[2] that vanishes at all real closures of K has index 2, then u(K) ≤ 4 in the Elman–Lam sense. (Pfister proves the equivalence; only this direction is a target.)

**Hypotheses and conventions.** K ⊇ ℝ of transcendence degree 2, not necessarily finitely generated; index as in PI.0/brauer-period-index.

**Proof.**

1. By PI.0/elman-lam-c2-bound, u(K) ∈ {0,1,2,4,6}; suppose u(K) = 6 and take an anisotropic Albert form φ with zero total signature.
2. At every ordering P, φ\_R over a real closure R at P is six-dimensional of signature 0, hence hyperbolic; so c(φ)\_R = c(φ\_R) = 0 (Clifford invariant commutes with base change). Thus c(φ) vanishes at all real closures.
3. By hypothesis c(φ) has index ≤ 2 (index 1 if c(φ) = 0), so φ is isotropic by PI.0/albert-isotropy, a contradiction. Hence u(K) ≤ 4.

**Acceptance.** For nonreal K the hypothesis is that every class of Br(K)\[2] has index ≤ 2, and the conclusion is the classical bound u(K) ≤ 4. Benoist's Theorem 0.4 supplies the hypothesis for every K of transcendence degree 2 over ℝ (PI.7/u-invariant-upper-bound).

**Direct prerequisites:** [Elman–Lam: u-invariants when u(F(√−1)) ≤ 4](#pi-0-elman-lam-c2-bound); [Albert's isotropy criterion for six-dimensional forms](#pi-0-albert-isotropy); [Real closure at a specified ordering](#pi-0-real-closure-at-ordering); [Signature of a quadratic form at an ordering](#pi-0-signature-at-ordering); [The Elman–Lam u-invariant](#pi-0-elman-lam-u); [Period and index of a Brauer class](#pi-0-brauer-period-index); Tau Ceti roadmap `TauCetiRoadmap/QuadraticFormInvariants#layer-5-the-brauer-valued-invariants`.

**Source:** B19, §6.4, p. 95: For trdeg 2 over R, u(K) ≤ 4 is equivalent to every nonzero class of Br(K)\[2] trivial at all real closures having index 2. BEC05, §3, Theorem 3.1 and Remark 3.2, pp. 3–4: Criterion for u(F) ≤ 4 when u(F(√−1)) = 4, refining Pfister's Proposition 6, through anisotropic torsion Albert forms.

*Suggested home:* `TauCeti/FieldTheory/Ordering/RealFunctionField/Pfister`, namespace `TauCeti.RealFunctionField`.

## Layer PI.1: Period, index and real evaluation on real surfaces

The unramified locus U\_α of a class of Br(ℝ(S)) (residues and purity from HeightsRationalPointsAndObstructions §2.16b); the complex and real Kummer and topological Brauer sequences and the real class of a two-torsion line bundle (Lemma 2.1 of the source); real evaluation and the clopen nonzero-evaluation locus Θ(α), with the degree-zero component of Kummer lifts; invariance of period and index under extension of algebraically closed fields and de Jong's reduction to unramified classes; extension of line bundles from dense opens and injectivity of H¹ under removal of finitely many points.

*Builds on:* RealSurfacePeriodIndex PI.0; AlgebraicTopologyPartII AT2.7/twisted-bockstein (gap:at2-twisted-bockstein); ComplexComparisonPartII §C6.3; ComplexComparisonPartII §C6.3 (gap:real-artin-comparison); HeightsRationalPointsAndObstructions §2.16b; MotivesAndAlgebraicCycles §7.6b; ResolutionOfSingularitiesCharacteristicZero §5.1; SchemeAndStackFoundations §0.9; SchemeAndStackFoundations §2.11; SchemeAndStackFoundations §2.22; SchemeAndStackFoundations §3.4; SchemeAndStackFoundations §4.13; Tau Ceti roadmap `TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

<a id="pi-1-unramified-locus"></a>

### Unramified locus of a Brauer class

`PI.1/unramified-locus` · definition

Let X be a smooth integral variety over a field k of characteristic 0, with Br(X) = H²\_ét(X, 𝔾\_m) ⊂ Br(k(X)). For α ∈ Br(k(X)) only finitely many prime divisors Γ ⊂ X have nonzero residue res\_Γ(α) ∈ H¹(k(Γ), ℚ/ℤ); their union is the ramification divisor of α, and its complement U\_α is the largest open subset U ⊂ X with α ∈ Br(U) ⊂ Br(k(X)). For a smooth proper surface S over ℝ and α ∈ Br(ℝ(S)), U\_α is a dense open of S whose complement is a curve or empty, and it is empty exactly when α ∈ Br(S).

**Hypotheses and conventions.** X smooth integral over k, char k = 0; residues are those of HeightsRationalPointsAndObstructions §2.16b at the DVRs O\_{X,Γ}. Br(U) ↪ Br(k(X)) for open U (injectivity for regular integral schemes).

**Construction.**

1. α lies in Br(V) for a dense open V (a central simple algebra over k(X) spreads out to an Azumaya algebra over some V), so res\_Γ(α) = 0 for every Γ meeting V, and only the finitely many divisors in X ∖ V can carry nonzero residue.
2. On U = X ∖ (ramified divisors), α is unramified at every codimension-one point; the residue exact sequence for smooth varieties in characteristic zero (HeightsRationalPointsAndObstructions §2.16b, `smoothBrauer_residueExact`) puts α in Br(U).
3. Maximality: if α ∈ Br(W) then every residue at a divisor meeting W vanishes by the residue sequence, so W ⊂ U.

**Uses.** Benoist 2019, §0.2 and Theorem 0.4, p. 64: the open U on which α is defined. Benoist 2019, Propositions 6.6–6.7, pp. 93–95: U is the biggest open with α ∈ Br(U); its complement is made SNC after modification. PI.7/period-induction-step: the unramified locus of (n/2)α can be strictly larger than that of α. PI.8/even-degree-splitting-obstruction: the Kummer lift lives on U(ℂ).

**API.**

- `RealSurface.unramifiedLocus` (data): U\_α : X.Opens, the complement of the prime divisors with nonzero residue.
- `RealSurface.mem_brauer_iff_le_unramifiedLocus` (characterisation): For open V ⊂ X, α ∈ Br(V) iff V ⊂ U\_α.
- `RealSurface.ramificationDivisor_finite` (other): Only finitely many prime divisors have nonzero residue.
- `RealSurface.unramifiedLocus_zero` (simp): U\_0 = X.
- `RealSurface.unramifiedLocus_le_nsmul` (relation): U\_α ⊂ U\_{mα} for every integer m.
- `RealSurface.unramifiedLocus_pullback` (functoriality): For a dominant morphism f : Y → X of smooth integral varieties, f⁻¹(U\_α) ⊂ U\_{f\*α}.

**Unit tests.**

- `RealSurface.unramifiedLocus_of_mem_brauer` (degenerate): If α ∈ Br(X) then U\_α = X.
- `RealSurface.unramifiedLocus_quaternion_xy` (computation): For α = (x, y) over ℝ(x, y) on 𝔸², U\_α = 𝔸² ∖ {xy = 0}.
- `RealSurface.unramifiedLocus_two_smul` (non-example): For α = (x, y) on 𝔸², 2α = 0 has U\_{2α} = 𝔸² ≠ U\_α: the locus is not preserved by multiples.
- `RealSurface.unramifiedLocus_field` (compatibility): For X = Spec of a field (dimension 0) U\_α = X and Br(X) is Mathlib's BrauerGroup.

**Acceptance.** If S is a smooth projective real surface and α ∈ Br(S), then U\_α = S. For α = (x, y) ∈ Br(ℝ(x, y)) on the affine plane, U\_α is the complement of the two axes.

**Direct prerequisites:** HeightsRationalPointsAndObstructions §2.16b (`smoothBrauer_residueExact`); SchemeAndStackFoundations §2.22 (`brauer_regular_injectivity`); `AlgebraicGeometry.Scheme.functionField` (Mathlib).

**Source:** B19, §2.4, p. 75: Residues along integral divisors; finitely many are nonzero; their complement is the largest open on which the class is unramified, by purity.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Unramified`, namespace `TauCeti.RealSurface`.

<a id="pi-1-kummer-brauer-sequences"></a>

### Kummer and topological Brauer sequences

`PI.1/kummer-brauer-sequences` · theorem

Let X be a smooth variety and n ≥ 1. Over ℂ there are exact sequences 0 → Pic(X)/n → H²(X(ℂ), ℤ/n) → Br(X)\[n] → 0 and 0 → H²(X(ℂ), ℤ)/⟨n, cl\_ℂ(Pic X)⟩ → Br(X)\[n] → H³(X(ℂ), ℤ)\[n] → 0. Over ℝ, with G = Gal(ℂ/ℝ), there are exact sequences 0 → Pic(X)/n → H²\_G(X(ℂ), ℤ/n(1)) → Br(X)\[n] → 0 and 0 → H²\_G(X(ℂ), ℤ(1))/⟨n, cl(Pic X)⟩ → Br(X)\[n] → H³\_G(X(ℂ), ℤ(1))\[n] → 0, with cl Krasnov's cycle class map; if X is moreover proper and geometrically connected, there is an exact sequence 0 → ℝˣ/ℝˣ² → H¹\_G(X(ℂ), 𝔽₂) → Pic(X)\[2] → 0.

**Hypotheses and conventions.** Br(X) = H²\_ét(X, 𝔾\_m) and X smooth over ℂ or ℝ. μ\_n(ℂ) is identified with ℤ/n(1) = √−1·ℤ/n as a G-module by √−1·k ↦ exp(2π√−1·k/n).

**Proof.**

1. The étale Kummer sequence and Hilbert 90 (SchemeAndStackFoundations §2.11; with its Brauer term, §2.22 `brauer_kummer_sequence`) give 0 → Pic(X)/n → H²\_ét(X, μ\_n) → Br(X)\[n] → 0.
2. Over ℂ, ComplexComparisonPartII §C6.3 (`artinComparison`) identifies H²\_ét(X, μ\_n) with H²(X(ℂ), ℤ/n); over ℝ, the étale–equivariant comparison (gap:real-artin-comparison) identifies it with H²\_G(X(ℂ), ℤ/n(1)).
3. Compare with the long exact sequence of 0 → ℤ(1) → ℤ(1) → ℤ/n(1) → 0: the Kummer class of a line bundle has Bockstein its cycle class (MotivesAndAlgebraicCycles §7.6b), which gives the topological Brauer sequences.
4. In degree one, H⁰(X, 𝔾\_m) = ℝˣ when X is proper and geometrically connected, and H¹\_ét(X, 𝔾\_m) = Pic(X).

**Acceptance.** For X = Spec ℝ: Pic = 0, H²\_G(pt, ℤ(1)) = H²(G, ℤ(1)) = 0 and H³\_G(pt, ℤ(1)) = ℤ/2, so the quaternion class of Br(ℝ)\[2] ≅ ℤ/2 is purely topological. For X = ℙ¹\_ℂ, H²(ℙ¹(ℂ), ℤ/n) = ℤ/n = Pic/n, so Br(ℙ¹\_ℂ)\[n] = 0. For X = Spec ℝ in degree one, H¹\_G(pt, 𝔽₂) = 𝔽₂ ≅ ℝˣ/ℝˣ² and Pic = 0.

**Direct prerequisites:** SchemeAndStackFoundations §2.11; SchemeAndStackFoundations §2.22 (`brauer_kummer_sequence`); ComplexComparisonPartII §C6.3 (`artinComparison`); ComplexComparisonPartII §C6.3 (gap:real-artin-comparison); MotivesAndAlgebraicCycles §7.6b.

**Source:** B19, (1.1)–(1.2), p. 69: The complex Kummer and topological Brauer sequences. B19, (2.16)–(2.17), p. 76: Their real analogues with equivariant Betti cohomology and Krasnov's cycle class map. B19, Proof of Theorem 0.6, p. 106: The degree-one Kummer sequence 0 → ℝˣ/ℝˣ² → H¹\_G(S(ℂ), ℤ/2) → Pic(S)\[2] → 0.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Kummer`, namespace `TauCeti.RealSurface`.

<a id="pi-1-two-torsion-line-bundle-class"></a>

### The real class of a two-torsion line bundle

`PI.1/two-torsion-line-bundle-class` · theorem

Let X be a smooth variety over ℝ, e ∈ H¹\_G(X(ℂ), 𝔽₂), and υ(e) ∈ Pic(X)\[2] its image under H¹\_G(X(ℂ), 𝔽₂) ≅ H¹\_ét(X, μ₂) → Pic(X). Then cl\_R(υ(e)) = \[e]₁ in H¹(X(ℝ), 𝔽₂).

**Hypotheses and conventions.** X smooth over ℝ; υ uses the étale–equivariant comparison in degree one (gap:real-artin-comparison) and μ₂ ⊂ 𝔾\_m. \[e]₁ is the degree-one component of the canonical decomposition H¹\_G(X(ℝ), 𝔽₂) = H⁰(X(ℝ)) ⊕ H¹(X(ℝ)).

**Proof.**

1. The Kummer boundary of e in H²\_G(X(ℂ), ℤ(1)) is cl(υ(e)) (compatibility of Krasnov's class with the Kummer boundary, MotivesAndAlgebraicCycles §7.6b).
2. Restricted to X(ℝ), the Bockstein of 0 → ℤ(1) → ℤ(1) → 𝔽₂ → 0 followed by reduction modulo 2 is (a₀, a₁) ↦ (0, a₁, Sq¹a₁) in canonical components (AlgebraicTopologyPartII AT2.7/twisted-bockstein, with \[ξ]\_i = \[ξ ∪ ω]\_i from MotivesAndAlgebraicCycles §7.6b).
3. Krasnov's compatibility cl\_R(M) = \[cl(M)]₁ (MotivesAndAlgebraicCycles §7.6b) identifies the degree-one component a₁ = \[e]₁ with cl\_R(υ(e)).

**Acceptance.** For X = Spec ℝ, H¹(X(ℝ)) = 0 and both sides vanish. For X = ℙ¹\_ℝ, Pic(X)\[2] = 0 and H¹\_G(ℙ¹(ℂ), 𝔽₂) is the constant class of ℝˣ/ℝˣ², whose degree-one component on the circle ℙ¹(ℝ) is 0, as the formula predicts. On a real Enriques surface, a lift of K\_S has \[e]₁ = cl\_R(K\_S) = w₁ (PI.9/enriques-half-detector).

**Direct prerequisites:** [Kummer and topological Brauer sequences](#pi-1-kummer-brauer-sequences); ComplexComparisonPartII §C6.3 (gap:real-artin-comparison); AlgebraicTopologyPartII AT2.7/twisted-bockstein (gap:at2-twisted-bockstein); MotivesAndAlgebraicCycles §7.6b.

**Source:** B19, Lemma 2.1 and proof, p. 75: cl\_R(υ(e)) = \[e]₁, from the diagram (2.15), the Bockstein formula and Krasnov's compatibility. BW20, Proof of Lemma 3.4: Where the source places the argument.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Kummer`, namespace `TauCeti.RealSurface`.

<a id="pi-1-real-evaluation-locus"></a>

### Real evaluation and the nonzero evaluation locus

`PI.1/real-evaluation-locus` · definition

Let U be a smooth variety over ℝ and α ∈ Br(U). For x ∈ U(ℝ) the evaluation α\_x ∈ Br(ℝ) ≅ ℤ/2 is the pullback along x : Spec ℝ → U. The nonzero evaluation locus Θ(α) = {x ∈ U(ℝ) : α\_x ≠ 0} is a union of connected components of U(ℝ). If α ∈ Br(U)\[n] and α̃ ∈ H²\_G(U(ℂ), ℤ/n(1)) lifts α in the Kummer sequence, then for n = 2 the degree-zero real component of α̃ is the indicator of Θ(α); for n even, the mod-2 reduction of α̃ lifts (n/2)α and its degree-zero component is (n/2 mod 2)·1\_{Θ(α)}, which vanishes when 4 | n.

**Hypotheses and conventions.** U smooth over ℝ; G = Gal(ℂ/ℝ) acts on U(ℂ) with fixed locus U(ℝ). Real components \[ξ]\_i are those of the canonical decompositions of MotivesAndAlgebraicCycles §7.6b.

**Construction.**

1. Evaluation is a group homomorphism Br(U) → Br(ℝ) for each x, through Tau Ceti's TauCeti.Quaternion.brauerGroupMulEquiv.
2. Local constancy: restriction to U(ℝ) followed by the canonical decomposition H²\_G(U(ℝ), 𝔽₂) ≅ H⁰ ⊕ H¹ ⊕ H² (MotivesAndAlgebraicCycles §7.6b) makes x ↦ \[α̃]\_0(x) a locally constant function, and it equals α\_x under H²\_G(pt, 𝔽₂) ≅ Br(ℝ)\[2].
3. For even n, the reduction ℤ/n(1) → ℤ/2 sends a mod-n lift of α to a lift of (n/2)α; at a real point it multiplies the evaluation by n/2, so the degree-zero component is (n/2 mod 2)·1\_Θ.

**Uses.** Benoist 2019, Theorems 0.4–0.5, p. 64: the hypothesis α|\_x = 0 for x ∈ U(ℝ) and the set Θ in the obstruction. PI.4/brauer-cover-hypotheses: the clopen Ψ ⊃ Θ to be avoided by the cover. PI.7/half-period-uniform-evaluation: the degree-zero component of the half-period lift on Ψ = Θ(α). PI.9/real-enriques-criterion: Θ for unramified classes on Enriques surfaces.

**API.**

- `RealSurface.realEvaluation` (data): α\_x ∈ Br(ℝ) for x ∈ U(ℝ), a group homomorphism in α.
- `RealSurface.nonzeroEvaluationLocus` (data): Θ(α) ⊂ U(ℝ).
- `RealSurface.isClopen_nonzeroEvaluationLocus` (characterisation): Θ(α) is open and closed in U(ℝ) with the Euclidean topology.
- `RealSurface.realEvaluation_add` (simp): (α + β)\_x = α\_x + β\_x and 0\_x = 0.
- `RealSurface.nonzeroEvaluationLocus_nsmul` (relation): Θ(mα) = Θ(α) if m is odd and ∅ if m is even.
- `RealSurface.kummerLift_component_zero` (compatibility): For a mod-n Kummer lift α̃ with n even, \[α̃ mod 2]\_0 = (n/2 mod 2)·1\_{Θ(α)}.
- `RealSurface.realEvaluation_pullback` (functoriality): (f\*α)\_y = α\_{f(y)} for f : V → U and y ∈ V(ℝ).

**Unit tests.**

- `RealSurface.nonzeroEvaluationLocus_constant_quaternion` (computation): For α the pullback of the Hamilton quaternion class, Θ(α) = U(ℝ).
- `RealSurface.nonzeroEvaluationLocus_empty_of_no_real_points` (degenerate): If U(ℝ) = ∅ then Θ(α) = ∅.
- `RealSurface.nonzeroEvaluationLocus_two_smul` (non-example): Θ(2α) = ∅ for every α, so the half-period class need not detect Θ(α) when 4 | per α.
- `RealSurface.realEvaluation_point` (compatibility): For U = Spec ℝ, realEvaluation is the identity of Br(ℝ) under TauCeti.Quaternion.brauerGroupMulEquiv.

**Acceptance.** For the constant class (−1,−1) on any real U, Θ = U(ℝ). For α = (−1, x) on 𝔾\_m over ℝ, Θ(α) = {x < 0}. If α has period 4, Θ(2α) = ∅ while Θ(α) can be nonempty.

**Direct prerequisites:** [Unramified locus of a Brauer class](#pi-1-unramified-locus); [Kummer and topological Brauer sequences](#pi-1-kummer-brauer-sequences); `TauCeti.Quaternion.brauerGroupMulEquiv` (Tau Ceti); MotivesAndAlgebraicCycles §7.6b.

**Source:** B19, §0.3, p. 64; §4, p. 79; §6.3, p. 95: Θ is the set of real points where α evaluates nontrivially; it is a union of components, and the proof of Proposition 6.7 applies the period-2 case to (n/2)α. B19, (2.16), p. 76: The real Kummer sequence 0 → Pic(X)/n → H²\_G(X(ℂ), ℤ/n(1)) → Br(X)\[n] → 0.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/RealEvaluation`, namespace `TauCeti.RealSurface`.

<a id="pi-1-index-algebraically-closed-base-change"></a>

### Period and index under extension of algebraically closed fields

`PI.1/index-algebraically-closed-base-change` · theorem

Let k ⊂ K be algebraically closed fields, X an integral variety over k and α ∈ Br(k(X)), with image α\_K ∈ Br(K(X\_K)). Then per(α\_K) = per(α) and ind(α\_K) = ind(α).

**Hypotheses and conventions.** k and K algebraically closed, of any characteristic; X\_K = X ×\_k K is integral because k is algebraically closed, and k(X) ⊂ K(X\_K). Period and index as in PI.0/brauer-period-index.

**Proof.**

1. ind(α\_K) divides ind(α) and per(α\_K) divides per(α) (PI.0/brauer-period-index).
2. Let L/K(X\_K) be a finite separable splitting field of α\_K of degree d = ind(α\_K). Spread out: there are a finitely generated k-subalgebra A ⊂ K, a dense open V ⊂ X ×\_k Spec A, a finite étale V-scheme W of degree d with function field L, and an Azumaya algebra on V of class α whose pullback to W is split (SchemeAndStackFoundations §0.9).
3. Since k is algebraically closed, k-points of Spec A are dense; for a in a dense open set, V\_a is a dense open of X, W\_a → V\_a is finite étale of degree d, and W\_a splits α. Each component of W\_a has function field a finite splitting field of degree at most d, so ind(α) ≤ d.
4. With the first step, ind(α) = ind(α\_K). Applied to the multiples mα: mα\_K = 0 gives ind(mα) = 1, so mα = 0, and per(α) = per(α\_K).

**Acceptance.** For k = K the statement is empty. For ℚ̄ ⊂ ℂ, X = 𝔸² and α = (x, y): per = ind = 2 over ℚ̄(x, y) and over ℂ(x, y), the norm form ⟨1, −x, −y, xy⟩ being anisotropic over both by Springer's theorem at the origin. Algebraic closedness of k is needed: for ℝ ⊂ ℂ and X = Spec ℝ, the quaternion class has index 2 over ℝ and 1 over ℂ.

**Direct prerequisites:** [Period and index of a Brauer class](#pi-0-brauer-period-index); SchemeAndStackFoundations §0.9.

**Source:** B19, §0.6, p. 68: De Jong's theorem reduces to ℂ by the Lefschetz principle. CT05, §2.2, p. 382: The index is the least, and the gcd, of the degrees of finite separable splitting fields.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/DeJong`, namespace `TauCeti.RealSurface`.

<a id="pi-1-ramified-to-unramified-reduction"></a>

### De Jong's reduction to unramified classes

`PI.1/ramified-to-unramified-reduction` · theorem

Let k be an algebraically closed field of characteristic 0, X a connected smooth projective surface over k, α ∈ Br(k(X)) of prime period l, and Ω an algebraic closure of k(t). There are a connected smooth projective surface Y over Ω and a dominant generically finite morphism r : Y → X\_Ω such that r\*α\_Ω ∈ Br(Ω(Y)) lies in Br(Y) and ind(α) divides ind(r\*α\_Ω).

**Hypotheses and conventions.** char k = 0; X connected smooth projective; α possibly ramified, of prime period l. Index and period as in PI.0/brauer-period-index.

**Proof.**

1. Blow up X so that the ramification divisor D of α is a strict normal crossings divisor (ResolutionOfSingularitiesCharacteristicZero §5.1, `principalization`).
2. Choose smooth effective divisors E, E′ with D + E linearly equivalent to l(D + E′) and D + E + E′ normal crossings (Bertini, SchemeAndStackFoundations §4.13); with sections s₀ of O(D + E) and s₁ of O(D + E′), form s\_t = t^l s₁^l + (1 − t)^l s₀ on X × 𝔸¹ and the generically cyclic degree-l cover of X × 𝔸¹ extracting an l-th root of s\_t (CT05 Lemma 3.15).
3. Its generic fibre has only A\_{l−1} singularities; resolving them by blowing up a coherent ideal gives an open W of the blow-up with f : W → 𝔸¹ smooth, geometric generic fibre Y := W\_Ω connected smooth projective, and fibre over 0 containing a component birational to X (CT05 properties (i)–(iii)).
4. r\*α\_Ω is unramified on Y: over components of D the residue is multiplied by the ramification index l (HeightsRationalPointsAndObstructions §2.16b, `pullbackMultiplicity`); over closed points of D use Saltman's local form of α at a smooth point or a crossing of D (CT05 Proposition 2.6) and the l-th root of s\_t (CT05 pp. 402–403).
5. Specialisation: a central simple algebra of degree d = ind(r\*α\_Ω) representing the pullback is defined over L(W\_L) for a finite L/k(t) inside Ω; it extends to an Azumaya algebra over the discrete valuation ring of W ×\_{𝔸¹} C at the generic point of its fibre over a k-point of C above 0 (C the normalisation of 𝔸¹ in L; CT05 Theorem 2.5), whose residue algebra has degree d and class α. Hence ind(α) | d.

**Acceptance.** If α is unramified, Y = X\_Ω and r = id satisfy the statement, which then reads ind(α) | ind(α\_Ω), an equality by PI.1/index-algebraically-closed-base-change. For α = (x, y) on ℙ² over ℂ, of period 2 and ramified along the two axes and the line at infinity, the construction extracts a square root of a function vanishing to order one along the ramification, after which the pulled-back class is unramified.

**Direct prerequisites:** ResolutionOfSingularitiesCharacteristicZero §5.1 (`principalization`); SchemeAndStackFoundations §4.13; HeightsRationalPointsAndObstructions §2.16b (`pullbackMultiplicity`); [Unramified locus of a Brauer class](#pi-1-unramified-locus); [Period and index of a Brauer class](#pi-0-brauer-period-index).

**Source:** CT05, §3.6, Theorem 3.14 and proof, Lemma 3.15, pp. 400–403: The ramified case of de Jong's theorem follows from the unramified case over an algebraic closure of k(t), through a cyclic cover in a pencil and specialisation over a discrete valuation ring. CT05, Theorem 2.5 and Proposition 2.6, pp. 385–386: Extension of central simple algebras with unramified class over regular schemes of dimension ≤ 2; Saltman's local form near a normal crossings ramification divisor. B19, §0.6, p. 68: The reduction to the unramified case by \[25, §7].

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/DeJong`, namespace `TauCeti.RealSurface`.

<a id="pi-1-point-removal-extension"></a>

### Removing finitely many points and extending line bundles

`PI.1/point-removal-extension` · theorem

Let S be a smooth integral surface over ℝ and V ⊂ S a dense open. Every line bundle on V extends to S (Pic(S) → Pic(V) is onto). If Z ⊂ S is finite and Σ ⊂ S(ℝ) is open (for instance a union of connected components, or a subset open and closed in U(ℝ) for an open U ⊂ S), restriction H¹(Σ, 𝔽₂) → H¹(Σ ∖ Z, 𝔽₂) is injective. These are the extension and injectivity steps used to pass from the finite-flat open U₀ to U.

**Hypotheses and conventions.** S smooth, so Weil and Cartier divisors agree; Σ a surface (two-dimensional manifold) and Z finite.

**Proof.**

1. A line bundle on V is O\_V(D) for a Weil divisor D on V; its closure in S is a Weil divisor, Cartier since S is smooth, restricting to D.
2. Σ ∖ Z ⊂ Σ: removing points from a surface does not change H¹ except through H¹ classes supported near the points, and the long exact sequence of the pair with H¹ of a punctured disc neighbourhood shows the restriction is injective (excision gives H¹(Σ, Σ ∖ Z) = ⊕ H¹(D, D ∖ {pt}) = 0).

**Acceptance.** For Σ = S² and Z one point, H¹(S²) = 0 → H¹(ℝ²) = 0 is injective. For Σ a torus and Z a point, H¹ is unchanged. For Σ = ℝ² ⊂ ℝℙ² and Z a point, H¹(ℝ²) = 0 → H¹(ℝ² ∖ pt) = 𝔽₂ is injective though not surjective; compactness of Σ is not needed.

**Direct prerequisites:** `AlgebraicGeometry.Scheme` (Mathlib); SchemeAndStackFoundations §3.4; Tau Ceti roadmap `TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Source:** B19, Proof of Proposition 7.1, pp. 103–104; Proposition 4.5 proof, p. 85: Pic(S) → Pic(U₀) is surjective and H¹(Θ) → H¹(Θ₀) is injective because U ∖ U₀ is finite.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Unramified`, namespace `TauCeti.RealSurface`.

## Layer PI.2: Unramified classes on complex surfaces and de Jong's theorem

The weight-two variation of a family of surfaces and Griffiths' formula; Benoist's Hodge-theoretic proof of de Jong's theorem for unramified classes: the hypersurface family in |dnH| on ℙ¹ × S, vanishing of the topological obstruction by weak Lefschetz, the compatible integral lift (reduction equal to p\*α̃) and pushforward adjustment, Voisin's open cone and the lattice argument, density of splitting hypersurfaces, and ind = per for α ∈ Br(S); then de Jong's theorem in characteristic 0 and the norm bound ind | 2 per over any real closed base.

*Builds on:* RealSurfacePeriodIndex PI.0; RealSurfacePeriodIndex PI.1; AffineMorseLefschetz §A5; AlgebraicModuliForArithmeticGeometry §1.4; ComplexComparisonPartII §C5.2; ComplexComparisonPartII §C5.3; MotivesAndAlgebraicCycles §7.8; ResolutionOfSingularitiesCharacteristicZero §7.8; SchemeAndStackFoundations §2.6; SchemeAndStackFoundations §4.13; SchemeAndStackFoundations §5.10; ShimuraData §3.1; Tau Ceti roadmap `TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

<a id="pi-2-complex-hypersurface-family"></a>

### Hypersurfaces in P¹ × S of degree divisible by the period

`PI.2/complex-hypersurface-family` · construction

Let S be a connected smooth projective complex surface, α ∈ Br(S) of period n, and A a very ample line bundle with A² > A·K\_S. Put X = ℙ¹ × S and H = pr₁\*O(1) ⊗ pr₂\*A, very ample on X; then H²·K\_X = 2(A·K\_S − A²) < 0. For d ≥ 1 let B\_d ⊂ |dnH| be the Zariski-open locus of smooth surfaces and T → B\_d the universal family; each fibre T\_b comes with p\_b : T\_b → S, generically finite of degree dn, and its class in H²(X(ℂ), ℤ) is dn·c₁(H), divisible by n.

**Hypotheses and conventions.** S connected smooth projective over ℂ; A very ample with A² > A·K\_S; d ≥ 1.

**Construction.**

1. K\_X = pr₁\*K\_{ℙ¹} + pr₂\*K\_S; expand H²·K\_X with h² = 0 on ℙ¹ and A²·K\_S = 0 on the surface S to get 2(A·K\_S − A²).
2. H is very ample (Segre embedding of very ample bundles; AlgebraicModuliForArithmeticGeometry §1.4, `amplePowersAndFixedTwists`, for its powers), and Bertini (SchemeAndStackFoundations §4.13) makes the smooth members of |dnH| a dense Zariski open B\_d; the universal family is the incidence divisor in B\_d × X.
3. The degree of p\_b is the intersection of T\_b with a fibre ℙ¹ × {s}, namely dn.

**Uses.** Benoist 2019, Lemmas 1.3–1.4 and Proposition 1.2, pp. 69–71: the surfaces T\_b on which α is killed. PI.2/voisin-kernel-cone: the family to which Voisin's kernel-cone theorem applies. PI.2/complex-obstruction-vanishes: divisibility of the cycle class of T\_b by n.

**API.**

- `RealSurface.ComplexHypersurfaceFamily` (structure): The data (S, α, A, d) with X, H, B\_d, the universal family and the projections p\_b.
- `RealSurface.ComplexHypersurfaceFamily.canonical_neg` (relation): H²·K\_X = 2(A·K\_S − A²) < 0.
- `RealSurface.ComplexHypersurfaceFamily.degree_proj` (other): p\_b : T\_b → S is generically finite of degree dn.
- `RealSurface.ComplexHypersurfaceFamily.cycleClass_eq` (relation): cl(T\_b) = dn·c₁(H) in H²(X(ℂ), ℤ).
- `RealSurface.ComplexHypersurfaceFamily.isOpen_smooth` (other): B\_d is a nonempty Zariski open of |dnH|.

**Unit tests.**

- `RealSurface.ComplexHypersurfaceFamily.canonical_neg_projectivePlane` (computation): For S = ℙ², A = O(1): H²·K\_X = 2(−3 − 1) = −8.
- `RealSurface.ComplexHypersurfaceFamily.degree_one` (degenerate): For n = d = 1, p\_b has degree 1, and T\_b is the graph-like section family.
- `RealSurface.ComplexHypersurfaceFamily.quintic_excluded` (non-example): For the quintic surface and A = O(1), A² = A·K\_S = 5, so the hypothesis A² > A·K\_S fails.
- `RealSurface.ComplexHypersurfaceFamily.degree_eq_intersection` (compatibility): deg p\_b equals the intersection number T\_b·(ℙ¹ × {s}) of SchemeAndStackFoundations §5.10.

**Acceptance.** For S = ℙ² and A = O(1), A² = 1 > −3 = A·K\_S. For a quintic surface in ℙ³ with A = O(1), A² = 5 = A·K\_S, so A = O(1) is excluded and A = O(2) is required.

**Direct prerequisites:** SchemeAndStackFoundations §5.10; SchemeAndStackFoundations §2.6; SchemeAndStackFoundations §4.13; AlgebraicModuliForArithmeticGeometry §1.4 (`amplePowersAndFixedTwists`); `AlgebraicGeometry.Scheme` (Mathlib).

**Source:** B19, §1, p. 69: X = ℙ¹ × S, H = O(1) ⊠ A with A² > K\_S·A, so H²K\_X < 0; B ⊂ |dnH| the smooth surfaces and T → B the universal family.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/ComplexFamily`, namespace `TauCeti.RealSurface`.

<a id="pi-2-geometric-variation"></a>

### The weight-two variation of a family of surfaces

`PI.2/geometric-variation` · construction

Let π : 𝒯 → B be a smooth projective morphism of smooth complex varieties whose fibres are surfaces. The local system H²\_ℚ = R²π\_\*ℚ on B(ℂ), with the Gauss–Manin connection ∇ on H² = H²\_ℚ ⊗ O\_{B(ℂ)} and the relative Hodge filtration F²H² ⊂ F¹H² ⊂ H², is a weight-two variation of Hodge structure (ShimuraData §3.1, `Variation`). Griffiths' formula: for b ∈ B(ℂ) and λ ∈ H^{1,1}(T\_b), the map ∇(λ) : T\_{B,b} → H^{0,2}\_b = H²(T\_b, O) obtained by evaluating ∇ on λ is the Kodaira–Spencer map T\_{B,b} → H¹(T\_b, T\_{T\_b}) followed by contraction with λ ∈ H¹(T\_b, Ω¹). If π is defined over ℝ, then G = Gal(ℂ/ℝ) acts on H²\_ℚ compatibly with its action on B(ℂ), the induced ℂ-antilinear action on H² preserves the Hodge decomposition, and for b ∈ B(ℝ) the class of a line bundle on T\_b defined over ℝ lies in H^{1,1}\_ℝ(T\_b)(1)^G.

**Hypotheses and conventions.** π smooth projective with two-dimensional fibres, B smooth over ℂ, or over ℝ with π defined over ℝ. ℝ(1) carries conjugation by −1; with √−1·ℝ or 2π√−1·ℝ the G-invariant subspaces are the same.

**Construction.**

1. The Betti local system and its flat bundle with the Gauss–Manin connection: ComplexComparisonPartII §C5.2 (`ehresmannFibration`, `relativeBettiLocalSystem`, `GaussManin`, `relativeDeRhamBetti`).
2. The Hodge filtration of H²\_dR(𝒯/B) is by locally direct summands compatible with base change (ComplexComparisonPartII §C5.3, `relativeHodgeBundles`), and on each fibre it is the Hodge filtration of a pure weight-two Hodge structure (`properPureHodge`).
3. Griffiths transversality ∇F^p ⊂ F^{p−1} ⊗ Ω¹\_B and Griffiths' formula: compute ∇ through the filtration of the absolute de Rham complex used to define `GaussManin`; the connecting map lowers the Hodge filtration by at most one, and on graded pieces it is cup product with the Kodaira–Spencer class (Griffiths' computation, as used in B19 p. 94 and BEN18 §1.4).
4. Real structure: σ acts antiholomorphically on 𝒯(ℂ) and B(ℂ); the antilinear action on H² is the composite of conjugation of coefficients, which exchanges H^{p,q} and H^{q,p}, and pullback by the antiholomorphic σ, which also exchanges them; first Chern classes of real line bundles are of type (1,1) and lie in the (−1)-twisted invariants, by the G-action on the exponential sequence.

**Uses.** PI.2/voisin-kernel-cone: the variation of the hypersurface family. PI.6/vanishing-variation: the vanishing sub-variation. PI.6/real-green-criterion: the real open cone.

**API.**

- `RealSurface.familyVariation` (constructor): The weight-two ShimuraData §3.1 Variation on B(ℂ) attached to π.
- `RealSurface.familyVariation_griffiths` (relation): Griffiths' formula ∇(λ) = (contraction with λ) ∘ (Kodaira–Spencer) on H^{1,1}.
- `RealSurface.familyVariation_real` (structure): The G-action for π defined over ℝ, compatible with B(ℂ) and preserving Hodge types.
- `RealSurface.familyVariation_lineBundle` (other): Classes of real line bundles on T\_b, b ∈ B(ℝ), lie in H^{1,1}\_ℝ(T\_b)(1)^G.

**Unit tests.**

- `RealSurface.familyVariation_constant` (degenerate): For a constant family T × B → B, ∇ is the trivial connection and ∇(λ) = 0 for every λ.
- `RealSurface.familyVariation_quartic` (computation): For the universal family of smooth quartic surfaces in ℙ³, the Hodge numbers are h^{2,0} = h^{0,2} = 1 and h^{1,1} = 20.
- `RealSurface.familyVariation_not_holomorphic` (non-example): H^{1,1} = F¹ ∩ conj(F¹) is a real-analytic subbundle of H² and in general not a holomorphic one: only F²H² and F¹H² vary holomorphically, as for the quartic family, whose period map is nonconstant.
- `RealSurface.familyVariation_fibre` (compatibility): At b ∈ B(ℂ) the fibre is the pure Hodge structure `properPureHodge` on H²(T\_b(ℂ), ℚ).

**Direct prerequisites:** ComplexComparisonPartII §C5.2 (`GaussManin`); ComplexComparisonPartII §C5.3 (`relativeHodgeBundles`); ShimuraData §3.1 (`Variation`).

**Source:** BEN18, §1.1 and §1.4, pp. 3–5: Weight-two variations over real varieties with a compatible G-action; the geometric case, its real structure and Griffiths' formula for ∇(λ). BEN18, Remark 1.4, p. 5: Classes of line bundles defined over ℝ lie in H^{1,1}\_ℝ(1)^G. B19, Proof of Proposition 6.6, p. 94: The variation R²π\_\*ℚ of the double-cover family, its Gauss–Manin connection and Griffiths' computation of ∇(λ).

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/ComplexFamily`, namespace `TauCeti.RealSurface`.

<a id="pi-2-complex-obstruction-vanishes"></a>

### The pulled-back class has no topological obstruction

`PI.2/complex-obstruction-vanishes` · theorem

In PI.2/complex-hypersurface-family, for every b ∈ B\_d(ℂ), the image τ of p\_b\*α ∈ Br(T\_b)\[n] in H³(T\_b(ℂ), ℤ)\[n] under the complex topological Brauer sequence 0 → H²(ℤ)/⟨n, Pic⟩ → Br\[n] → H³(ℤ)\[n] → 0 vanishes.

**Hypotheses and conventions.** The setting of PI.2/complex-hypersurface-family.

**Proof.**

1. With i : T\_b ↪ X, the composite i\_\*i\* is cup product with cl(T\_b) = dn c₁(H) (projection formula), hence kills the n-torsion class pr₂\*τ\_S.
2. i\_\* : H³(T\_b, ℤ) → H⁵(X, ℤ) is an isomorphism by integral weak Lefschetz (AffineMorseLefschetz §A5 for the hyperplane section T\_b of X embedded by |dnH|, with Poincaré duality on the compact manifolds T\_b(ℂ) and X(ℂ)).
3. τ = p\_b\*τ\_S = i\*pr₂\*τ\_S maps to zero under the isomorphism i\_\*, so τ = 0.

**Acceptance.** If H³(S(ℂ), ℤ) has no torsion (S = ℙ²), τ\_S = 0 already.

**Direct prerequisites:** [Hypersurfaces in P¹ × S of degree divisible by the period](#pi-2-complex-hypersurface-family); [Kummer and topological Brauer sequences](#pi-1-kummer-brauer-sequences); AffineMorseLefschetz §A5; Tau Ceti roadmap `TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Source:** B19, Lemma 1.3, pp. 69–70: The topological component of p\*α vanishes, using the projection formula, n-divisibility of cl(T) and the weak Lefschetz isomorphism.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/ComplexFamily`, namespace `TauCeti.RealSurface`.

<a id="pi-2-compatible-complex-lift"></a>

### Compatible integral lift and pushforward adjustment

`PI.2/compatible-complex-lift` · construction

In PI.2/complex-hypersurface-family fix a Kummer lift α̃ ∈ H²(S(ℂ), ℤ/n) of α. Choose β ∈ H²(T\_b(ℂ), ℤ) whose reduction modulo n is exactly p\_b\*α̃; such β exists because the Bockstein of p\_b\*α̃ is τ = 0. Then p\_{b\*}β is divisible by n, and there is γ ∈ H²(T\_b(ℂ), ℤ) with p\_{b\*}(β − nγ) = 0. The class β − nγ lies in H²(T\_b, ℤ)\_S = ker p\_{b\*} and still induces p\_b\*α in Br(T\_b).

**Hypotheses and conventions.** The setting of PI.2/complex-hypersurface-family; the compatibility β mod n = p\_b\*α̃ is imposed (an arbitrary integral lift of p\_b\*α in the Brauer sequence is not enough).

**Construction.**

1. By PI.2/complex-obstruction-vanishes the integral Bockstein of p\_b\*α̃ vanishes, so it lifts to β ∈ H²(T\_b, ℤ).
2. p\_{b\*}β reduces to p\_{b\*}p\_b\*α̃ = dn·α̃ = 0 modulo n, so p\_{b\*}β = nε for some ε ∈ H²(S, ℤ).
3. H²(T\_b, ℤ) → H⁴(X, ℤ) is onto (AffineMorseLefschetz §A5 with Poincaré duality) and H⁴(ℙ¹ × S, ℤ) → H²(S, ℤ) is onto by the Künneth formula, so ε = p\_{b\*}γ for some γ.
4. β − nγ reduces to p\_b\*α̃ modulo n, so it still induces p\_b\*α.

**Uses.** Benoist 2019, Proof of Proposition 1.2, p. 71: the class β − nγ in ker p\_\* that is moved into the Voisin cone. PI.2/dense-splitting-hypersurfaces: the compatible lift is transported along the family.

**API.**

- `RealSurface.compatibleLift` (constructor): β ∈ H²(T\_b(ℂ), ℤ) with β mod n = p\_b\*α̃.
- `RealSurface.compatibleLift_mod` (simp): (compatibleLift α̃) mod n = p\_b\*α̃.
- `RealSurface.pushforward_compatibleLift_dvd` (relation): n ∣ p\_{b\*}β.
- `RealSurface.kernelAdjust` (constructor): γ with p\_{b\*}(β − nγ) = 0.
- `RealSurface.kernelAdjust_brauer` (compatibility): β − nγ maps to p\_b\*α under H²(T\_b, ℤ) → Br(T\_b)\[n].

**Unit tests.**

- `RealSurface.compatibleLift_zero` (degenerate): For α̃ = 0, β = 0 is a compatible lift.
- `RealSurface.compatibleLift_period_one` (computation): For n = 1 every integral class β is compatible, and kernelAdjust gives γ with p\_{b\*}γ = p\_{b\*}β.
- `RealSurface.arbitraryLift_not_divisible` (non-example): An integral lift β′ of p\_b\*α in the topological Brauer sequence that differs from a compatible lift by cl(L) with p\_{b\*}cl(L) not divisible by n has p\_{b\*}β′ not divisible by n.
- `RealSurface.kernelAdjust_mem_ker` (characterisation): β − nγ lies in ker(p\_{b\*} : H²(T\_b, ℤ) → H²(S, ℤ)).

**Acceptance.** For α = 0 and α̃ = 0 one may take β = γ = 0. Replacing β by β + cl(L) for a line bundle L on T\_b keeps the Brauer class but can destroy n-divisibility of p\_{b\*}β.

**Direct prerequisites:** [The pulled-back class has no topological obstruction](#pi-2-complex-obstruction-vanishes); AffineMorseLefschetz §A5; [Kummer and topological Brauer sequences](#pi-1-kummer-brauer-sequences); Tau Ceti roadmap `TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Source:** B19, Lemma 1.4, p. 70: Construction of γ with p\_\*(β − nγ) = 0 from the n-divisibility of p\_\*β and the surjectivity of the Gysin maps. B19, Lemma 1.3 and (1.1)–(1.2), p. 69: The Kummer and topological Brauer sequences for complex varieties.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/ComplexFamily`, namespace `TauCeti.RealSurface`.

<a id="pi-2-voisin-kernel-cone"></a>

### Voisin's open cone in the kernel of the pushforward

`PI.2/voisin-kernel-cone` · theorem

In PI.2/complex-hypersurface-family, for all sufficiently large d there is a nonempty Zariski open V ⊂ B\_d such that for every b ∈ V(ℂ) and every contractible open neighbourhood Λ ⊂ V(ℂ) of b there is a nonempty open cone Ω ⊂ H²(T\_b(ℂ), ℝ)\_S := ker(p\_\* : H²(T\_b(ℂ), ℝ) → H²(S(ℂ), ℝ)) such that for every ν ∈ Ω some x ∈ Λ makes ν, transported to H²(T\_x(ℂ), ℝ) along Λ, of type (1,1).

**Hypotheses and conventions.** S connected smooth projective over ℂ; A very ample with A² > A·K\_S; X = ℙ¹ × S and H = pr₁\*O(1) ⊗ pr₂\*A, so that X → S has rational fibres and H²·K\_X < 0. Voisin's degree is m = dn (see E17). Transport along Λ is the Ehresmann identification (ComplexComparisonPartII §C5.2, `ehresmannFibration`).

**Proof.**

1. X → S and H satisfy the standing hypotheses of Voisin's §3: a morphism to a surface with rational generic fibre and H²·K\_X < 0.
2. For m = dn large, Voisin's Proposition 9 gives a nonempty Zariski open V such that every T\_b, b ∈ V, carries λ ∈ H¹(T\_b, Ω¹)\_S with μ\_λ : H⁰(T\_b, O(mH)) → H²(T\_b, O)\_S surjective, μ\_λ being the contraction with λ of the first-order deformations of T\_b in X (Griffiths' formula, PI.2/geometric-variation).
3. As in the proof of Voisin's Proposition 8, the map from the real (1,1)-bundle of the kernel variation over Λ to H²(T\_b(ℂ), ℝ)\_S is then a submersion at (b, λ), so its image, a cone, contains a nonempty open cone Ω.

**Acceptance.** If H²(S, O\_S) = 0, then H²(T\_b, O)\_S = H²(T\_b, O) and μ\_λ must be onto all of H²(T\_b, O). Classes p\*σ with σ ∈ H²(S(ℂ), ℝ) not of type (1,1) are of type (1,1) on no fibre, since p\_\*p\*σ = dn·σ and p\_\* preserves Hodge types; this is why the cone is taken in ker p\_\*.

**Direct prerequisites:** [Hypersurfaces in P¹ × S of degree divisible by the period](#pi-2-complex-hypersurface-family); [The weight-two variation of a family of surfaces](#pi-2-geometric-variation); ComplexComparisonPartII §C5.2 (`ehresmannFibration`).

**Source:** B19, Theorem 1.5 and proof, pp. 70–71: For d ≫ 0, a Zariski open V and an open cone in ker p\_\* whose classes become (1,1) on nearby fibres, as an intermediate step of Voisin's Proposition 8. VOI06, Propositions 8 and 9, pp. 20–21 (arXiv): Surjectivity of μ\_λ for a generic surface in |nH| when H²K\_X < 0, and the resulting submersion and open cone.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/ComplexFamily`, namespace `TauCeti.RealSurface`.

<a id="pi-2-open-cone-lattice-coset"></a>

### Open cones meet lattice cosets

`PI.2/open-cone-lattice-coset` · theorem

Let W be a finite-dimensional real vector space, Γ ⊂ W an additive subgroup containing an ℝ-basis of W, n ≥ 1 an integer and Ω ⊂ W a nonempty open cone (an open subset stable under multiplication by positive reals). Then every coset x + nΓ, x ∈ W, meets Ω.

**Hypotheses and conventions.** W finite-dimensional over ℝ; Γ contains a basis v₁, …, v\_r of W; Ω nonempty, open, and tΩ = Ω for t > 0.

**Proof.**

1. The parallelepiped P spanned by nv₁, …, nv\_r meets every coset of the subgroup generated by the nv\_i, so every ball of radius larger than the diameter of P meets x + nΓ.
2. Ω contains a ball B(c, ρ), hence the balls B(tc, tρ) for all t > 0; take tρ larger than the diameter of P.

**Acceptance.** W = ℝ, Γ = ℤ, n = 2, Ω = (0, ∞): the coset 1 + 2ℤ meets Ω at 1. The cone hypothesis is needed: the open ball of radius 1/2 about 0 in ℝ misses 1 + 2ℤ. The spanning hypothesis is needed: in ℝ² with Γ = ℤ × {0} and Ω = {y > 0}, the coset Γ misses Ω.

**Source:** B19, Proof of Proposition 1.2, p. 71: The image of H²(T, ℤ)\_S in H²(T, ℝ)\_S is a lattice, so a class δ with β − nγ − nδ in the open cone exists. B19, Proof of Proposition 6.6, p. 94: The same lattice argument for the invariant vanishing classes and the real open cone.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/ComplexFamily`, namespace `TauCeti.RealSurface`.

<a id="pi-2-dense-splitting-hypersurfaces"></a>

### Dense splitting hypersurfaces

`PI.2/dense-splitting-hypersurfaces` · theorem

In PI.2/complex-hypersurface-family, for all sufficiently large d the points b ∈ B\_d(ℂ) with p\_b\*α = 0 ∈ Br(T\_b) are dense in B\_d(ℂ) for the Euclidean topology.

**Hypotheses and conventions.** d large enough for PI.2/voisin-kernel-cone. Transport over contractible opens uses ordinary Ehresmann; the compatible lift is transported as the restriction of the family class pulled back from S, so its reduction stays p\_x\*α̃.

**Proof.**

1. Fix a nonempty Euclidean open W ⊂ B\_d(ℂ); it meets Voisin's Zariski open V; take b ∈ V ∩ W and a contractible neighbourhood Λ ⊂ V ∩ W.
2. PI.2/compatible-complex-lift gives β − nγ in H²(T\_b, ℤ)\_S; its image in H²(T\_b, ℝ)\_S is a lattice coset point modulo n·(lattice).
3. Voisin's open cone Ω ⊂ H²(T\_b, ℝ)\_S (PI.2/voisin-kernel-cone) meets the coset β − nγ + n·H²(T\_b, ℤ)\_S (PI.2/open-cone-lattice-coset; the image of H²(T\_b, ℤ)\_S spans H²(T\_b, ℝ)\_S): choose δ with β − nγ − nδ ∈ Ω.
4. Ehresmann transport over the contractible Λ (ComplexComparisonPartII §C5.2, `ehresmannFibration`) identifies the cohomology of the fibres; some x ∈ Λ makes β − nγ − nδ of type (1,1) on T\_x; integral Lefschetz (1,1) (MotivesAndAlgebraicCycles §7.8) writes it as c₁ of a line bundle.
5. The transported β still reduces to p\_x\*α̃, so in the topological Brauer sequence p\_x\*α = 0 ∈ Br(T\_x).

**Acceptance.** For α = 0 every b qualifies.

**Direct prerequisites:** [Compatible integral lift and pushforward adjustment](#pi-2-compatible-complex-lift); [Voisin's open cone in the kernel of the pushforward](#pi-2-voisin-kernel-cone); [Open cones meet lattice cosets](#pi-2-open-cone-lattice-coset); ComplexComparisonPartII §C5.2 (`ehresmannFibration`); MotivesAndAlgebraicCycles §7.8; [Kummer and topological Brauer sequences](#pi-1-kummer-brauer-sequences).

**Source:** B19, Proposition 1.2 and its proof, pp. 69, 71: For d large, the b with α|\_{T\_b} = 0 are dense; proof by Voisin's cone, the lattice argument and Lefschetz (1,1). B19, Theorem 1.5, pp. 70–71, citing Voisin 2006: Voisin's open cone in the kernel of p\_\* whose classes become (1,1) nearby.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/ComplexFamily`, namespace `TauCeti.RealSurface`.

<a id="pi-2-complex-unramified-period-index"></a>

### Unramified period equals index on complex surfaces

`PI.2/complex-unramified-period-index` · theorem

Let S be a connected smooth projective surface over ℂ and α ∈ Br(S) ⊂ Br(ℂ(S)). Then ind(α) = per(α).

**Hypotheses and conventions.** S connected smooth projective over ℂ; α unramified on S.

**Proof.**

1. Apply PI.2/dense-splitting-hypersurfaces with two consecutive large integers d, d + 1: there are smooth T ∈ |dnH| and T′ ∈ |(d+1)nH| on which α vanishes.
2. Their function fields are splitting fields of α of degrees dn and (d+1)n over ℂ(S), so ind(α) divides both (PI.0/brauer-period-index), hence divides n.
3. per(α) divides ind(α) (PI.0/brauer-period-index), so ind(α) = n.

**Acceptance.** For S an Enriques surface over ℂ and α the nonzero class of Br(S) ≅ ℤ/2, ind(α) = 2.

**Direct prerequisites:** [Dense splitting hypersurfaces](#pi-2-dense-splitting-hypersurfaces); [Period and index of a Brauer class](#pi-0-brauer-period-index).

**Source:** B19, Theorem 1.1 and its proof, p. 69: De Jong's theorem for unramified classes on complex surfaces, from two consecutive degrees.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/ComplexFamily`, namespace `TauCeti.RealSurface`.

<a id="pi-2-de-jong-period-index"></a>

### De Jong's period-index theorem in characteristic zero

`PI.2/de-jong-period-index` · theorem

Let k be an algebraically closed field of characteristic 0 and S a connected smooth projective surface over k. For every α ∈ Br(k(S)), ind(α) = per(α).

**Hypotheses and conventions.** k algebraically closed of characteristic 0; S connected smooth projective of dimension 2; α possibly ramified. Index and period are those of PI.0/brauer-period-index.

**Proof.**

1. Prime-power reduction: α is the sum of its primary components and its index is the product of theirs (a central division algebra is the tensor product of division algebras of coprime prime-power degrees), so assume per(α) = l^r with l prime. For r ≥ 2, β = lα has period l^{r−1}; a splitting field E of β of degree l^{r−1} is the function field of a connected smooth projective surface Y (ResolutionOfSingularitiesCharacteristicZero §7.8, `resolution_field`), and the prime-period case on Y splits α\_E by an extension of degree l, so ind(α) divides l^r (CT05 §3.6, p. 400).
2. Prime period: PI.1/ramified-to-unramified-reduction gives a connected smooth projective surface Y over an algebraic closure Ω of k(t) and an unramified class β ∈ Br(Y) with ind(α) dividing ind(β); since lβ = 0, the unramified case over Ω gives ind(β) dividing l, so ind(α) = l.
3. Unramified case over an algebraically closed field K of characteristic 0: the surface and the class are defined over a countable algebraically closed subfield K₀ ⊂ K, which embeds into ℂ; unramified classes stay unramified under base change, and PI.1/index-algebraically-closed-base-change for K₀ ⊂ K and for K₀ ⊂ ℂ reduces to K = ℂ, where PI.2/complex-unramified-period-index gives ind = per.

**Acceptance.** For S = ℙ²\_ℂ and α = 0 the index is 1. Every class of Br(ℂ(x, y)) of period 2 is a quaternion class. Over k = ℚ̄ the class (x, y) ∈ Br(ℚ̄(x, y)) has period and index 2, as over ℂ.

**Direct prerequisites:** [Unramified period equals index on complex surfaces](#pi-2-complex-unramified-period-index); [Period and index under extension of algebraically closed fields](#pi-1-index-algebraically-closed-base-change); [De Jong's reduction to unramified classes](#pi-1-ramified-to-unramified-reduction); [Period and index of a Brauer class](#pi-0-brauer-period-index); ResolutionOfSingularitiesCharacteristicZero §7.8 (`resolution_field`).

**Source:** B19, Theorem 0.1, p. 63; §0.6, p. 68: De Jong's theorem; it reduces to characteristic 0, then to ℂ by the Lefschetz principle, and to the unramified case by \[25, §7]. CT05, §3.6, Theorem 3.14 and proof, pp. 400–403: The ramified case follows from the unramified one: reduction to prime period by induction and resolution, then a family whose geometric generic fibre carries the pulled-back class unramified, and specialisation.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/DeJong`, namespace `TauCeti.RealSurface`.

<a id="pi-2-real-closed-norm-bound"></a>

### Norm bound over a real closed field

`PI.2/real-closed-norm-bound` · theorem

Let R be a real closed field and F the function field of an integral surface over R. For α ∈ Br(F) of period n, ind(α) divides 2n; hence ind(α) ∈ {n, 2n}, and ind(α) = n if n is odd.

**Hypotheses and conventions.** R real closed (any, including the real Puiseux field); F of transcendence degree 2 over R; char 0.

**Proof.**

1. If √−1 ∈ F, F is the function field of a connected smooth projective surface over the algebraically closed field R(√−1) (a projective model resolved by ResolutionOfSingularitiesCharacteristicZero §7.8, `resolution_field`), and PI.2/de-jong-period-index gives ind = per.
2. Otherwise L = F(√−1) is likewise the function field of a connected smooth projective surface over R(√−1); by de Jong, ind(α\_L) = per(α\_L), which divides n.
3. Reverse index divisibility (PI.0/brauer-period-index): ind(α) divides \[L : F]·ind(α\_L) = 2 ind(α\_L), which divides 2n.
4. Period divides index and both have the same prime divisors (PI.0/brauer-period-index), so ind(α) ∈ {n, 2n}, and for odd n the factor 2 is excluded.

**Acceptance.** For Albert's class (x, x) + (y, xy) over ℝ(x, y), the period is 2 and the index is 4 = 2n. Every class of odd period over ℝ(S) has index equal to its period.

**Direct prerequisites:** [De Jong's period-index theorem in characteristic zero](#pi-2-de-jong-period-index); [Period and index of a Brauer class](#pi-0-brauer-period-index); ResolutionOfSingularitiesCharacteristicZero §7.8 (`resolution_field`).

**Source:** B19, §0.2, p. 63; §6.3, p. 95; §7.5, p. 104; §8.2, p. 108: De Jong's theorem and a norm argument give ind ∈ {per, 2 per}; odd period gives equality. B19, §0.4, p. 65: The biquaternion class (x, x) + (y, xy) has period 2 and index 4.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/NormBound`, namespace `TauCeti.RealSurface`.

## Layer PI.3: Ramified double covers

The finite rank-two cover Spec\_S(O ⊕ L⁻¹(−R)) branched along R ∪ D (normal, ordinary double points over Sing Δ); the incidence model rv² = sw² in ℙ\_S(O ⊕ L), its map to the finite model, its fixed singular centres (w = 0 over Sing R) and resolution, the family in a fixed threefold; local structure and Stein factorisation p\_\*O\_T = O\_S ⊕ L⁻¹(−R); étale and finite-flat strata; p\_\* is an isomorphism on H^{≥3} and onto on H² for L(R) ample; the image of the equivariant pushforward is cut out by the first real component.

*Builds on:* AffineMorseLefschetz §A3; AlgebraicModuliForArithmeticGeometry §1.1; AlgebraicTopologyPartII AT2.14/double-cover-local-system (gap:at2-double-cover-local-system); AlgebraicTopologyPartII AT2.14/ramified-triangle (gap:at2-ramified-triangle); AlgebraicTopologyPartII AT2.6/free-descent (gap:at2-free-descent); MotivesAndAlgebraicCycles §7.6a; MotivesAndAlgebraicCycles §7.6b; SchemeAndStackFoundations §0.1; SchemeAndStackFoundations §0.17; SchemeAndStackFoundations §2.2; SchemeAndStackFoundations §4.11; SchemeAndStackFoundations §4.13; SchemeAndStackFoundations §4.17; SchemeAndStackFoundations §4.9; SchemeAndStackFoundations §5.4; Tau Ceti roadmap `TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; Tau Ceti roadmap `TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

<a id="pi-3-branch-cover-finite-model"></a>

### The finite double cover branched along R ∪ D

`PI.3/branch-cover-finite-model` · construction

Let S be a smooth surface over a field of characteristic 0, R ⊂ S an SNC divisor with equation r ∈ H⁰(S, O(R)), L a line bundle and s ∈ H⁰(S, L²(R)) with smooth zero divisor D meeting R transversally and avoiding Sing R. Put M = L(R) and b = rs ∈ H⁰(S, M²). The finite model is C = Spec\_S(O\_S ⊕ M⁻¹), with multiplication M⁻¹ ⊗ M⁻¹ → O\_S given by b. It is finite locally free of rank 2, locally z² = rs, étale exactly over S ∖ (R ∪ D), normal, with ordinary double points exactly over Sing(R ∪ D); it carries the involution z ↦ −z with invariant subring O\_S.

**Hypotheses and conventions.** char 0; R SNC; D smooth, transverse to R, disjoint from Sing R. If R ∪ D = ∅ the cover is étale and may be disconnected; normality does not assert integrality.

**Construction.**

1. Locally, with M⁻¹ trivialised by z, the algebra is O\_S\[z]/(z² − b): Mathlib's QuadraticAlgebra O b 0, finite free of rank 2 with basis 1, z.
2. The discriminant is 4b, so the cover is étale exactly where rs is a unit, that is off R ∪ D.
3. Normality by Serre's criterion: a hypersurface in a smooth threefold is Cohen–Macaulay, hence S2 (SchemeAndStackFoundations §0.17; Serre's criterion is SchemeAndStackFoundations §4.13); it is regular in codimension one because rs vanishes to order 1 along each component of R ∪ D.
4. At a point of Sing(R ∪ D), local coordinates make b = xy and z² = xy is an ordinary double point; elsewhere on R ∪ D, b is a coordinate and the cover is smooth.

**Uses.** Benoist 2019, §§3.1–3.3, pp. 76–79: the finite flat part of the double cover over S₀. PI.3/incidence-double-cover: the incidence model maps to this finite model. PI.5/trace-zero-restriction: the two summands O\_S and M⁻¹ restrict to the auxiliary curve.

**API.**

- `RealSurface.branchCover` (data): C = Spec\_S(O\_S ⊕ M⁻¹) with multiplication by b = rs.
- `RealSurface.branchCover_finite_locallyFree` (other): C → S is finite locally free of rank 2.
- `RealSurface.branchCover_etale_iff` (characterisation): C → S is étale over x iff x ∉ R ∪ D.
- `RealSurface.branchCover_normal` (other): C is normal.
- `RealSurface.branchCover_singular` (characterisation): The singular points of C are ordinary double points, one over each point of Sing(R ∪ D).
- `RealSurface.branchCover_involution` (structure): The involution z ↦ −z, with invariants O\_S and anti-invariants M⁻¹.
- `RealSurface.branchCover_local` (compatibility): Over an open where M is trivial with b ↦ a, C is Spec of QuadraticAlgebra O a 0.

**Unit tests.**

- `RealSurface.branchCover_node` (computation): For r = x, s = y on 𝔸², C is Spec k\[x, y, z]/(z² − xy).
- `RealSurface.branchCover_unit` (degenerate): For b = 1, C ≅ S ⊔ S over S.
- `RealSurface.branchCover_quadraticAlgebra` (compatibility): Locally C ≅ Spec (QuadraticAlgebra O b 0), with the basis QuadraticAlgebra.basis.
- `RealSurface.branchCover_not_regular` (non-example): C is not regular over R ∩ D: a finite flat double cover of a smooth surface branched along an SNC divisor need not be smooth.

**Acceptance.** S = 𝔸², R = {x = 0}, D = {y = 0}: C = Spec k\[x, y, z]/(z² − xy), an A₁ singularity at the origin. R = D = ∅ and b = 1: C = S ⊔ S.

**Direct prerequisites:** `QuadraticAlgebra` (Mathlib); `QuadraticAlgebra.basis` (Mathlib); `QuadraticAlgebra.finrank_eq_two` (Mathlib); `QuadraticAlgebra.discr_def` (Mathlib); SchemeAndStackFoundations §0.17; SchemeAndStackFoundations §4.13; SchemeAndStackFoundations §0.1; SchemeAndStackFoundations §4.17.

**Source:** B19, §3.1, pp. 76–77: Double covers of S ramified over R ∪ D, defined by rv² = sw² in ℙ\_S(O ⊕ L); finite and of degree two away from the special points, with ordinary double points above Sing R. B19, (5.5), p. 87: The splitting p\_\*O\_T ≅ O\_S ⊕ L⁻¹(−R) induced by the involution.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/DoubleCover`, namespace `TauCeti.RealSurface`.

<a id="pi-3-incidence-double-cover"></a>

### The incidence model and its resolution

`PI.3/incidence-double-cover` · construction

In PI.3/branch-cover-finite-model, let X̄ = ℙ\_S(O ⊕ L) with tautological sections v ∈ H⁰(O(1)) and w ∈ H⁰(O(1) ⊗ f\*L⁻¹), and T̄ = {rv² = sw²} ⊂ X̄ with projection p̄ : T̄ → S. There is a proper morphism h : T̄ → C, given by z = r v/w where w ≠ 0 and z = s w/v where v ≠ 0, which is an isomorphism away from R ∩ D. The singular points of T̄ are exactly the points over Sing R with w = 0 (that is \[v : w] = \[1 : 0]), ordinary double points whose position in X̄ does not depend on s. T is the blow-up of T̄ at these points, p : T → S is proper and generically of degree 2, and blowing up X̄ at the same fixed points gives a smooth projective threefold X in which the T for s ∈ B form a smooth family π : 𝒯 → B ⊂ B × X. The map p is not finite: its fibres over R ∩ D and over Sing R are ℙ¹.

**Hypotheses and conventions.** B ⊂ H⁰(S, L²(R)) the open set of sections with D smooth, transverse to R and disjoint from Sing R. The fixed singular centres are where w vanishes (the published text says v; see RealSurfacePeriodIndex/E18).

**Construction.**

1. On w ≠ 0 write t = v/w, so T̄ is r t² = s; then z = r t satisfies z² = r²t² = rs. On v ≠ 0 write u = w/v, so r = s u², and z = s u satisfies z² = rs. On v, w ≠ 0 both give z = r v/w = s w/v, so h is well defined.
2. Away from R ∩ D one of r, s is a unit locally and h is an isomorphism; over R ∩ D the fibre of T̄ is the whole ℙ¹ (PI.3/incidence-local-resolution).
3. Jacobian criterion: over Sing R (where s is a unit and r = xy) the only singular point of the fibre is w = 0, an ordinary double point; elsewhere T̄ is smooth. The point w = 0 over Sing R is the same for every s.
4. Blow up these finitely many fixed points of X̄ to get X; strict transforms of the T̄ are the resolved T and form a smooth family over B (blow-ups and strict transforms: StableReduction Layer 4 and SchemeAndStackFoundations §4.11).

**Uses.** Benoist 2019, §§3–6: the double covers p : T → S used in Sections 4–6. PI.3/double-cover-strata: the strata over which p is étale or finite flat. PI.5/curve-lift: the auxiliary curve lifts to T. PI.6/vanishing-variation: the family 𝒯 → B carries the variation of Hodge structure.

**API.**

- `RealSurface.incidenceModel` (data): T̄ = {rv² = sw²} ⊂ ℙ\_S(O ⊕ L) with p̄ : T̄ → S.
- `RealSurface.incidenceModel.toBranchCover` (constructor): h : T̄ → C, proper, an isomorphism off R ∩ D.
- `RealSurface.incidenceModel.singularLocus_eq` (characterisation): Sing T̄ = {points over Sing R with w = 0}, independent of s.
- `RealSurface.resolvedCover` (data): T = Bl\_{Sing T̄} T̄ with p : T → S proper and generically of degree 2.
- `RealSurface.resolvedFamily` (constructor): The smooth projective family 𝒯 → B inside B × X, X the blow-up of X̄ at the fixed points.
- `RealSurface.resolvedCover_involution` (structure): The covering involution v ↦ −v extends to T and commutes with p.

**Unit tests.**

- `RealSurface.incidenceModel_crossing_chart` (computation): At a crossing r = x, s = y, the charts (x, a) with y = xa², z = xa and (y, c) with x = yc², z = yc cover T̄ and glue by c = a⁻¹.
- `RealSurface.incidenceModel_finite_of_disjoint` (degenerate): If R ∩ D = ∅ and R is smooth then p̄ is finite and T̄ = C.
- `RealSurface.incidenceModel_pushforward` (compatibility): p\_\*O\_T ≅ O\_S ⊕ L⁻¹(−R), the structure sheaf of PI.3/branch-cover-finite-model.
- `RealSurface.incidenceModel_not_finite` (non-example): If R ∩ D ≠ ∅, p̄ has a ℙ¹ fibre and is not finite.

**Acceptance.** If R ∩ D = ∅ and R is smooth, T̄ = C is finite over S and T = T̄. Over a node of R, T has a single exceptional ℙ¹, mapping to the node.

**Direct prerequisites:** [The finite double cover branched along R ∪ D](#pi-3-branch-cover-finite-model); AlgebraicModuliForArithmeticGeometry §1.1; SchemeAndStackFoundations §5.4; SchemeAndStackFoundations §4.11; Tau Ceti roadmap `TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source:** B19, §3.1, pp. 76–77: The incidence surface rv² = sw² in ℙ\_S(O ⊕ L), its ordinary double points above Sing R, the minimal resolution T and the family 𝒯 ⊂ B × X after blowing up fixed points. B19, §5.1–5.2, pp. 85–86: The family of resolved double covers is viewed as a family of surfaces in a fixed smooth projective threefold.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/DoubleCover`, namespace `TauCeti.RealSurface`.

<a id="pi-3-incidence-local-resolution"></a>

### Local structure and Stein factorisation of the incidence model

`PI.3/incidence-local-resolution` · theorem

At a point of R ∩ D the surface T̄ is smooth and h : T̄ → C is the minimal resolution of the node z² = rs, with exceptional ℙ¹ of self-intersection −2 (equivalently the blow-up of the ideal (r, z)). The resolved cover factors as T → C → S, both T → C and T̄ → C satisfy h\_\*O = O\_C, R^i h\_\*O = 0 for i > 0 and have geometrically connected fibres, so C = Spec\_S(p\_\*O\_T) and p\_\*O\_T = O\_S ⊕ L⁻¹(−R) compatibly with the involution.

**Hypotheses and conventions.** The setting of PI.3/incidence-double-cover.

**Proof.**

1. Charts at a crossing: s = r x², z = r x and r = s y², z = s y with y = x⁻¹; both are affine planes, so T̄ is smooth there, and the exceptional curve is ℙ¹ with normal bundle O(−2).
2. The Čech computation on the two charts gives Γ(O) = k\[r, rx, rx²] ≅ k\[r, z, s]/(z² − rs) and vanishing higher cohomology, hence h\_\*O = O\_C and R^i h\_\*O = 0 (SchemeAndStackFoundations §2.2 Čech comparison).
3. Over Sing R the blow-up of the ordinary double point has the same two properties (rational singularity), and h is proper birational onto the normal C, so h\_\*O = O\_C (proper birational maps to normal schemes; SchemeAndStackFoundations §4.9 Stein factorisation).
4. Hence p\_\*O\_T = (C → S)\_\*O\_C = O\_S ⊕ M⁻¹ with M = L(R), and the involution acts by +1 and −1 on the two summands.

**Acceptance.** The exceptional curve over a crossing has self-intersection −2 on T.

**Direct prerequisites:** [The incidence model and its resolution](#pi-3-incidence-double-cover); [The finite double cover branched along R ∪ D](#pi-3-branch-cover-finite-model); SchemeAndStackFoundations §4.9; SchemeAndStackFoundations §2.2.

**Source:** B19, §3.1, p. 76; Lemma 5.3 proof, p. 87: Ordinary double points, the minimal resolution, rational singularities and the splitting of p\_\*O\_T by the involution.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/DoubleCover`, namespace `TauCeti.RealSurface`.

<a id="pi-3-double-cover-strata"></a>

### The étale and finite-flat strata of the double cover

`PI.3/double-cover-strata` · definition

For p : T → S of PI.3/incidence-double-cover put Δ = R ∪ D, S\* = S ∖ Δ, S₀ = S ∖ Sing Δ, T\* = p⁻¹S\*, T₀ = p⁻¹S₀, j₀ : S\* ↪ S₀ and E = p⁻¹(Sing Δ) = T ∖ T₀. Then p : T\* → S\* is finite étale of degree 2, p : T₀ → S₀ is finite locally free of rank 2, E(ℂ) is a disjoint union of copies of ℙ¹(ℂ), one over each point of Sing Δ(ℂ), and the sign local system Z̃ of T\*(ℂ) → S\*(ℂ) is the G-equivariant rank-one local system of AlgebraicTopologyPartII AT2.14/double-cover-local-system. Over a smooth point of Δ the scheme fibre has length 2 and is nonreduced.

**Hypotheses and conventions.** G = Gal(ℂ/ℝ) when S is defined over ℝ; geometric point counts are not flat degrees.

**Construction.**

1. Over S₀ the map T₀ → S₀ is the finite model C restricted to S₀ (PI.3/incidence-local-resolution: h is an isomorphism off R ∩ D and the fixed centres), hence finite locally free of rank 2.
2. Over S\* it is étale (PI.3/branch-cover-finite-model).
3. Over Sing Δ the fibre of T is ℙ¹: over R ∩ D the incidence fibre, over Sing R the exceptional curve of the blow-up.

**Uses.** Benoist 2019, Propositions 3.2–3.3 and 4.4, pp. 78–84: long exact sequences with supports along E and P, and the triangle on S₀. PI.3/complex-pushforward-iso: the diagram chase with cohomology supported on E and P. PI.4/uniform-obstruction-vanishing: the classes on S\*, S₀ and T₀.

**API.**

- `RealSurface.DoubleCoverStrata` (structure): S\*, S₀, T\*, T₀, E, P = Sing Δ and j₀ for the double cover p.
- `RealSurface.DoubleCoverStrata.etale` (other): p : T\* → S\* is finite étale of degree 2.
- `RealSurface.DoubleCoverStrata.finiteFlat` (other): p : T₀ → S₀ is finite locally free of rank 2.
- `RealSurface.DoubleCoverStrata.exceptional_fibre` (characterisation): E(ℂ) ≅ P(ℂ) × ℙ¹(ℂ) over P(ℂ).
- `RealSurface.DoubleCoverStrata.signLocalSystem` (data): Z̃ on S\*(ℂ), the AT2.14 sign local system of T\* → S\*.

**Unit tests.**

- `RealSurface.DoubleCoverStrata.fibre_smooth_branch` (computation): Over x ∈ R ∖ (Sing R ∪ D), the fibre is Spec κ(x)\[z]/(z²), of length 2 with one geometric point.
- `RealSurface.DoubleCoverStrata.exceptional_empty` (degenerate): If Δ is smooth then E = ∅ and T₀ = T.
- `RealSurface.DoubleCoverStrata.signLocalSystem_compat` (compatibility): Z̃ is coker(ℤ → p\_\*ℤ) on S\*(ℂ), as in AT2.14.
- `RealSurface.DoubleCoverStrata.pointCount_not_degree` (non-example): The number of geometric points in the fibre is 1 over Δ ∖ Sing Δ and 2 over S\*, although the flat degree over S₀ is constantly 2.

**Acceptance.** E is empty iff Δ is smooth. Over a point of R ∖ Sing R the fibre is Spec k\[z]/(z²).

**Direct prerequisites:** [The incidence model and its resolution](#pi-3-incidence-double-cover); [Local structure and Stein factorisation of the incidence model](#pi-3-incidence-local-resolution); AlgebraicTopologyPartII AT2.14/double-cover-local-system (gap:at2-double-cover-local-system).

**Source:** B19, §3.2, p. 77; §3.3, p. 78: S\*, S₀, j₀, the restrictions of p, the sign local system Z̃, P = Sing Δ and E = p⁻¹(P), a disjoint union of copies of ℙ¹(ℂ).

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/DoubleCover`, namespace `TauCeti.RealSurface`.

<a id="pi-3-complex-pushforward-iso"></a>

### Pushforward on the complex double cover

`PI.3/complex-pushforward-iso` · theorem

If L(R) is ample, then p\_\* : H^i(T(ℂ), ℤ) → H^i(S(ℂ), ℤ) is an isomorphism for i ≥ 3 and surjective for i = 2.

**Hypotheses and conventions.** L(R) ample (Assumption 3.1), so O\_S(Δ) ≅ L²(2R) is ample and S\*, T\* are affine.

**Proof.**

1. S\* and its finite étale cover T\* are smooth affine surfaces, so their integral cohomology vanishes in degrees ≥ 3 (AffineMorseLefschetz §A3); the sign sequence then kills H^i(S\*, Z̃) for i ≥ 3.
2. The triangle Rj₀\_\*Z̃ → p\_\*ℤ → ℤ on S₀(ℂ) (AlgebraicTopologyPartII AT2.14/ramified-triangle) gives p\_\* : H^i(T₀) ≅ H^i(S₀) for i ≥ 3 and onto for i = 2.
3. Compare the long exact sequences with supports along E ⊂ T and P ⊂ S; p\_\* : H^j(E) → H^{j−2}(P) is an isomorphism for j ≥ 1 because E is a union of ℙ¹'s over P, and the five lemma concludes.

**Acceptance.** The connected components of T(ℂ) and S(ℂ) correspond (i = 4).

**Direct prerequisites:** [The étale and finite-flat strata of the double cover](#pi-3-double-cover-strata); AffineMorseLefschetz §A3; AlgebraicTopologyPartII AT2.14/ramified-triangle (gap:at2-ramified-triangle); Tau Ceti roadmap `TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Source:** B19, Assumption 3.1 and Proposition 3.2, p. 78: Under L(R) ample, p\_\* is an isomorphism in degrees ≥ 3 and onto in degree 2, by Andreotti–Frankel, the triangle (3.2) and a diagram chase with supports.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/DoubleCover`, namespace `TauCeti.RealSurface`.

<a id="pi-3-equivariant-pushforward-image"></a>

### Image of the equivariant pushforward

`PI.3/equivariant-pushforward-image` · theorem

Let S be defined over ℝ and L(R) ample. Put I = im(p\_\* : H¹(T(ℝ), 𝔽₂) → H¹(S(ℝ), 𝔽₂)). For every i ≥ 2 the image of p\_\* : H^i\_G(T(ℂ), ℤ(i−1)) → H^i\_G(S(ℂ), ℤ(i−1)) is exactly {ξ : \[ξ]₁ ∈ I}.

**Hypotheses and conventions.** L(R) ample; real components \[ξ]₁ as in MotivesAndAlgebraicCycles §7.6b.

**Proof.**

1. For i ≥ 5, restriction to the real locus is an isomorphism (AlgebraicTopologyPartII AT2.6/free-descent, i > 2·dim) and the canonical decomposition identifies both groups with H¹ of the real loci; pushforward acts on real coordinates by the real Gysin map (MotivesAndAlgebraicCycles §7.6b).
2. Descending induction: the real–complex exact sequences (MotivesAndAlgebraicCycles §7.6a) for T and S, connected by pushforwards, with PI.3/complex-pushforward-iso on the ordinary terms and the induction hypothesis in degree i + 1, identify the image with {ξ : \[ξ ∪ ω]₁ ∈ I}.
3. \[ξ ∪ ω]₁ = \[ξ]₁ (invariance of integral components under ω, MotivesAndAlgebraicCycles §7.6b).

**Acceptance.** If T(ℝ) → S(ℝ) is onto in H¹, every class is a pushforward for i ≥ 2.

**Direct prerequisites:** [Pushforward on the complex double cover](#pi-3-complex-pushforward-iso); AlgebraicTopologyPartII AT2.6/free-descent (gap:at2-free-descent); MotivesAndAlgebraicCycles §7.6a; MotivesAndAlgebraicCycles §7.6b.

**Source:** B19, Proposition 3.3, p. 79: Real substitute for weak Lefschetz: the image of the equivariant pushforward is cut out by the first real component lying in I, by descending induction through real–complex sequences.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/DoubleCover`, namespace `TauCeti.RealSurface`.

## Layer PI.4: Pulling back a period-two class to a double cover

Assumption 4.1 on the cover (avoidance of Ψ ⊃ Θ, kernel generation, H² injectivity); the pulled-back class is unramified; its topological obstruction is killed by ω; uniform-evaluation forms of Propositions 4.4–4.5 (obstruction vanishing, trace-quotient Picard correction, curve adjustment, integral pushforward adjustment).

*Builds on:* RealSurfacePeriodIndex PI.0; RealSurfacePeriodIndex PI.1; RealSurfacePeriodIndex PI.3; AlgebraicTopologyPartII AT2.14/double-cover-extension (gap:at2-double-cover-extension); AlgebraicTopologyPartII AT2.15/corrected-integral-lift (gap:at2-corrected-integral-lift); AlgebraicTopologyPartII AT2.15/trace-quotient-lift (gap:at2-trace-quotient-lift); AlgebraicTopologyPartII AT2.15/trace-zero-operator (gap:at2-trace-zero-operator); AlgebraicTopologyPartII AT2.16/double-cover-diagram (gap:at2-double-cover-diagram); AlgebraicTopologyPartII AT2.6/free-descent (gap:at2-free-descent); AlgebraicTopologyPartII AT2.7/twisted-bockstein (gap:at2-twisted-bockstein); HeightsRationalPointsAndObstructions §2.16b; MotivesAndAlgebraicCycles §0.5b; MotivesAndAlgebraicCycles §7.6a; MotivesAndAlgebraicCycles §7.6b; MotivesAndAlgebraicCycles §7.8 (gap:picard-cokernel-torsion-free); SchemeAndStackFoundations §3.4.

<a id="pi-4-brauer-cover-hypotheses"></a>

### Hypotheses on a double cover killing a period-two class

`PI.4/brauer-cover-hypotheses` · definition

Let S be a connected smooth projective surface over ℝ, α ∈ Br(ℝ(S)) of period 2 whose ramification divisor R is SNC, U = S ∖ R, Θ = Θ(α) ⊂ U(ℝ), and Ψ ⊂ U(ℝ) a subset open and closed in U(ℝ) with Θ ⊂ Ψ. For a double cover p : T → S of PI.3/incidence-double-cover ramified over R ∪ D, Assumption 4.1 is: (i) p(T(ℝ)) ∩ Ψ = ∅; (ii) the kernel of H¹(S(ℝ), 𝔽₂) → H¹(Ψ, 𝔽₂) is generated by p\_\*H¹(T(ℝ), 𝔽₂) and the Borel–Haefliger classes cl\_R(Γ) of curves Γ ⊂ S with Γ(ℝ) ∩ Ψ = ∅; (iii) p\_\* : H²(T(ℝ), 𝔽₂) → H²(S(ℝ), 𝔽₂) is injective. Since Δ(ℝ) ⊂ p(T(ℝ)), (i) forces Ψ ⊂ S\*(ℝ).

**Hypotheses and conventions.** Cohomology of real loci with 𝔽₂ coefficients; cl\_R is the Borel–Haefliger class of MotivesAndAlgebraicCycles §7.6b. Ψ need not be closed in S(ℝ).

**Construction.**

1. (i)–(iii) are conditions on the real topology of the cover; their consequences are proved in PI.4 and their verification in PI.6/topology-to-cover-hypotheses.
2. Over a point of Δ(ℝ) the fibre of p has a real point (the ramification point or a real ℙ¹), so Δ(ℝ) ⊂ p(T(ℝ)) and (i) gives Ψ ∩ Δ(ℝ) = ∅.

**Uses.** Benoist 2019, Propositions 4.2–4.5, pp. 80–85: the standing hypotheses of Section 4. PI.6/topology-to-cover-hypotheses: Lemma 6.5 verifies (i)–(iii). PI.6/degree-two-splitting-uniform: the cover in Proposition 6.6 satisfies them.

**API.**

- `RealSurface.BrauerCoverHypotheses` (structure): The three conditions (i)–(iii) for (S, α, Ψ, p).
- `RealSurface.BrauerCoverHypotheses.avoid` (projection): p(T(ℝ)) ∩ Ψ = ∅.
- `RealSurface.BrauerCoverHypotheses.kernel_generated` (projection): ker(H¹(S(ℝ)) → H¹(Ψ)) = p\_\*H¹(T(ℝ)) + span of cl\_R of curves avoiding Ψ.
- `RealSurface.BrauerCoverHypotheses.h2_injective` (projection): p\_\* is injective on H² of real loci.
- `RealSurface.BrauerCoverHypotheses.subset_etale` (other): Ψ ⊂ S\*(ℝ).

**Unit tests.**

- `RealSurface.BrauerCoverHypotheses.of_no_real_points` (degenerate): If S(ℝ) = ∅ the hypotheses hold for Ψ = ∅ and every cover.
- `RealSurface.BrauerCoverHypotheses.of_no_real_cover` (computation): If T(ℝ) = ∅, (i) and (iii) hold for every Ψ, and (ii) says the kernel is spanned by classes of curves avoiding Ψ.
- `RealSurface.BrauerCoverHypotheses.fails_of_branch_in_psi` (non-example): If D(ℝ) ∩ Ψ ≠ ∅, condition (i) fails.
- `RealSurface.BrauerCoverHypotheses.theta_allowed` (compatibility): Ψ = Θ(α) is always admissible, Θ(α) being open and closed in U(ℝ) (PI.1/real-evaluation-locus).

**Acceptance.** If S(ℝ) = ∅, then Ψ = ∅ and (i)–(iii) hold for every cover. If D(ℝ) meets Ψ, (i) fails. On S = ℙ²\_ℝ with R a real line, Ψ = U(ℝ) ≅ ℝ² is open and closed in U(ℝ) but not closed in S(ℝ); condition (ii) can hold, the generator cl\_R(R) of H¹(ℝℙ², 𝔽₂) being the class of a curve whose real locus misses Ψ.

**Direct prerequisites:** [The incidence model and its resolution](#pi-3-incidence-double-cover); [The étale and finite-flat strata of the double cover](#pi-3-double-cover-strata); [Real evaluation and the nonzero evaluation locus](#pi-1-real-evaluation-locus); [Unramified locus of a Brauer class](#pi-1-unramified-locus); MotivesAndAlgebraicCycles §7.6b.

**Source:** B19, §4 and Assumption 4.1, pp. 79–80: Notation U, Θ and Ψ, open and closed in U(ℝ) and containing Θ; the three conditions on p : T → S; Ψ ⊂ S\*(ℝ) follows from (i).

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/BrauerCover`, namespace `TauCeti.RealSurface`.

<a id="pi-4-pullback-unramified"></a>

### The pulled-back class is unramified

`PI.4/pullback-unramified` · theorem

Under Assumption 4.1, α\_{ℝ(T)} ∈ Br(T)\[2] ⊂ Br(ℝ(T))\[2].

**Hypotheses and conventions.** Assumption 4.1 (PI.4/brauer-cover-hypotheses).

**Proof.**

1. Residues vanish along integral curves of T not lying over R, because α is unramified on U and pullback preserves this.
2. Along a curve dominating a component of R, the ramification index is 2 and the residue of the restriction is the ramification index times the restricted residue (HeightsRationalPointsAndObstructions §2.16b, `pullbackMultiplicity`), which kills a class of period 2.
3. The remaining curves Γ are ℙ¹'s contracted by p: the exceptional curves over Sing R and the ℙ¹ fibres over R ∩ D of the incidence model (both kinds must be treated). The ramification locus of α\_{ℝ(T)} is then smooth, so, the Gersten complex being a complex (MotivesAndAlgebraicCycles §0.5b), res\_Γ(α) ∈ H¹(ℝ(Γ), ℤ/2) is unramified on Γ.
4. If Γ ≅ ℙ¹\_ℂ, H¹\_ét(Γ, ℤ/2) = 0. If Γ ≅ ℙ¹\_ℝ, it suffices to show res\_Γ(α)|\_x = 0 at one x ∈ Γ(ℝ): choose a curve Γ′ through x transverse to Γ and meeting T\_U; at general real points y of Γ′, p(y) ∉ Ψ ⊃ Θ by (i), so (p\*α)\_y = 0, and Witt's theorem (PI.0/witt-real-curve (b), which allows ramification of the class on Γ′) gives p\*α|\_{ℝ(Γ′)} = 0, so its residue at x, which is res\_Γ(α)|\_x, vanishes.
5. All residues along curves of T vanish, so α\_{ℝ(T)} ∈ Br(T) by purity for the regular surface T (HeightsRationalPointsAndObstructions §2.16b, `smoothBrauer_residueExact`).

**Acceptance.** If R = ∅ the statement is that α\_{ℝ(T)} is unramified on T, which is immediate.

**Direct prerequisites:** [Hypotheses on a double cover killing a period-two class](#pi-4-brauer-cover-hypotheses); HeightsRationalPointsAndObstructions §2.16b (`pullbackMultiplicity`); HeightsRationalPointsAndObstructions §2.16b (`smoothBrauer_residueExact`); MotivesAndAlgebraicCycles §0.5b; [Witt's theorem on Brauer classes of real curves](#pi-0-witt-real-curve); [Unramified locus of a Brauer class](#pi-1-unramified-locus); [The étale and finite-flat strata of the double cover](#pi-3-double-cover-strata).

**Source:** B19, Proposition 4.2 and proof, p. 80: α\_{ℝ(T)} is unramified: residues along curves over R vanish by ramification index 2; on exceptional curves by Gersten and Witt's theorem along a transverse curve.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/BrauerCover`, namespace `TauCeti.RealSurface`.

<a id="pi-4-obstruction-cup-omega"></a>

### The topological obstruction is killed by ω

`PI.4/obstruction-cup-omega` · theorem

Under Assumptions 3.1 and 4.1, let τ ∈ H³\_G(T(ℂ), ℤ(1))\[2] be the image of α\_{ℝ(T)} ∈ Br(T)\[2] in the real topological Brauer sequence 0 → H²\_G(ℤ(1))/⟨2, Pic⟩ → Br\[2] → H³\_G(ℤ(1))\[2] → 0. Then τ ∪ ω = 0 in H⁴\_G(T(ℂ), ℤ).

**Hypotheses and conventions.** Assumptions 3.1 and 4.1; S connected.

**Proof.**

1. The pushforward square from Br(T)\[2] → H³\_G(T, ℤ(1)) → H⁴\_G(T, ℤ) → H⁰ ⊕ H²(T(ℝ)) to the same row for S commutes (equivariant Gysin compatibility, MotivesAndAlgebraicCycles §7.6b).
2. p\_\*(α\_T) = 2α = 0, so p\_\*\[τ ∪ ω]₂ = 0; by (iii) \[τ ∪ ω]₂ = 0. By (i), α evaluates to 0 at p(x) for x ∈ T(ℝ), so \[τ ∪ ω]₀ = 0.
3. The norm sequence H⁴(T(ℂ), ℤ) → H⁴\_G(T(ℂ), ℤ) → H⁰ ⊕ H²(T(ℝ)) is exact: the kernel of ∪ω is the norm image (real–complex sequence, MotivesAndAlgebraicCycles §7.6a; BW20 Lemma 2.11 (ii)), restriction H⁵\_G(T(ℂ), ℤ(1)) → H⁵\_G(T(ℝ), ℤ(1)) is an isomorphism above twice the dimension (AlgebraicTopologyPartII AT2.6/free-descent), and the real components of ξ ∪ ω are those of ξ (MotivesAndAlgebraicCycles §7.6b). So τ ∪ ω = N(c) for some c; T(ℂ) has one component or two exchanged by conjugation (PI.3/complex-pushforward-iso in degree 4), so τ ∪ ω = m·cl(y + σy) for a point y.
4. Pushing forward to H⁴(S(ℂ), ℤ) kills τ ∪ ω, so m·cl(p(y) + p(σy)) = 0, forcing m = 0.

**Acceptance.** If T(ℝ) = ∅ then the real components vanish trivially and only the norm argument is needed.

**Direct prerequisites:** [The pulled-back class is unramified](#pi-4-pullback-unramified); [Pushforward on the complex double cover](#pi-3-complex-pushforward-iso); [Kummer and topological Brauer sequences](#pi-1-kummer-brauer-sequences); MotivesAndAlgebraicCycles §7.6a; MotivesAndAlgebraicCycles §7.6b; AlgebraicTopologyPartII AT2.6/free-descent (gap:at2-free-descent).

**Source:** B19, Proposition 4.3 and proof, pp. 80–81: τ ∪ ω = 0, from the pushforward diagram (4.1), Assumption 4.1 (i) and (iii), the norm sequence of BW1 Lemma 2.11(ii) and degrees of zero-cycles.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/BrauerCover`, namespace `TauCeti.RealSurface`.

<a id="pi-4-uniform-first-component"></a>

### The boundary component under constant real evaluation

`PI.4/uniform-first-component` · theorem

In the setting of PI.4/brauer-cover-hypotheses let α̃ ∈ H²\_G(U(ℂ), 𝔽₂) lift α, with components a₀ = \[α̃]₀, a₁ = \[α̃]₁ on Ψ, and let ζ = ∂(α̃|\_{S\*}) ∈ H³\_G(S\*(ℂ), Z̃(1)) for the boundary of 0 → Z̃(1) → Z̃(1) → 𝔽₂ → 0, and e ∈ H¹\_G(S\*(ℂ), 𝔽₂) the class of the double cover. If a₁|\_Ψ = 0 and a₀|\_Ψ is a constant t ∈ 𝔽₂, then \[ζ]₁|\_Ψ = t·\[e]₁|\_Ψ, which equals t·cl\_R(φ)|\_Ψ for any φ ∈ Pic(S) extending the 2-torsion line bundle υ(e) on S\*.

**Hypotheses and conventions.** Ψ ⊂ S\*(ℝ) (consequence of Assumption 4.1 (i)); on Ψ conjugation acts by −1 on Z̃, so the relevant coefficient twist has +1 stalks.

**Proof.**

1. The boundary for the twisted sequence is the twisted Bockstein: Bockstein plus cup with e + ω (AlgebraicTopologyPartII AT2.14/double-cover-extension, AT2.7/twisted-bockstein).
2. On Ψ, \[e + ω]₀ = 1 + 1 = 0 and \[e + ω]₁ = \[e]₁, so in canonical components (a₀, a₁, a₂) ↦ (0, a₁ + a₀·\[e]₁, β(a₁) + a₁·\[e]₁) (cup-product formula in canonical components, MotivesAndAlgebraicCycles §7.6b).
3. With a₁ = 0 and a₀ = t this gives \[ζ]₁ = t·\[e]₁ on Ψ.
4. PI.1/two-torsion-line-bundle-class (cl\_R(υ(e)) = \[e]₁) and surjectivity of Pic(S) → Pic(S\*) (SchemeAndStackFoundations §3.4) give φ.

**Acceptance.** For t = 0 (the case 4 | n in the induction) \[ζ]₁|\_Ψ = 0 and no Picard correction is needed. For t = 1 this recovers the printed formula \[ζ]₁ = \[e]₁ of the source.

**Direct prerequisites:** [Hypotheses on a double cover killing a period-two class](#pi-4-brauer-cover-hypotheses); [The étale and finite-flat strata of the double cover](#pi-3-double-cover-strata); AlgebraicTopologyPartII AT2.14/double-cover-extension (gap:at2-double-cover-extension); AlgebraicTopologyPartII AT2.7/twisted-bockstein (gap:at2-twisted-bockstein); MotivesAndAlgebraicCycles §7.6b; [The real class of a two-torsion line bundle](#pi-1-two-torsion-line-bundle-class); SchemeAndStackFoundations §3.4.

**Source:** B19, Proof of Proposition 4.4, (4.8), p. 84: Computation of the diagonal boundary in canonical decompositions; the printed conclusion \[ζ]₁ = \[e]₁ uses a₀ = 1 on Ψ (see RealSurfacePeriodIndex/E3). B19, Lemma 2.1, p. 75: The real class of the 2-torsion line bundle of a double-cover class is its degree-one component.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/BrauerCover`, namespace `TauCeti.RealSurface`.

<a id="pi-4-uniform-obstruction-vanishing"></a>

### Vanishing of the topological obstruction for uniform evaluation

`PI.4/uniform-obstruction-vanishing` · theorem

Under Assumptions 3.1 and 4.1, suppose α has a Kummer lift α̃ ∈ H²\_G(U(ℂ), 𝔽₂) with \[α̃]₁|\_Ψ = 0 and \[α̃]₀|\_Ψ constant equal to t ∈ 𝔽₂. Then the obstruction τ of PI.4/obstruction-cup-omega vanishes, so α\_{ℝ(T)} lifts to a class β ∈ H²\_G(T(ℂ), ℤ(1)).

**Hypotheses and conventions.** The uniform-evaluation hypothesis on Ψ; this is the restricted form of the source's Proposition 4.4 that the main induction uses. The homological comparison (4.5) is AlgebraicTopologyPartII AT2.16/double-cover-diagram, with its plus sign and indeterminacy (gap:at2-double-cover-diagram).

**Proof.**

1. By PI.4/obstruction-cup-omega and the real–complex sequence, τ = N(γ) with γ ∈ H³(T(ℂ), ℤ); p\_\*γ lifts to δ ∈ H³\_G(S(ℂ), ℤ).
2. Claim: after replacing δ by δ − ξ ∪ ω for some ξ ∈ H²\_G(S(ℂ), ℤ(1)), \[δ]₁|\_Ψ = 0. The double-cover chase comparison (AT2.16/double-cover-diagram) gives η₀ on S₀ with g(δ|\_{S₀}) + ζ ∪ ω = g(η₀ ∪ ω); extend η₀ to S by equivariant purity (MotivesAndAlgebraicCycles §7.6b) and replace δ by δ − (η + t·cl(φ)) ∪ ω, with φ from PI.4/uniform-first-component.
3. Restricting to Ψ in canonical components, \[g(δ)]₁ = \[δ]₁, \[g(cl(φ) ∪ ω)]₁ = cl\_R(φ) = \[e]₁ and \[ζ ∪ ω]₁ = \[ζ]₁ = t\[e]₁, so the relation gives \[δ]₁|\_Ψ = 0.
4. By Assumption 4.1 (ii) there is θ ∈ Pic(S) with \[δ]₁ − cl\_R(θ) ∈ I, and by PI.3/equivariant-pushforward-image δ = p\_\*ε + cl(θ) ∪ ω; since p\_\* is an isomorphism on H³ (PI.3/complex-pushforward-iso), the diagram chase gives τ = 0.

**Acceptance.** For S(ℝ) = ∅ the hypotheses are empty and τ = 0 for every cover satisfying Assumption 3.1.

**Direct prerequisites:** [The topological obstruction is killed by ω](#pi-4-obstruction-cup-omega); [The boundary component under constant real evaluation](#pi-4-uniform-first-component); [Image of the equivariant pushforward](#pi-3-equivariant-pushforward-image); [Pushforward on the complex double cover](#pi-3-complex-pushforward-iso); AlgebraicTopologyPartII AT2.16/double-cover-diagram (gap:at2-double-cover-diagram); MotivesAndAlgebraicCycles §7.6b.

**Source:** B19, Proposition 4.4 and proof, pp. 81–84: τ = 0 when a lift with vanishing first component on Ψ exists, by the chase (4.2)–(4.8) and Assumption 4.1 (ii). B19, (4.3)–(4.5), pp. 82–83: Comparison of the two diagram chases up to a class from H²\_G(S₀, ℤ(1)), by a homological lemma cited there.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/BrauerCover`, namespace `TauCeti.RealSurface`.

<a id="pi-4-primitive-picard-trace-correction"></a>

### Primitive Picard correction of the trace comparison

`PI.4/primitive-picard-trace-correction` · theorem

Let a ∈ Br(U)\[2] satisfy the hypotheses of PI.4/uniform-obstruction-vanishing, V = U ∩ S₀ the finite-flat part, and let η, ζ be the trace-quotient lift of the Kummer lift on V (AlgebraicTopologyPartII AT2.15/trace-quotient-lift), with b = p\*η − ψ(ζ) on T\_V (AT2.15/corrected-integral-lift). If β ∈ H²\_G(T(ℂ), ℤ(1)) lifts α\_{ℝ(T)}, write β|\_{T\_V} = b + 2γ₀ + cl(φ₀) and p\_\*β = 2δ + cl(θ₁). Then there is μ ∈ Pic(S) with δ|\_V − η − p\_\*γ₀ = cl(μ|\_V).

**Hypotheses and conventions.** n = 2; V the open where p is finite flat; the minus sign in b is essential.

**Proof.**

1. β|\_{T\_V} and b both lift p\*α in the topological Brauer sequence on T\_V, so they differ by 2γ₀ + cl(φ₀).
2. p\_\*β induces p\_\*p\*α = 2α = 0, so p\_\*β = 2δ + cl(θ₁).
3. Push the first identity forward: p\_\*b = 2η since Tr∘ψ = 0; thus 2(δ|\_V − η − p\_\*γ₀) = cl(p\_\*φ₀ − θ₁|\_V).
4. The cokernel of cl : Pic(V) → H²\_G(V(ℂ), ℤ(1)) is torsion-free (gap:picard-cokernel-torsion-free; Benoist–Wittenberg Proposition 2.9), and Pic(S) → Pic(V) is onto (SchemeAndStackFoundations §3.4), which produces μ.

**Acceptance.** If α = 0 one may take η, ζ, β zero and μ = 0.

**Direct prerequisites:** [Vanishing of the topological obstruction for uniform evaluation](#pi-4-uniform-obstruction-vanishing); AlgebraicTopologyPartII AT2.15/trace-quotient-lift (gap:at2-trace-quotient-lift); AlgebraicTopologyPartII AT2.15/corrected-integral-lift (gap:at2-corrected-integral-lift); AlgebraicTopologyPartII AT2.15/trace-zero-operator (gap:at2-trace-zero-operator); [The étale and finite-flat strata of the double cover](#pi-3-double-cover-strata); [Kummer and topological Brauer sequences](#pi-1-kummer-brauer-sequences); MotivesAndAlgebraicCycles §7.8 (gap:picard-cokernel-torsion-free); SchemeAndStackFoundations §3.4.

**Source:** B19, Proposition 4.5 proof, pp. 84–85: Comparison of β with a lift on T\_U and use of the torsion-free cokernel of Krasnov's cycle class map; the printed proof adds a mod-2 class to integral classes (RealSurfacePeriodIndex/E4). BW20, Proposition 2.9, first assertion: For smooth X over ℝ, the cokernel of cl : Pic(X) → H²\_G(X(ℂ), ℤ(1)) is torsion-free.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/BrauerCover`, namespace `TauCeti.RealSurface`.

<a id="pi-4-curve-adjustment"></a>

### Curve adjustment before the pushforward criterion

`PI.4/curve-adjustment` · theorem

Under Assumption 4.1 (ii), if d ∈ H²\_G(S(ℂ), ℤ(1)) has \[d]₁|\_Ψ = 0, there is ν ∈ Pic(S), an integral combination of curves whose real loci avoid Ψ, such that \[d − cl(ν)]₁ ∈ p\_\*H¹(T(ℝ), 𝔽₂). If moreover L(R) is ample, d − cl(ν) = p\_\*γ for some γ ∈ H²\_G(T(ℂ), ℤ(1)).

**Hypotheses and conventions.** Assumption 4.1 (ii); for the second assertion Assumption 3.1.

**Proof.**

1. \[d]₁ lies in the kernel of H¹(S(ℝ)) → H¹(Ψ), so by (ii) it is a sum of p\_\*c and of cl\_R(Γ\_k) for curves Γ\_k avoiding Ψ.
2. cl\_R(Γ) = \[cl(O(Γ))]₁ (compatibility of Krasnov and Borel–Haefliger classes, MotivesAndAlgebraicCycles §7.6b), so ν = Σ Γ\_k works.
3. PI.3/equivariant-pushforward-image in degree 2 gives γ.

**Acceptance.** If \[d]₁ = 0 on all of S(ℝ), one may take ν = 0.

**Direct prerequisites:** [Hypotheses on a double cover killing a period-two class](#pi-4-brauer-cover-hypotheses); [Image of the equivariant pushforward](#pi-3-equivariant-pushforward-image); MotivesAndAlgebraicCycles §7.6b.

**Source:** B19, Proposition 4.5 proof, p. 85, application of Assumption 4.1 (ii) and Proposition 3.3: After making the first component vanish on Ψ, subtract the allowed curve classes before applying Proposition 3.3 (RealSurfacePeriodIndex/E5).

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/BrauerCover`, namespace `TauCeti.RealSurface`.

<a id="pi-4-uniform-pushforward-adjustment"></a>

### Integral pushforward adjustment for uniform evaluation

`PI.4/uniform-pushforward-adjustment` · theorem

Under the hypotheses of PI.4/uniform-obstruction-vanishing, for every β ∈ H²\_G(T(ℂ), ℤ(1)) lifting α\_{ℝ(T)} there are γ ∈ H²\_G(T(ℂ), ℤ(1)) and θ ∈ Pic(S) with p\_\*(β − 2γ) = cl(θ) in H²\_G(S(ℂ), ℤ(1)).

**Hypotheses and conventions.** The uniform-evaluation hypothesis; no integral lift of α̃ on U is used.

**Proof.**

1. PI.4/primitive-picard-trace-correction gives δ|\_V = η + p\_\*γ₀ + cl(μ|\_V) with p\_\*β = 2δ + cl(θ₁).
2. Real components on Ψ ∩ V(ℝ): \[p\_\*γ₀]₁ = p\_\*\[γ₀]₁ vanishes on Ψ because Ψ has no real preimage (Assumption 4.1 (i)); \[η]₁ on Ψ is t·cl\_R(φ), with φ ∈ Pic(S) the extension of υ(e) of PI.4/uniform-first-component, by the same component computation; so δ′ = δ − cl(μ) − t·cl(φ) has \[δ′]₁ = 0 on Ψ ∩ V(ℝ), hence on Ψ by PI.1/point-removal-extension.
3. PI.4/curve-adjustment gives ν and γ with δ′ − cl(ν) = p\_\*γ.
4. Then p\_\*(β − 2γ) = 2δ + cl(θ₁) − 2(δ − cl(μ) − t cl(φ) − cl(ν)) = cl(θ) with θ = θ₁ + 2μ + 2tφ + 2ν.

**Acceptance.** For t = 0 the φ-correction is absent.

**Direct prerequisites:** [Primitive Picard correction of the trace comparison](#pi-4-primitive-picard-trace-correction); [The boundary component under constant real evaluation](#pi-4-uniform-first-component); [Curve adjustment before the pushforward criterion](#pi-4-curve-adjustment); [Removing finitely many points and extending line bundles](#pi-1-point-removal-extension); [Vanishing of the topological obstruction for uniform evaluation](#pi-4-uniform-obstruction-vanishing).

**Source:** B19, Proposition 4.5, pp. 84–85: Existence of γ and θ with p\_\*(β − 2γ) = cl(θ) under the hypotheses of Proposition 4.4; the typed argument replaces the mod-2 summand (RealSurfacePeriodIndex/E4–E5).

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/BrauerCover`, namespace `TauCeti.RealSurface`.

## Layer PI.5: Noether–Lefschetz loci for double covers

Assumption 5.1 and the real-pointless curve C; the point s = a₁s₀ + a₂c of B and the lift of C to T; restriction of the anti-invariant summand to C; Assumption 5.2; h¹(C, N\_{C/X}) ≤ h²(O\_S) and H²(T, O\_T(C)) = 0; the Kodaira–Spencer contraction through normal bundles; dim coker φ\_λ ≤ h²(O\_S); blowing up points to realise Assumption 5.2.

*Builds on:* RealSurfacePeriodIndex PI.3; AlgebraicModuliForArithmeticGeometry §1.4; SchemeAndStackFoundations §2.2; SchemeAndStackFoundations §2.20; SchemeAndStackFoundations §2.6; SchemeAndStackFoundations §4.13; SchemeAndStackFoundations §5.10; Tau Ceti roadmap `TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

<a id="pi-5-curve-bearing-parameters"></a>

### Parameters for a curve on the double cover

`PI.5/curve-bearing-parameters` · construction

Let S be a connected smooth projective surface over ℝ, R ⊂ S an SNC divisor with equation r, A very ample and N a line bundle. For an even integer l ≫ 0 put L = A^l ⊗ N(−R); Assumption 5.1 asks H¹(S, A^l) = H¹(S, L) = H¹(S, L ⊗ N) = 0 and L, L ⊗ N very ample. For a basis (u\_i) of H⁰(S, A^{l/2}), Σ u\_i² has no real zeros; a general small deformation c ∈ H⁰(S, A^l) of Σ u\_i² cuts out a smooth curve C = {c = 0} transverse to R in its smooth locus, with C(ℝ) = ∅ and c > 0 on S(ℝ).

**Hypotheses and conventions.** l even and large enough for Serre vanishing and very ampleness simultaneously (AlgebraicModuliForArithmeticGeometry §1.4, `amplePowersAndFixedTwists`; SchemeAndStackFoundations §2.6, `ample_serre_vanishing`).

**Construction.**

1. Serre vanishing and very ampleness of high twists give Assumption 5.1 for all large even l.
2. The u\_i have no common zero because A is very ample, so Σ u\_i² is positive on S(ℝ) and has no real zeros.
3. Bertini gives a smooth transverse member among small deformations; having no real zeros and being positive on the compact S(ℝ) are open conditions.

**Uses.** Benoist 2019, Lemma 5.3 and Proposition 5.4, pp. 87–89: the cohomology vanishings used for the normal-bundle bound. PI.5/curve-lift: the curve C and the section c. PI.6/degree-two-splitting-uniform: the parameter choices in Proposition 6.6.

**API.**

- `RealSurface.CurveParameters` (structure): (A, N, l, L, c, C) with Assumption 5.1.
- `RealSurface.CurveParameters.vanishing` (projection): H¹(A^l) = H¹(L) = H¹(L ⊗ N) = 0.
- `RealSurface.CurveParameters.veryAmple` (projection): L and L ⊗ N are very ample.
- `RealSurface.CurveParameters.curve_no_real_points` (projection): C(ℝ) = ∅ and c > 0 on S(ℝ).
- `RealSurface.CurveParameters.curve_transverse` (projection): C is smooth and meets R transversally in its smooth locus.

**Unit tests.**

- `RealSurface.CurveParameters.conic_example` (computation): On ℙ²\_ℝ with A = O(1), l = 2, N = O and R a real line: L = O(2) ⊗ O(−1) = O(1) and L ⊗ N = O(1) are very ample, H¹(O(2)) = H¹(O(1)) = 0, and c = x² + y² + z² cuts out a smooth real-pointless conic meeting R in two conjugate points. With N = O(−1) instead, L = O is not very ample and Assumption 5.1 fails.
- `RealSurface.CurveParameters.no_real_surface` (degenerate): If S(ℝ) = ∅, positivity on S(ℝ) is vacuous and any smooth transverse c works.
- `RealSurface.CurveParameters.odd_l_excluded` (non-example): For odd l, A^{l/2} is undefined and the sum-of-squares section is not available: l must be even.
- `RealSurface.CurveParameters.vanishing_serre` (compatibility): The vanishing for large l is SchemeAndStackFoundations §2.6, `ample_serre_vanishing`, applied to A^l, L and L ⊗ N.

**Acceptance.** For S = ℙ²\_ℝ, A = O(1), l = 2, N = O and R a line: Assumption 5.1 holds and Σ u\_i² = x² + y² + z² defines a real-pointless conic.

**Direct prerequisites:** AlgebraicModuliForArithmeticGeometry §1.4 (`amplePowersAndFixedTwists`); SchemeAndStackFoundations §2.6 (`ample_serre_vanishing`); [The incidence model and its resolution](#pi-3-incidence-double-cover).

**Source:** B19, §5.1, Assumption 5.1, pp. 85–86: The choice L = A^l ⊗ N(−R) with the vanishing and very-ampleness conditions, and the curve C as a small deformation of a sum of squares, smooth, transverse to R and without real points.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/NoetherLefschetz`, namespace `TauCeti.RealSurface`.

<a id="pi-5-curve-lift"></a>

### The point of B whose cover contains the curve

`PI.5/curve-lift` · construction

In PI.5/curve-bearing-parameters choose a general g ∈ H⁰(C, L) (reduced zeros, disjoint from R) and lift rg² ∈ H⁰(C, L²(R)) to s₀ ∈ H⁰(S, L²(R)) (possible as H¹(S, L ⊗ N) = 0). For a₁ ∈ ℝ\_{>0} and a₂ ∈ H⁰(S, L ⊗ N) general, s = a₁s₀ + a₂c lies in B: its zero locus D is smooth and transverse to R in its smooth locus (Bertini off the finite base locus {c = s₀ = 0}, and a direct derivative computation there). Over C the incidence equation is rv² = a₁rg²w², and the strict transform of C splits into two copies of C, v = ±√a₁·g·w; the chosen copy C ⊂ T (v = √a₁ g w) avoids the singular points, w does not vanish on it, and w gives L|\_C ≅ O\_X(1)|\_C. The full preimage of C also contains the ℙ¹ fibres over R ∩ C, which are not part of the lifted curve.

**Hypotheses and conventions.** a₁ > 0 real; (a₁, a₂) general; g general.

**Construction.**

1. The restriction H⁰(S, L²(R)) → H⁰(C, L²(R)|\_C) is onto because its kernel twist L²(R)(−C) = L ⊗ N has H¹ = 0.
2. The linear system {a₁s₀ + a₂c} has base locus {c = s₀ = 0}, finite since L ⊗ N is very ample; Bertini applies off it, and at a base point the choice a₁ = 0, a₂(x) ≠ 0 already gives smoothness and transversality, an open condition (SchemeAndStackFoundations §4.13).
3. On C, s = a₁rg², so the equation factors as r(v − √a₁ g w)(v + √a₁ g w) = 0 after removing the R-component; the two graph sections are closed curves isomorphic to C.
4. v and w do not vanish together on X̄, and on the chosen section v = √a₁ g w, so w ≠ 0 there.

**Uses.** Benoist 2019, §5.2, pp. 86–89: λ = class of C in H¹(T, Ω¹\_T) and the normal sequences. PI.5/nl-codimension-bound: the curve C ⊂ T ⊂ X. PI.6/degree-two-splitting-uniform: the real point s ∈ B(ℝ) near which the cover is deformed.

**API.**

- `RealSurface.liftedCurve` (data): The closed curve C ⊂ T given by v = √a₁ g w.
- `RealSurface.liftedCurve_iso` (constructor): p restricts to an isomorphism from the lifted curve to C.
- `RealSurface.liftedCurve_trivialization` (equivalence): w induces L|\_C ≅ O\_X(1)|\_C (display (5.1)).
- `RealSurface.liftedCurve_mem_B` (other): s = a₁s₀ + a₂c lies in B for general (a₁, a₂) with a₁ > 0.
- `RealSurface.liftedCurve_disjoint_sing` (other): The lifted curve avoids Sing T̄ and the exceptional curves of T → T̄.

**Unit tests.**

- `RealSurface.liftedCurve_two_components` (computation): The strict transform of C has exactly two components, v = ±√a₁ g w, meeting over {g = 0}.
- `RealSurface.liftedCurve_a2_zero` (degenerate): For a₂ = 0, s = a₁s₀ restricts to a₁rg² on C, but D may fail to be smooth away from C; generality of a₂ is needed.
- `RealSurface.liftedCurve_not_full_preimage` (non-example): p⁻¹(C) is not the lifted curve: it also contains the other component and the ℙ¹ fibres over R ∩ C.
- `RealSurface.liftedCurve_trivialization_compat` (compatibility): Under the identification of PI.3/incidence-double-cover, w is the tautological section and the trivialisation is its restriction.

**Acceptance.** The two lifted curves meet exactly over the zeros of g. The lifted curve does not meet the exceptional curves over Sing R.

**Direct prerequisites:** [Parameters for a curve on the double cover](#pi-5-curve-bearing-parameters); [The incidence model and its resolution](#pi-3-incidence-double-cover); SchemeAndStackFoundations §4.13.

**Source:** B19, §5.1, pp. 86–87: Construction of s₀, of the linear system a₁s₀ + a₂c, the general member in B, and the component v = √a₁ g w of the strict transform of C, with the isomorphism (5.1).

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/NoetherLefschetz`, namespace `TauCeti.RealSurface`.

<a id="pi-5-trace-zero-restriction"></a>

### Restriction of the anti-invariant summand to the curve

`PI.5/trace-zero-restriction` · theorem

For the lifted curve C ⊂ T of PI.5/curve-lift, the restriction p\_\*O\_T = O\_S ⊕ L⁻¹(−R) → O\_C is (a, b) ↦ a + √a₁·r·g·b when the anti-invariant summand is generated by z = r v/w, and (a, b) ↦ a + r g b after rescaling the generator by √a₁; p\_\*O\_T(−C) is its kernel. The same holds on T̄; left exactness of pushforward suffices, without finiteness of p.

**Hypotheses and conventions.** The splitting of p\_\*O\_T is PI.3/incidence-local-resolution.

**Proof.**

1. On the chosen component v = √a₁ g w, the anti-invariant function z = r v/w restricts to √a₁ r g.
2. Pushing forward 0 → O\_T(−C) → O\_T → O\_C → 0 gives a left exact sequence 0 → p\_\*O\_T(−C) → p\_\*O\_T → O\_C.

**Acceptance.** With the rescaled generator z′ = r v/(√a₁ w), the coefficient is rg, as printed in (5.5).

**Direct prerequisites:** [The point of B whose cover contains the curve](#pi-5-curve-lift); [Local structure and Stein factorisation of the incidence model](#pi-3-incidence-local-resolution).

**Source:** B19, (5.5), p. 87: The exact sequence 0 → p\_\*O\_T(−C) → O\_S ⊕ L⁻¹(−R) → O\_C with the map (1, rg), the splitting induced by the involution.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/NoetherLefschetz`, namespace `TauCeti.RealSurface`.

<a id="pi-5-auxiliary-hypotheses"></a>

### The auxiliary cohomological hypotheses on N

`PI.5/auxiliary-hypotheses` · definition

For S, R as in PI.5/curve-bearing-parameters, a line bundle N satisfies Assumption 5.2 if there is η ∈ H¹(S, N) such that ∪η : H⁰(S, K\_S) → H¹(S, N ⊗ K\_S) is injective (then a general η works), and H⁰(S, N ⊗ K\_S) = 0, H⁰(S, N⁻¹ ⊗ K\_S(R)) = 0 and H¹(R, N|\_R) = 0.

**Hypotheses and conventions.** Coherent cohomology of S and of the curve R; injectivity for one η implies it for general η (an open condition on H¹(S, N)).

**Construction.**

1. The four conditions are conditions on coherent cohomology; PI.5/blowup-auxiliary-bundle constructs N after blowing up points off R.

**Uses.** Benoist 2019, Lemma 5.3 and Proposition 5.4, pp. 87–88: the vanishings feeding the normal-bundle bound and H²(T, O\_T(C)) = 0. PI.5/blowup-auxiliary-bundle: Proposition 5.5 realises the hypotheses after blowing up. PI.6/degree-two-splitting-uniform: the choice of N in Proposition 6.6.

**API.**

- `RealSurface.AuxiliaryHypotheses` (structure): N with η and the four conditions of Assumption 5.2.
- `RealSurface.AuxiliaryHypotheses.cup_injective` (projection): ∪η is injective on H⁰(S, K\_S).
- `RealSurface.AuxiliaryHypotheses.vanishing` (projection): H⁰(N ⊗ K\_S) = H⁰(N⁻¹ ⊗ K\_S(R)) = H¹(R, N|\_R) = 0.
- `RealSurface.AuxiliaryHypotheses.generic` (other): If ∪η is injective for one η, it is injective for η in a dense open of H¹(S, N).

**Unit tests.**

- `RealSurface.AuxiliaryHypotheses.rational_surface` (degenerate): If H⁰(S, K\_S) = 0 the cup condition holds for η = 0.
- `RealSurface.AuxiliaryHypotheses.projectivePlane` (computation): On ℙ²\_ℝ with R a line and N = O(−1): H⁰(O(−4)) = 0, H⁰(O(1)⊗O(−3)⊗O(1)) = H⁰(O(−1)) = 0, H¹(ℙ¹, O(−1)) = 0.
- `RealSurface.AuxiliaryHypotheses.trivial_fails` (non-example): N = O\_S fails H⁰(N ⊗ K\_S) = 0 whenever p\_g(S) > 0.
- `RealSurface.AuxiliaryHypotheses.serre_dual` (compatibility): H⁰(N⁻¹ ⊗ K\_S(R)) = 0 iff H²(S, N(−R)) = 0, by Serre duality (SchemeAndStackFoundations §2.20).

**Acceptance.** If h⁰(K\_S) = 0 the injectivity condition is empty. On ℙ²\_ℝ with R a line, N = O(−1) satisfies H⁰(N ⊗ K) = 0.

**Direct prerequisites:** SchemeAndStackFoundations §2.6; SchemeAndStackFoundations §2.20.

**Source:** B19, Assumption 5.2, p. 87: Injectivity of the cup product with some η ∈ H¹(S, N) on H⁰(S, K\_S) and vanishing of H⁰(S, N ⊗ K\_S), H⁰(S, N⁻¹ ⊗ K\_S(R)) and H¹(R, N|\_R).

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/NoetherLefschetz`, namespace `TauCeti.RealSurface`.

<a id="pi-5-normal-bundle-bound"></a>

### Normal-bundle cohomology bound

`PI.5/normal-bundle-bound` · theorem

Under Assumptions 5.1 and 5.2, h¹(C, N\_{C/X}) ≤ h²(S, O\_S) for the lifted curve C ⊂ T ⊂ X.

**Hypotheses and conventions.** Assumptions 5.1 and 5.2; X the blown-up threefold, an isomorphism near C.

**Proof.**

1. 0 → T\_{X/S}|\_C → N\_{C/X} → N\_{C/S} → 0 with T\_{X/S} ≅ O\_X(2) ⊗ L⁻¹, so T\_{X/S}|\_C ≅ L|\_C by (5.1), and N\_{C/S} ≅ A^l|\_C.
2. H¹(C, L|\_C) = 0 from H¹(S, L) = 0 and H²(S, N(−R)) = 0, the latter Serre dual to H⁰(N⁻¹ ⊗ K\_S(R)) = 0.
3. H¹(S, A^l) = 0 gives h¹(C, A^l|\_C) ≤ h²(S, O\_S) from 0 → O\_S → A^l → A^l|\_C → 0; the long exact sequence concludes.

**Acceptance.** For a rational surface S, h²(O\_S) = 0 and the bound gives H¹(C, N\_{C/X}) = 0.

**Direct prerequisites:** [The point of B whose cover contains the curve](#pi-5-curve-lift); [The auxiliary cohomological hypotheses on N](#pi-5-auxiliary-hypotheses); [Parameters for a curve on the double cover](#pi-5-curve-bearing-parameters); SchemeAndStackFoundations §2.20; SchemeAndStackFoundations §5.10.

**Source:** B19, Lemma 5.3, first statement, pp. 87–88: h¹(C, N\_{C/X}) ≤ h²(S, O\_S) from (5.3)–(5.4), using T\_{X/S}|\_C ≅ L|\_C and the vanishings.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/NoetherLefschetz`, namespace `TauCeti.RealSurface`.

<a id="pi-5-twisted-curve-vanishing"></a>

### Vanishing of H² after twisting by the curve

`PI.5/twisted-curve-vanishing` · theorem

Under Assumptions 5.1 and 5.2, H²(T, O\_T(C)) = 0.

**Hypotheses and conventions.** As in PI.5/normal-bundle-bound; the rational double points of T̄ avoid C.

**Proof.**

1. The resolution T → T̄ has rational singularities away from C, so H²(T, O\_T(C)) ≅ H²(T̄, O\_{T̄}(C)) (Leray; PI.3/incidence-local-resolution).
2. T̄ is a Cartier divisor in X̄, hence Gorenstein with ω\_{T̄} ≅ p̄\*(K\_S ⊗ L(R)); by Serre duality it suffices that H⁰(T̄, ω(−C)) = 0.
3. Push forward by p̄ using PI.5/trace-zero-restriction: H⁰(ω(−C)) is the kernel of H⁰(K\_S ⊗ L(R)) ⊕ H⁰(K\_S) → H⁰(C, K\_S ⊗ L(R)), (x, y) ↦ x + rg·y.
4. Using H⁰(N ⊗ K\_S) = 0, injectivity reduces to injectivity of H⁰(K\_S) → H¹(S, N ⊗ K\_S), cup with ∂(rg) = r ∪ ∂g; ψ : H⁰(C, L) → H¹(S, N(−R)) → H¹(S, N) is onto by H¹(S, L) = H¹(R, N|\_R) = 0, so for general g, ψ(g) is general and Assumption 5.2 gives injectivity (connecting maps commute with cup products).

**Acceptance.** If H⁰(S, K\_S) = 0 the last step is empty.

**Direct prerequisites:** [Restriction of the anti-invariant summand to the curve](#pi-5-trace-zero-restriction); [The auxiliary cohomological hypotheses on N](#pi-5-auxiliary-hypotheses); [Parameters for a curve on the double cover](#pi-5-curve-bearing-parameters); [Local structure and Stein factorisation of the incidence model](#pi-3-incidence-local-resolution); SchemeAndStackFoundations §2.2; SchemeAndStackFoundations §2.20.

**Source:** B19, Lemma 5.3, second statement, pp. 87–88: H²(T, O\_T(C)) = 0 via rational singularities, Serre duality on the Gorenstein T̄, the pushforward (5.5) and the cup-product injectivity (5.6) with Bredon II.7.1(c).

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/NoetherLefschetz`, namespace `TauCeti.RealSurface`.

<a id="pi-5-kodaira-spencer-normal-factorisation"></a>

### Kodaira–Spencer contraction through normal bundles

`PI.5/kodaira-spencer-normal-factorisation` · theorem

Let C ⊂ T ⊂ X be smooth projective complex varieties of dimensions 1, 2 and 3, λ ∈ H¹(T, Ω¹\_T) the class of C, and B ⊂ |O\_X(T)| an open set of smooth members containing T, with universal family 𝒯 → B. Then the composite φ\_λ : T\_{B,T} → H¹(T, T\_T) → H²(T, O\_T) of the Kodaira–Spencer map and contraction with λ equals the composite T\_{B,T} → H⁰(T, N\_{T/X}) → H⁰(C, N\_{T/X}|\_C) → H¹(C, N\_{C/T}) → H²(T, O\_T) of the classifying map of embedded deformations, restriction to C, the boundary of 0 → N\_{C/T} → N\_{C/X} → N\_{T/X}|\_C → 0 and the boundary of 0 → O\_T → O\_T(C) → O\_T(C)|\_C ≅ N\_{C/T} → 0.

**Hypotheses and conventions.** C, T, X smooth projective over ℂ; T moves in an open subset of its linear system. The third map lands in H¹(C, N\_{C/T}) (E12).

**Proof.**

1. The Kodaira–Spencer map of the family of hypersurfaces is T\_{B,T} → H⁰(T, N\_{T/X}) followed by the boundary of 0 → T\_T → T\_X|\_T → N\_{T/X} → 0 (Sernesi Proposition 3.2.9 (i)).
2. The boundary maps of short exact sequences of locally free sheaves are cup products with their extension classes, and the commutative diagram comparing 0 → T\_T → T\_X|\_T → N\_{T/X} → 0 with 0 → N\_{C/T} → N\_{C/X} → N\_{T/X}|\_C → 0 identifies the contraction with λ with the displayed composite (BEN18 Proposition 2.1).

**Acceptance.** If C = ∅ (λ = 0) both composites vanish. For a general smooth quartic T ⊂ ℙ³ containing a line C, the composite T\_{B,T} → H²(T, O\_T) ≅ ℂ is onto: quartics containing a line form a Noether–Lefschetz component of the expected codimension one.

**Source:** BEN18, Proposition 2.1 and proof, pp. 6–7: The contraction ψ\_λ of the normal-sequence boundary with the class of a curve equals restriction followed by the two boundary maps. B19, Proof of Proposition 5.4, p. 88: The factorisation (5.7) of φ\_λ, citing Sernesi and Benoist 2018. SER06, Proposition 3.2.9 (i): The Kodaira–Spencer map of a family of subvarieties factors through the normal sheaf (cited at Benoist's locator; not read).

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/NoetherLefschetz`, namespace `TauCeti.RealSurface`.

<a id="pi-5-nl-codimension-bound"></a>

### Noether–Lefschetz locus of the expected dimension

`PI.5/nl-codimension-bound` · theorem

Under Assumptions 5.1 and 5.2, let λ ∈ H¹(T, Ω¹\_T) be the class of the lifted curve C and φ\_λ : T\_{B,s} → H²(T, O\_T) the Kodaira–Spencer contraction of the family 𝒯 → B at s. Then dim coker φ\_λ ≤ h²(S, O\_S).

**Hypotheses and conventions.** The boundary of the normal sequence lands in H¹(C, N\_{C/T}) (the published (5.7) prints H⁰; see RealSurfacePeriodIndex/E12).

**Proof.**

1. PI.5/kodaira-spencer-normal-factorisation writes φ\_λ as T\_{B,s} → H⁰(T, N\_{T/X}) → H⁰(C, N\_{T/X}|\_C) → H¹(C, N\_{C/T}) → H²(T, O\_T).
2. The last map is onto because H²(T, O\_T(C)) = 0 (PI.5/twisted-curve-vanishing); the third has cokernel of dimension ≤ h¹(C, N\_{C/X}) ≤ h²(S, O\_S) (PI.5/normal-bundle-bound).
3. The first two maps compose to H⁰(S, L²(R)) → H⁰(C, L²(R)|\_C) followed by multiplication by w², an isomorphism by (5.1); the restriction is onto since H¹(S, L ⊗ N) = 0.

**Acceptance.** For S rational, φ\_λ is surjective.

**Direct prerequisites:** [Normal-bundle cohomology bound](#pi-5-normal-bundle-bound); [Vanishing of H² after twisting by the curve](#pi-5-twisted-curve-vanishing); [The point of B whose cover contains the curve](#pi-5-curve-lift); [Kodaira–Spencer contraction through normal bundles](#pi-5-kodaira-spencer-normal-factorisation).

**Source:** B19, Proposition 5.4, pp. 88–89: The cokernel of φ\_λ has dimension at most h²(S, O\_S), by Sernesi's description of Kodaira–Spencer, Benoist 2018 Proposition 2.1 and Lemma 5.3.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/NoetherLefschetz`, namespace `TauCeti.RealSurface`.

<a id="pi-5-blowup-auxiliary-bundle"></a>

### Blowing up points to realise the auxiliary hypotheses

`PI.5/blowup-auxiliary-bundle` · construction

Let S be a connected smooth projective surface over ℝ, R an SNC divisor and A₀ an ample line bundle with H¹(R, A₀|\_R) = 0 (a sufficiently positive twist of any ample bundle works). Let μ : S′ → S be the blow-up of two disjoint finite sets P, Q of sufficiently many general closed points off R, with exceptional divisors E = μ⁻¹P, F = μ⁻¹Q, and N = μ\*A₀(2F − 2E). Then there is η ∈ H¹(S′, N) with (i) H⁰(S′, N ⊗ K\_{S′}) = 0, (ii) H⁰(S′, N⁻¹ ⊗ K\_{S′}(R′)) = 0, (iii) H¹(R′, N|\_{R′}) = 0, (iv) ∪η : H⁰(S′, K\_{S′}) → H¹(S′, N ⊗ K\_{S′}) injective, where R′ = μ⁻¹R ≅ R. The same holds after further blow-ups at general points off R. A₀ is unrelated to the very ample A of Proposition 6.6.

**Hypotheses and conventions.** P, Q general and large; A₀ ample with H¹(R, A₀|\_R) = 0.

**Construction.**

1. A₀ exists: a sufficiently high power of an ample bundle has H¹(R, A₀|\_R) = 0 by Serre vanishing on the curve R (SchemeAndStackFoundations §2.6, `ample_serre_vanishing`).
2. (iii): N|\_{R′} ≅ A₀|\_R because the blow-ups avoid R.
3. (i): H⁰(S′, N ⊗ K\_{S′}) = H⁰(S, A₀ ⊗ K\_S ⊗ I\_P) vanishes for P large and general; (ii) likewise with Q.
4. (iv): through the injective Leray edge maps, reduce to ν ∈ H¹(S, A₀ ⊗ I\_P) with ∪ν injective on H⁰(K\_S); take ν = ∂ξ for ξ ∈ H⁰(P, A₀|\_P) vanishing on P₂ but at no point of P₁, where P = P₁ ⊔ P₂ is split so that no nonzero section of K\_S vanishes on P₁ and none of A₀ ⊗ K\_S vanishes on P₂; lift ν to H¹(S, A₀ ⊗ I\_P²) and map it to H¹(S′, N).

**Uses.** Benoist 2019, Proposition 6.6 proof, p. 93: S may be assumed to carry N satisfying Assumption 5.2, stable under further blow-ups. PI.6/degree-two-splitting-uniform: the birational model of S.

**API.**

- `RealSurface.blowupAuxiliary` (constructor): (S′, μ, N, η) from (S, R, A₀) and general P, Q.
- `RealSurface.blowupAuxiliary_hypotheses` (characterisation): N satisfies Assumption 5.2 on S′ with R′ = μ⁻¹R.
- `RealSurface.blowupAuxiliary_restrict` (simp): N|\_{R′} ≅ A₀|\_R.
- `RealSurface.blowupAuxiliary_further` (other): The conclusion persists after blowing up further general points off R.

**Unit tests.**

- `RealSurface.blowupAuxiliary_projectivePlane` (computation): On ℙ²\_ℝ with R a line and A₀ = O(1), (iii) is H¹(ℙ¹, O(1)) = 0 and (iv) is empty.
- `RealSurface.blowupAuxiliary_no_points` (degenerate): With P = Q = ∅, N = A₀ and (i) fails as soon as H⁰(A₀ ⊗ K\_S) ≠ 0.
- `RealSurface.blowupAuxiliary_A0_not_A` (non-example): A₀ need not be very ample and is not the bundle A of PI.5/curve-bearing-parameters; conflating them changes the vanishing conditions.
- `RealSurface.blowupAuxiliary_leray` (compatibility): H¹(S, A₀ ⊗ I\_P) → H¹(S′, μ\*A₀(−E)) is the injective Leray edge map of μ.

**Acceptance.** For S = ℙ²\_ℝ and R a line, H⁰(K\_S) = 0, so (iv) is empty and only (i)–(iii) need blow-ups.

**Direct prerequisites:** [The auxiliary cohomological hypotheses on N](#pi-5-auxiliary-hypotheses); SchemeAndStackFoundations §2.2; SchemeAndStackFoundations §2.6 (`ample_serre_vanishing`); Tau Ceti roadmap `TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source:** B19, Proposition 5.5 and proof, pp. 89–90: After blowing up sufficiently many general points P ∪ Q off R, N = μ\*A(2F − 2E) satisfies (i)–(iv), the cup-injectivity through (5.11)–(5.12).

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/NoetherLefschetz`, namespace `TauCeti.RealSurface`.

## Layer PI.6: Real-locus control and the degree-two splitting

Positivity in squared lines; Assumption 6.1 on the real branch locus, its stability and its realisation after blow-ups; Nash approximation (BCR 12.4.11) and Bröcker's real divisors; the signed branch section t with real divisor H − R corrected; Assumption 6.1 implies Assumption 4.1; Green's infinitesimal criterion over ℝ; the vanishing variation and surjectivity of the Gauss–Manin derivative; the stratification of the family of pairs (T, p⁻¹R), normalisation and transport of the Kummer lift; Proposition 6.6 in the uniform-evaluation form.

*Builds on:* RealSurfacePeriodIndex PI.1; RealSurfacePeriodIndex PI.2; RealSurfacePeriodIndex PI.3; RealSurfacePeriodIndex PI.4; RealSurfacePeriodIndex PI.5; AlgebraicModuliForArithmeticGeometry §1.4; AlgebraicTopologyPartII AT2.12/surface-loop-representatives (gap:at2-surface-loop-representatives); AlgebraicTopologyPartII AT2.16/equivariant-ehresmann (gap:at2-equivariant-ehresmann); AlgebraicTopologyPartII AT2.16/finite-index-lattice (gap:at2-finite-index-lattice); AlgebraicTopologyPartII AT2.16/stratified-pair-transport (gap:at2-stratified-pair-transport); MotivesAndAlgebraicCycles §7.6b; MotivesAndAlgebraicCycles §7.8; ResolutionOfSingularitiesCharacteristicZero §5.1; ShimuraData §3.1; Tau Ceti roadmap `TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; Tau Ceti roadmap `TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

<a id="pi-6-squared-line-positivity"></a>

### Positivity in a squared real line

`PI.6/squared-line-positivity` · definition

For a one-dimensional real vector space M, the positive elements of M^{⊗2} are those of the form m ⊗ m with m ≠ 0; the notion depends on the presentation as a tensor square. For a real variety X and a line bundle M on X, a section of M^{⊗2} is positive (negative) at x ∈ X(ℝ) if its value is positive (negative) in M\_x^{⊗2}.

**Hypotheses and conventions.** Real points only; the tensor-square presentation is fixed.

**Construction.**

1. m ⊗ m and (−m) ⊗ (−m) agree, and the squares form one of the two half-lines of M^{⊗2}.

**Uses.** Benoist 2019, Lemmas 6.4–6.5, p. 92: the sign of rt and rs on S(ℝ) ∖ Ξ. PI.6/signed-branch-section: negativity of rt off Ξ. PI.6/topology-to-cover-hypotheses: the real points of T lie over the locus where rs ≥ 0.

**API.**

- `RealSurface.IsPositiveAt` (data): Positivity of a section of M^{⊗2} at a real point.
- `RealSurface.isPositiveAt_sq` (constructor): m ⊗ m is positive for m ≠ 0.
- `RealSurface.isPositiveAt_mul` (relation): Products of positive sections of squared bundles are positive.
- `RealSurface.isPositiveAt_or_neg` (characterisation): A nonzero value is either positive or negative, not both.

**Unit tests.**

- `RealSurface.isPositiveAt_trivial` (computation): For the trivial line bundle, positivity is positivity of the real function.
- `RealSurface.isPositiveAt_zero` (degenerate): The zero section is neither positive nor negative.
- `RealSurface.isPositiveAt_presentation` (non-example): Rescaling the identification M^{⊗2} ≅ ℝ by −1 exchanges positive and negative: the notion is not intrinsic to the line M^{⊗2}.
- `RealSurface.isPositiveAt_sumSquares` (compatibility): Σ u\_i² for sections u\_i of M without common real zero is positive on X(ℝ).

**Acceptance.** For M = ℝ, the positive elements of ℝ ⊗ ℝ ≅ ℝ are the positive reals.

**Direct prerequisites:** `TensorProduct` (Mathlib).

**Source:** B19, §6, p. 90: Positive elements of M^{⊗2} for a real line M, and positivity of sections of squared line bundles at real points.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/RealLocus`, namespace `TauCeti.RealSurface`.

<a id="pi-6-branch-locus-conditions"></a>

### Topological conditions on the real branch locus

`PI.6/branch-locus-conditions` · definition

Let S be a connected smooth projective surface over ℝ, R an SNC divisor and Ξ ⊂ S(ℝ) a union of connected components with R(ℝ) ⊂ Ξ. Assumption 6.1 asks for a compact one-manifold 𝒮 and a C^∞ embedding ι : 𝒮 → Ξ meeting R(ℝ) transversally in its smooth locus with: (i) every component of Ξ meets ι(𝒮); (ii) ι\_\*\[𝒮] = cl\_R(R) in H¹(Ξ, 𝔽₂); (iii) H¹(Ξ, 𝔽₂) is generated by the classes of the components of ι(𝒮) and the Borel–Haefliger classes of curves with real locus in Ξ; (iv) for each component Σ of Ξ, with Σ₀ = Σ ∩ (ι(𝒮) ∪ R(ℝ)) and a decomposition Σ ∖ Σ₀ = Σ₊ ⊔ Σ₋ into open and closed parts, if every point of Σ₀ is in the closures of both Σ₊ and Σ₋ then Σ₊ ∪ Σ₀ is connected.

**Hypotheses and conventions.** Homology classes via Poincaré duality on the compact surface Ξ; cl\_R from MotivesAndAlgebraicCycles §7.6b.

**Construction.**

1. The conditions are topological; PI.6/branch-conditions-blowup realises them on a blow-up and PI.6/topology-to-cover-hypotheses uses them.

**Uses.** Benoist 2019, Lemmas 6.2–6.5, pp. 91–92: the real branch curve D(ℝ) = ι(𝒮) controlling T(ℝ). PI.6/topology-to-cover-hypotheses: conditions (i)–(iv) give Assumption 4.1. PI.6/signed-branch-section: approximation of ι by the real locus of an algebraic curve.

**API.**

- `RealSurface.BranchLocusConditions` (structure): (𝒮, ι) with transversality and (i)–(iv).
- `RealSurface.BranchLocusConditions.meets_components` (projection): (i).
- `RealSurface.BranchLocusConditions.homology_class` (projection): (ii) ι\_\*\[𝒮] = cl\_R(R).
- `RealSurface.BranchLocusConditions.generates` (projection): (iii).
- `RealSurface.BranchLocusConditions.connected_side` (projection): (iv).

**Unit tests.**

- `RealSurface.BranchLocusConditions.empty` (degenerate): Ξ = ∅ with 𝒮 = ∅ satisfies the conditions.
- `RealSurface.BranchLocusConditions.sphere` (computation): On Ξ = S² with R(ℝ) = ∅, one embedded circle satisfies (i)–(iv): H¹(S²) = 0, its class is 0 = cl\_R(R), and both sides are discs.
- `RealSurface.BranchLocusConditions.torus_fails` (non-example): On a torus Ξ with R(ℝ) = ∅, a single null-homotopic circle fails (iii) unless curve classes generate H¹(Ξ).
- `RealSurface.BranchLocusConditions.homology_compat` (compatibility): (ii) is equality of Poincaré duals of ι\_\*\[𝒮] and of the Borel–Haefliger class of R.

**Acceptance.** If Ξ = ∅ (so R(ℝ) = ∅), the empty embedding satisfies Assumption 6.1.

**Direct prerequisites:** MotivesAndAlgebraicCycles §7.6b; Tau Ceti roadmap `TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Source:** B19, Assumption 6.1, pp. 90–91: An embedded compact one-manifold in Ξ, transverse to R(ℝ), meeting every component, with class cl\_R(R), generating H¹(Ξ) with curve classes, and the connectivity condition (iv).

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/RealLocus`, namespace `TauCeti.RealSurface`.

<a id="pi-6-branch-conditions-stable"></a>

### Stability of the branch conditions

`PI.6/branch-conditions-stable` · theorem

If ι : 𝒮 → Ξ satisfies Assumption 6.1, so does every ι′ close enough to ι in C^∞(𝒮, Ξ) for the strong C^∞ topology.

**Hypotheses and conventions.** Strong C^∞ topology; 𝒮 compact.

**Proof.**

1. (i)–(iii) are preserved by small isotopies (homology classes are locally constant).
2. Transversality to R(ℝ) at smooth points and (iv) persist because (ι, id) : 𝒮 ⊔ R̃(ℝ) → Ξ, with R̃ the normalisation of R, is a normal-crossings immersion and these are stable (Golubitsky–Guillemin III.3.11).

**Acceptance.** Perturbing ι by a small normal isotopy keeps all four conditions.

**Direct prerequisites:** [Topological conditions on the real branch locus](#pi-6-branch-locus-conditions).

**Source:** B19, Lemma 6.2, p. 91: Stability of Assumption 6.1 under strong C^∞-small perturbations, using stability of normal-crossings immersions.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/RealLocus`, namespace `TauCeti.RealSurface`.

<a id="pi-6-branch-conditions-blowup"></a>

### Blow-ups producing the branch conditions

`PI.6/branch-conditions-blowup` · construction

For S, R, Ξ as in PI.6/branch-locus-conditions there is a blow-up μ : S′ → S at finitely many general real points such that (S′, Ξ′ = μ⁻¹(Ξ)) with R′ the strict transform of R admits an embedding satisfying Assumption 6.1. The exceptional curves contribute Borel–Haefliger classes generating the new part of H¹(Ξ′).

**Hypotheses and conventions.** The points are transverse self-intersection points of an immersed union of loops, general in Ξ and off R.

**Construction.**

1. Choose loops generating H¹(Ξ), add loops so that every component is met and the total class becomes cl\_R(R) (one further loop in the class of the difference), and by smooth approximation and transversality get an immersion ι : 𝒮 → Ξ transverse to R(ℝ), injective except at finitely many transverse double points, with ι\_\*\[𝒮] = cl\_R(R) and Σ ∩ (ι(𝒮) ∪ R(ℝ)) connected for each component Σ (AlgebraicTopologyPartII AT2.12/surface-loop-representatives).
2. Blow up the double points; ι lifts to an embedding into Ξ′; the cohomology of the blow-up gives (ii) and (iii), the exceptional real loci being curve classes.
3. (iv): each exceptional real circle meets ι′(𝒮) in two points separating it into arcs in Σ′₊ and Σ′₋, which forces the required connectedness.

**Uses.** Benoist 2019, Proposition 6.6 proof, p. 93: after this blow-up the embedding ι exists. PI.6/degree-two-splitting-uniform: the birational modification of S.

**API.**

- `RealSurface.branchConditionsBlowup` (constructor): μ : S′ → S and an embedding ι′ satisfying Assumption 6.1 on (S′, Ξ′).
- `RealSurface.branchConditionsBlowup_offR` (other): The centres lie off R, so R′ ≅ R.
- `RealSurface.branchConditionsBlowup_classes` (relation): H¹(Ξ′) = μ\*H¹(Ξ) ⊕ span of the exceptional real circles.
- `RealSurface.branchConditionsBlowup_compose` (functoriality): Further general blow-ups off R preserve the conclusion and PI.5/blowup-auxiliary-bundle.

**Unit tests.**

- `RealSurface.branchConditionsBlowup_sphere` (degenerate): For Ξ = S², R(ℝ) = ∅, μ = id works with one circle.
- `RealSurface.branchConditionsBlowup_torus` (computation): For Ξ a torus with R(ℝ) = ∅ (so cl\_R(R) = 0 on Ξ), take loops a, b, c with c in the class a + b, pairwise meeting transversally once: the total class a + b + (a + b) is 0. Blowing up the three double points gives Ξ′ = T² # 3ℝℙ², on which the strict transforms are disjoint circles of total class μ\*(a + b + c) + 2(e₁ + e₂ + e₃) = 0, and together with the exceptional circles e₁, e₂, e₃ they generate H¹(Ξ′, 𝔽₂) ≅ 𝔽₂⁵. Two loops a, b meeting once would not do: their class a + b ≠ 0 violates (ii), before and after the blow-up.
- `RealSurface.branchConditionsBlowup_not_immersion` (non-example): Without blowing up, an immersed family with a double point does not give an embedding, so Assumption 6.1 can fail on S itself.
- `RealSurface.branchConditionsBlowup_class` (compatibility): The real locus of an exceptional curve is a circle whose Borel–Haefliger class is its Poincaré dual in H¹(Ξ′).

**Acceptance.** If H¹(Ξ) = 0 and R(ℝ) = ∅ no blow-up is needed.

**Direct prerequisites:** [Topological conditions on the real branch locus](#pi-6-branch-locus-conditions); AlgebraicTopologyPartII AT2.12/surface-loop-representatives (gap:at2-surface-loop-representatives); Tau Ceti roadmap `TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`; MotivesAndAlgebraicCycles §7.6b.

**Source:** B19, Lemma 6.3 and proof, p. 91: Blowing up the self-intersection points of an immersed family of loops gives an embedding satisfying Assumption 6.1.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/RealLocus`, namespace `TauCeti.RealSurface`.

<a id="pi-6-nash-approximation-input"></a>

### Algebraic approximation of a hypersurface (cited input)

`PI.6/nash-approximation-input` · theorem

Let X be a compact nonsingular affine real algebraic variety of dimension d and Y ⊂ X a compact C^∞ hypersurface. If the homology class \[Y] ∈ H\_{d−1}(X, ℤ/2) is algebraic (lies in H^alg\_{d−1}), then there is a diffeotopy F of X, with F₁ arbitrarily close to the identity, such that F₁(Y) is a nonsingular algebraic hypersurface of X. For a smooth projective real surface and Y = ι(𝒮) with class cl\_R(R), this gives an algebraic curve H ⊂ S smooth along S(ℝ) with H(ℝ) = ι′(𝒮), ι′ close to ι.

**Hypotheses and conventions.** X compact nonsingular affine (a smooth projective real variety's real locus is affine in this sense); algebraic homology class.

**Proof.**

1. Cited: Bochnak–Coste–Roy, Theorem 12.4.11, via algebraic line bundles realising the class (BCR Theorem 12.4.6) and transversality.

**Acceptance.** On ℝℙ², every embedded circle is isotopic to the real locus of a smooth real algebraic curve.

**Direct prerequisites:** MotivesAndAlgebraicCycles §7.6b.

**Source:** BCR, Theorem 12.4.11, p. 318: For a compact nonsingular affine real algebraic variety, a compact C^∞ hypersurface with algebraic homology class has an algebraic approximation by a diffeotopy close to the identity. B19, Lemma 6.4 proof, p. 92: Use of BCR Theorem 12.4.11 to obtain ι′ and a hypersurface H smooth along S(ℝ) with H(ℝ) = ι′(𝒮).

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/RealLocus`, namespace `TauCeti.RealSurface`.

<a id="pi-6-brocker-sign-input"></a>

### Bröcker's real divisors and prescribed signs (cited input)

`PI.6/brocker-sign-input` · theorem

On a smooth projective real surface S: (b) if D is a divisor whose Borel–Haefliger class cl\_R(D) ∈ H¹(S(ℝ), 𝔽₂) vanishes, there is h ∈ ℝ(S)ˣ whose divisor agrees with D along S(ℝ) (it has the prescribed orders along the components of D meeting S(ℝ) and no other zeros or poles meeting S(ℝ)); (a) for any locally constant sign function on a union of components of S(ℝ) there is h ∈ ℝ(S)ˣ, invertible along S(ℝ), with those signs.

**Hypotheses and conventions.** Applied to D = H − R, the signed divisor (simple zero along H, simple pole along R).

**Proof.**

1. Cited: Bröcker 1980, Satz a), b).

**Acceptance.** On ℝℙ², a divisor of even degree has trivial Borel–Haefliger class and is the real divisor of a rational function.

**Direct prerequisites:** MotivesAndAlgebraicCycles §7.6b; [Algebraic approximation of a hypersurface (cited input)](#pi-6-nash-approximation-input).

**Source:** BRO80, Satz a), b) (not read; cited at Benoist's locator): Real divisors with trivial class are principal along the real locus; signs on components can be prescribed by functions invertible along S(ℝ). B19, Lemma 6.4 proof, p. 92: Bröcker's theorem gives h₁ vanishing to order one along R and H with no other real zeros or poles, and h₂ with the signs of h₁ off Ξ.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/RealLocus`, namespace `TauCeti.RealSurface`.

<a id="pi-6-signed-branch-section"></a>

### A branch section with prescribed real locus and sign

`PI.6/signed-branch-section` · construction

Let A be very ample, N a line bundle, ι : 𝒮 → Ξ as in Assumption 6.1, and 𝒰 a neighbourhood of ι in C^∞(𝒮, Ξ). For every large even l there are ι′ ∈ 𝒰 and t ∈ H⁰(S, A^l ⊗ N²(−R)) such that {t = 0} is smooth along its real locus Z, Z = ι′(𝒮), and rt ∈ H⁰(S, A^l ⊗ N²) is negative on S(ℝ) ∖ Ξ.

**Hypotheses and conventions.** Bröcker is applied to the signed divisor H − R; the printed choice (simple zero along R) leaves an extra factor 2R (RealSurfacePeriodIndex/E22).

**Construction.**

1. PI.6/nash-approximation-input gives ι′ ∈ 𝒰 and H smooth along S(ℝ) with H(ℝ) = ι′(𝒮); cl\_R(H − R) = 0 by Assumption 6.1 (ii).
2. PI.6/brocker-sign-input (b) gives h₁ with a simple pole along R, a simple zero along H and no other real zeros or poles; (a) gives h₂ invertible along S(ℝ) with the sign of h₁ on S(ℝ) ∖ Ξ.
3. Let D′ be the remaining polar divisor of h₁h₂ (disjoint from S(ℝ)); choose l even with A^{l/2} ⊗ N(−R − D′) very ample, a basis (u\_i) of its sections viewed in A^{l/2} ⊗ N(−R) vanishing on D′, and u = Σ u\_i² ∈ H⁰(A^l ⊗ N²(−2R)).
4. t = −h₁h₂ r u is regular, its real zero locus is H(ℝ) (the R-orders cancel: −1 from h₁, +1 from r), and rt = −h₁h₂ r² u is negative off Ξ (PI.6/squared-line-positivity).

**Uses.** Benoist 2019, Proposition 6.6 proof, p. 93: a₂ close to t makes rs negative on Ψ and D(ℝ) = ι(𝒮). PI.6/degree-two-splitting-uniform: the section t.

**API.**

- `RealSurface.signedBranchSection` (constructor): (ι′, t) for large even l.
- `RealSurface.signedBranchSection_realLocus` (characterisation): {t = 0}(ℝ) = ι′(𝒮), smooth along it.
- `RealSurface.signedBranchSection_neg` (relation): rt is negative on S(ℝ) ∖ Ξ.
- `RealSurface.signedBranchSection_mem` (other): ι′ ∈ 𝒰.

**Unit tests.**

- `RealSurface.signedBranchSection_full` (degenerate): If Ξ = S(ℝ), any t with the real locus condition works.
- `RealSurface.signedBranchSection_orders` (computation): ord\_R(t) = ord\_R(h₁) + ord\_R(r) = −1 + 1 = 0 along every component of R.
- `RealSurface.signedBranchSection_printed_fails` (non-example): With h₁ vanishing to order one along R, t = −h₁h₂ru vanishes to order 2 along R and is not a section of A^l ⊗ N²(−R) with real locus ι′(𝒮).
- `RealSurface.signedBranchSection_sumSquares` (compatibility): u is positive on S(ℝ) as a sum of squares of sections without common real zero (PI.6/squared-line-positivity).

**Acceptance.** If Ξ = S(ℝ) the sign condition is empty.

**Direct prerequisites:** [Algebraic approximation of a hypersurface (cited input)](#pi-6-nash-approximation-input); [Bröcker's real divisors and prescribed signs (cited input)](#pi-6-brocker-sign-input); [Topological conditions on the real branch locus](#pi-6-branch-locus-conditions); [Positivity in a squared real line](#pi-6-squared-line-positivity); AlgebraicModuliForArithmeticGeometry §1.4 (`amplePowersAndFixedTwists`).

**Source:** B19, Lemma 6.4 and proof, p. 92: Construction of ι′ and t with {t = 0} smooth along its real locus ι′(𝒮) and rt negative on S(ℝ) ∖ Ξ, from BCR 12.4.11, Bröcker's theorem and a sum of squares.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/RealLocus`, namespace `TauCeti.RealSurface`.

<a id="pi-6-topology-to-cover-hypotheses"></a>

### The branch conditions imply the cover hypotheses

`PI.6/topology-to-cover-hypotheses` · theorem

Let s ∈ H⁰(S, L²(R)) have smooth zero locus D with rs negative on S(ℝ) ∖ Ξ, let p : T → S be the double cover of PI.3/incidence-double-cover ramified over R ∪ D, and suppose the inclusion ι : 𝒮 = D(ℝ) → Ξ satisfies Assumption 6.1. Then p satisfies Assumption 4.1 with Ψ = S(ℝ) ∖ Ξ.

**Hypotheses and conventions.** Ψ = S(ℝ) ∖ Ξ, the open and closed set to avoid (the published proof says Θ; see RealSurfacePeriodIndex/E24).

**Proof.**

1. (i): the equation rv² = sw² has real solutions over x only if rs(x) ≥ 0, so p(T(ℝ)) ⊂ Ξ.
2. (ii): D lifts to T, so ι lifts to T(ℝ) and the classes of components of ι(𝒮) are pushforwards; Assumption 6.1 (iii) concludes.
3. (iii): for each component Σ of Ξ, p(p⁻¹Σ) = Σ₊ ∪ (Σ ∩ Δ(ℝ)) is connected by Assumption 6.1 (iv), and fibres over Δ(ℝ) are connected; if p⁻¹Σ were disconnected two components would have overlapping images and would meet over a boundary point of Δ(ℝ), a contradiction. Connected preimages give injectivity of p\_\* on H².

**Acceptance.** If Ξ = S(ℝ), Ψ = ∅ and (i) is empty.

**Direct prerequisites:** [Topological conditions on the real branch locus](#pi-6-branch-locus-conditions); [Positivity in a squared real line](#pi-6-squared-line-positivity); [Hypotheses on a double cover killing a period-two class](#pi-4-brauer-cover-hypotheses); [The incidence model and its resolution](#pi-3-incidence-double-cover).

**Source:** B19, Lemma 6.5 and proof, p. 92: If rs < 0 off Ξ and D(ℝ) satisfies Assumption 6.1 then p satisfies Assumption 4.1: avoidance, kernel generation and connectedness of preimages of components.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/RealLocus`, namespace `TauCeti.RealSurface`.

<a id="pi-6-real-green-criterion"></a>

### Green's infinitesimal criterion over ℝ

`PI.6/real-green-criterion` · theorem

Let π : 𝒯 → B be a smooth projective family of surfaces over ℝ, H ⊂ H²\_ℚ a G-stable sub-variation of the variation of PI.2/geometric-variation, b ∈ B(ℝ), and Λ ⊂ B(ℂ) a G-stable connected open neighbourhood of b over which H is trivialised, with Λ(ℝ) connected and contractible. If some λ ∈ H^{1,1}\_{ℝ,b}(1)^G ∩ H\_b has ∇(λ) : T\_{B(ℂ),b} → H^{0,2}\_b surjective onto the (0,2)-part of H\_b, then there is a nonempty open cone Ω ⊂ H\_{ℝ,b}(1)^G such that every ω ∈ Ω is, under the trivialisation, of type (1,1) at some b′ ∈ Λ(ℝ).

**Hypotheses and conventions.** H a G-stable sub-local system whose complexification is compatible with the Hodge filtration; ℝ(1) carries conjugation by −1. Such Λ exists for every b ∈ B(ℝ): intersect a contractible neighbourhood with its conjugate, remove a closed subset of its real points and keep the component of b.

**Proof.**

1. Trivialise H over Λ; the map φ from the real (1,1)-bundle H^{1,1}\_ℝ|\_Λ to H\_{ℝ,b}, inclusion followed by the trivialisation, is G-equivariant and, by surjectivity of ∇(λ), a submersion at (b, λ) (as in the proof of BEN18 Proposition 1.1).
2. Tensor with ℝ(1) and take G-invariants: the fixed locus of a smooth involution is a submanifold whose tangent space is the invariants, so φ′ : H^{1,1}\_ℝ(1)^G|\_{Λ(ℝ)} → H\_{ℝ,b}(1)^G is still a submersion at (b, λ).
3. The image of φ′ contains a nonempty open set and is stable under positive scalars, so it contains a nonempty open cone Ω.

**Acceptance.** If the (0,2)-part of H\_b vanishes, every class of H\_{ℝ,b}(1)^G is of type (1,1) at b itself and Ω may be the whole space. For the universal family of quartic surfaces at a quartic whose real locus is ten spheres, H^{1,1}\_ℝ(1)^G has rank one, spanned by the hyperplane class, which stays (1,1) on every fibre; the hypothesis fails there (BEN18 Remark 1.5). In the vanishing variation of the double-cover family the hypothesis is supplied by the class of the lifted curve C (PI.6/vanishing-variation).

**Direct prerequisites:** [The weight-two variation of a family of surfaces](#pi-2-geometric-variation); ShimuraData §3.1 (`Variation`).

**Source:** BEN18, Proposition 1.1 and §1.2, pp. 3–4: The real infinitesimal criterion: surjectivity of ∇(λ) for an invariant real (1,1) class gives an open cone of classes that become (1,1) at real parameters nearby. BEN18, Proposition 1.3, p. 5: The geometric form for smooth projective families over ℝ. B19, Proof of Proposition 6.6, p. 94: Application to the vanishing variation of the double-cover family.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Splitting`, namespace `TauCeti.RealSurface`.

<a id="pi-6-vanishing-variation"></a>

### The vanishing variation of the double-cover family

`PI.6/vanishing-variation` · construction

For the real family π : 𝒯 → B of PI.3/incidence-double-cover, the G-equivariant local system R²π\_\*ℚ on B(ℂ) splits orthogonally for the cup product as p\*H²(S(ℂ), ℚ) ⊕ H²\_{ℚ,van}; both are sub-variations of Hodge structure, the first constant. If λ is the class of the lifted curve C ⊂ T\_s (PI.5/curve-lift) and dim coker φ\_λ ≤ h²(S, O\_S) (PI.5/nl-codimension-bound), then the Gauss–Manin derivative ∇λ : T\_{B(ℂ),s} → H²(T, O\_T)\_van is surjective.

**Hypotheses and conventions.** S connected smooth projective; p of degree 2 so p\_\*p\* = 2 and the pullback is injective rationally. The variation and its real structure are those of PI.2/geometric-variation, on the carrier ShimuraData §3.1 (`Variation`).

**Construction.**

1. p\* : H²(S, ℚ) → H²(T\_b, ℚ) is injective with p\_\*p\* = 2; its image is a constant sub-local system on which the cup pairing is nondegenerate (projection formula), so its orthogonal complement is a sub-variation (the orthogonal complement, for the polarising cup pairing, of a sub-variation on which that pairing is nondegenerate is again a sub-variation).
2. Flat sections of a constant sub-variation have zero Gauss–Manin derivative; Griffiths' formula (PI.2/geometric-variation) identifies ∇λ with φ\_λ.
3. The codimension bound and H²(T, O\_T) = H²(S, O\_S) ⊕ H²(T, O\_T)\_van give surjectivity onto the vanishing part, since the image of ∇λ has zero component in the constant summand.

**Uses.** Benoist 2019, Proposition 6.6 proof, pp. 94–95: the real Green criterion applied to H²\_{ℚ,van}. PI.6/real-green-criterion: the open cone in the vanishing invariant subspace. PI.6/degree-two-splitting-uniform: decomposition (6.1) of β − 2γ.

**API.**

- `RealSurface.vanishingVariation` (data): H²\_{ℚ,van} ⊂ R²π\_\*ℚ, the orthogonal of p\*H²(S, ℚ).
- `RealSurface.vanishingVariation_isSubVariation` (structure): It is a sub-variation of Hodge structure stable under the real action.
- `RealSurface.vanishingVariation_split` (equivalence): R²π\_\*ℚ = p\*H²(S, ℚ) ⊕ H²\_{ℚ,van}, orthogonally.
- `RealSurface.vanishingVariation_derivative_surj` (other): ∇λ : T\_{B(ℂ),s} → H²(T, O\_T)\_van is onto under the codimension bound.

**Unit tests.**

- `RealSurface.vanishingVariation_rank` (computation): rank H²\_{ℚ,van} = b₂(T) − b₂(S).
- `RealSurface.vanishingVariation_constant_part` (degenerate): The summand p\*H²(S, ℚ) is a constant variation with zero Gauss–Manin derivative.
- `RealSurface.vanishingVariation_not_kernel_integral` (non-example): The integral classes of the vanishing part need not form a direct summand of H²(T, ℤ): the splitting is rational.
- `RealSurface.vanishingVariation_compat` (compatibility): The vanishing part is the kernel of p\_\* : R²π\_\*ℚ → H²(S, ℚ).

**Acceptance.** If h²(S, O\_S) = 0 the vanishing part carries all of H²(T, O\_T).

**Direct prerequisites:** [Noether–Lefschetz locus of the expected dimension](#pi-5-nl-codimension-bound); [The weight-two variation of a family of surfaces](#pi-2-geometric-variation); ShimuraData §3.1 (`Variation`).

**Source:** B19, Proof of Proposition 6.6, p. 94: The splitting H²\_ℚ = H²(S(ℂ), ℚ) ⊕ H²\_{ℚ,van} into sub-variations, the class λ, Griffiths' computation and surjectivity of ∇(λ) onto H²(T, O\_T)\_van.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Splitting`, namespace `TauCeti.RealSurface`.

<a id="pi-6-family-pair-stratification"></a>

### The double-cover family is a stratified family of pairs

`PI.6/family-pair-stratification` · theorem

In PI.3/incidence-double-cover let s ∈ B(ℝ) and Λ ⊂ B(ℝ) a contractible open neighbourhood of s over which R ∩ D\_x is finite étale. Put M = π⁻¹(Λ) ⊂ 𝒯(ℂ), with complex conjugation σ and f = π|\_M : M → Λ. Then P = p⁻¹(R)(ℂ) ∩ M is a union of strata of a G-invariant Whitney stratification of M whose strata are: the exceptional curves over the points of Sing R, minus their points on the strict transform R̃; the ℙ¹ fibres over the points of R ∩ D\_x, minus their points on R̃; the strict transform R̃ of R, the same curve {r = w = 0} for every x, minus its points on the previous curves; those finitely many points; and the open stratum M ∖ P. The map f is proper and its restriction to every stratum is a submersion onto Λ.

**Hypotheses and conventions.** Λ ⊂ B(ℝ) consists of real parameters, so σ acts on every fibre; transversality of D\_x to R and its disjointness from Sing R are open conditions, so they persist over a small Λ. These are the hypotheses of AlgebraicTopologyPartII AT2.16/stratified-pair-transport other than the existence of invariant control data, which that target supplies (gap:at2-stratified-pair-transport).

**Proof.**

1. p⁻¹(R) is the union of R̃, the exceptional curves over Sing R and the ℙ¹ fibres over R ∩ D\_x: over a smooth point of R off D\_x the fibre equation sw² = 0 has the single solution w = 0, and {r = w = 0} lies on every T̄\_x.
2. The strata are submanifolds submersive over Λ: the exceptional curves are conics in fixed exceptional planes varying smoothly with x, the points of R ∩ D\_x form a finite étale family over Λ, and R̃ is constant.
3. Locally analytically the family of pairs is a product: near a point over R ∩ D\_x, coordinates (s\_x, u) with r = s\_x u² trivialise T̄\_x and p⁻¹(R) = {s\_x u = 0} uniformly in x; near the exceptional curves the minimal resolution of xy = s\_x u² is likewise uniform (PI.3/incidence-local-resolution). Products of the fibre stratification by a normal crossings curve with Λ satisfy Whitney's conditions.
4. π is proper, so f is proper; σ preserves R, Sing R and D\_x for real x, hence every stratum.

**Acceptance.** If R = ∅, P = ∅ and the statement is the properness and submersivity of f, the input of ordinary equivariant Ehresmann. If R is smooth and R ∩ D\_x = ∅, P = R̃ × Λ is a single stratum. An Ehresmann trivialisation of M chosen without regard to P need not map p\_s⁻¹(R) onto p\_x⁻¹(R), so these strata are needed to compare the restrictions to T\_{x,U} (PI.6/kummer-lift-transport).

**Direct prerequisites:** [The incidence model and its resolution](#pi-3-incidence-double-cover); [Local structure and Stein factorisation of the incidence model](#pi-3-incidence-local-resolution).

**Source:** B19, §3.1, pp. 76–77: The surfaces T̄ = {rv² = sw²}, their singular points over Sing R at fixed positions, and the family 𝒯 ⊂ B × X. B19, Proof of Proposition 6.6, pp. 94–95: The G-stable neighbourhood with contractible real part and the equivariant Ehresmann trivialisation used to replace T by T\_x.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Splitting`, namespace `TauCeti.RealSurface`.

<a id="pi-6-kummer-lift-transport"></a>

### Transport of the chosen Kummer lift along the family

`PI.6/kummer-lift-transport` · construction

Before deforming the fibre T\_s in Proposition 6.6, normalise the integral lift β of the pulled-back class so that (β mod 2)|\_{T\_{s,U}} = p\_s\*α̃ (subtract cl(φ̄) for φ̄ ∈ Pic(T\_s) extending the difference on T\_{s,U}), and reapply PI.4/uniform-pushforward-adjustment to the normalised lift. Over a small G-stable contractible real parameter neighbourhood Λ(ℝ), transport the pair (T, p⁻¹R) equivariantly so that the restriction to T\_U and the pullback of the fixed class α̃ correspond on every fibre: (β\_x mod 2)|\_{T\_{x,U}} = p\_x\*α̃ for x ∈ Λ(ℝ).

**Hypotheses and conventions.** The pair (T, p⁻¹R) is transported by AlgebraicTopologyPartII AT2.16/stratified-pair-transport (gap:at2-stratified-pair-transport); its stratification, properness and submersion hypotheses for this family are PI.6/family-pair-stratification.

**Construction.**

1. The difference of β mod 2 and p\_s\*α̃ on T\_{s,U} is the class of a line bundle there (Kummer sequence on T\_{s,U}); extend it to T\_s and subtract.
2. Equivariant Ehresmann (AlgebraicTopologyPartII AT2.16/equivariant-ehresmann) trivialises 𝒯(ℂ) over Λ(ℝ); to keep track of T\_U, transport the pair (T, p⁻¹R) by AlgebraicTopologyPartII AT2.16/stratified-pair-transport, whose hypotheses hold by PI.6/family-pair-stratification.
3. The class p\*α̃ is the restriction of a class on the total space over Λ(ℝ) pulled back from U(ℂ), so its transport is the fibrewise pullback; hence the normalisation persists.

**Uses.** Benoist 2019, Proposition 6.6 proof, p. 95: the step 'replacing T with T\_x' needs the transported lift to still induce p\_x\*α. PI.6/degree-two-splitting-uniform: the final splitting on the new fibre.

**API.**

- `RealSurface.normalizedLift` (constructor): β with (β mod 2)|\_{T\_U} = p\*α̃.
- `RealSurface.normalizedLift_mod` (simp): The normalisation equation on T\_U.
- `RealSurface.transportLift` (functoriality): The transported class on T\_x for x ∈ Λ(ℝ).
- `RealSurface.transportLift_mod` (relation): (transportLift β x mod 2)|\_{T\_{x,U}} = p\_x\*α̃, using PI.6/family-pair-stratification.
- `RealSurface.transportLift_pushforward` (relation): Transport commutes with p\_\* and with the constant summand.

**Unit tests.**

- `RealSurface.normalizedLift_trivial` (degenerate): For α = 0 and α̃ = 0, β = 0 is normalised and transports to 0.
- `RealSurface.transportLift_no_ramification` (computation): If R = ∅, transport is ordinary equivariant Ehresmann on T and the normalisation is automatic.
- `RealSurface.transportLift_ordinary_insufficient` (non-example): A trivialisation of 𝒯(ℂ) that does not preserve p⁻¹R does not identify the restrictions to T\_U, so it does not certify (β\_x mod 2)|\_{T\_{x,U}} = p\_x\*α̃.
- `RealSurface.transportLift_compat` (compatibility): On the constant summand p\*H²(S) transport is the identity.

**Acceptance.** If R = ∅ the pair is (T, ∅) and ordinary Ehresmann suffices.

**Direct prerequisites:** [Integral pushforward adjustment for uniform evaluation](#pi-4-uniform-pushforward-adjustment); AlgebraicTopologyPartII AT2.16/equivariant-ehresmann (gap:at2-equivariant-ehresmann); AlgebraicTopologyPartII AT2.16/stratified-pair-transport (gap:at2-stratified-pair-transport); [The double-cover family is a stratified family of pairs](#pi-6-family-pair-stratification); [The incidence model and its resolution](#pi-3-incidence-double-cover); [Kummer and topological Brauer sequences](#pi-1-kummer-brauer-sequences).

**Source:** B19, Proof of Proposition 6.6, pp. 94–95, citing Dimca 1985, Lemma 4: A G-equivariant Ehresmann trivialisation over a small contractible real neighbourhood identifies cohomology of nearby fibres; the conclusion replaces T by T\_x. B19, Proposition 1.2 proof, p. 71: The complex analogue, where the transported class is the restriction of the family pullback.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Splitting`, namespace `TauCeti.RealSurface`.

<a id="pi-6-degree-two-splitting-uniform"></a>

### Degree-two splitting with real-point avoidance under uniform evaluation

`PI.6/degree-two-splitting-uniform` · theorem

Let S be a connected smooth projective surface over ℝ, a ∈ Br(ℝ(S)) of period 2, U its unramified locus, Θ = Θ(a), and S(ℝ) = Ξ ⊔ Ψ a decomposition into open and closed subsets with Θ ⊂ Ψ ⊂ U(ℝ). Suppose a has a Kummer lift ã ∈ H²\_G(U(ℂ), 𝔽₂) with \[ã]₁|\_Ψ = 0 and \[ã]₀|\_Ψ constant equal to t ∈ 𝔽₂ (t = 0 allowed, so Ψ may contain components where a evaluates to 0). Then there are a connected smooth projective surface T over ℝ and a morphism p : T → S of degree 2 with p(T(ℝ)) ⊂ Ξ and a\_{ℝ(T)} = 0.

**Hypotheses and conventions.** Uniform evaluation on Ψ: this is the form of the source's Proposition 6.6 that the induction uses (see Ownership).

**Proof.**

1. Replace S by a modification S′ → S that is an isomorphism over U and makes S′ ∖ U an SNC divisor: principalization of the ideal of S ∖ U (ResolutionOfSingularitiesCharacteristicZero §5.1) gives a composite of blow-ups S′ → S, an isomorphism over U, with S′ ∖ U an SNC divisor; the ramification divisor of a on S′ is a union of its components, hence SNC, and Ψ stays open and closed in S′(ℝ) since it is compact and open in U(ℝ); then blow up general points off R to obtain N with Assumption 5.2 (PI.5/blowup-auxiliary-bundle) and an embedding ι satisfying Assumption 6.1 (PI.6/branch-conditions-blowup); modifications off U do not change the hypotheses.
2. Choose A very ample, L = A^l ⊗ N(−R) with l large even so that Assumptions 3.1, 5.1 and PI.6/signed-branch-section hold; get t with rt negative on Ψ and real locus ι(𝒮).
3. Take s = a₁s₀ + a₂c (PI.5/curve-lift) with a₁ > 0 small and a₂ near t; then rs < 0 on Ψ, D(ℝ) = ι(𝒮) after moving ι (PI.6/branch-conditions-stable), and p satisfies Assumption 4.1 (PI.6/topology-to-cover-hypotheses).
4. PI.4/pullback-unramified, PI.4/uniform-obstruction-vanishing and PI.4/uniform-pushforward-adjustment give a\_T ∈ Br(T)\[2], an integral lift β normalised as in PI.6/kummer-lift-transport, and γ, θ with p\_\*(β − 2γ) = cl(θ).
5. Split β − 2γ = (ε₁, ε₂) along p\*H²(S) ⊕ H²\_van (PI.6/vanishing-variation); the invariant equivariant classes map to a full lattice of H²(T, ℝ(1))^G\_van (AlgebraicTopologyPartII AT2.16/finite-index-lattice); the open cone of PI.6/real-green-criterion, applied to H²\_van with λ the class of C, meets ε₂ + 2·lattice (PI.2/open-cone-lattice-coset): ε₂ = 2δ + ν with ν in the cone.
6. For some x ∈ Λ(ℝ), ν is of type (1,1) on T\_x and ε₁ is of type (1,1) because p\_\*(β − 2γ) = cl(θ); so β − 2γ − 2δ is an integral equivariant (1,1) class and the real Lefschetz (1,1) theorem (MotivesAndAlgebraicCycles §7.8) writes it as cl(φ) on T\_x.
7. By the transported normalisation, a vanishes on T\_{x,U} in the Kummer sequence, hence in Br(ℝ(T\_x)); replace T by T\_x. p(T\_x(ℝ)) ⊂ Ξ for x near s.

**Acceptance.** If S(ℝ) = ∅ (Theorem 0.3 setting), Ψ = Ξ = ∅ and the conclusion is a degree-2 splitting cover of S. For t = 0 the theorem applies to a = (n/2)α with 4 | n and Ψ = Θ(α).

**Direct prerequisites:** [The pulled-back class is unramified](#pi-4-pullback-unramified); [Vanishing of the topological obstruction for uniform evaluation](#pi-4-uniform-obstruction-vanishing); [Integral pushforward adjustment for uniform evaluation](#pi-4-uniform-pushforward-adjustment); [Blowing up points to realise the auxiliary hypotheses](#pi-5-blowup-auxiliary-bundle); [The point of B whose cover contains the curve](#pi-5-curve-lift); [Noether–Lefschetz locus of the expected dimension](#pi-5-nl-codimension-bound); [Blow-ups producing the branch conditions](#pi-6-branch-conditions-blowup); [Stability of the branch conditions](#pi-6-branch-conditions-stable); [A branch section with prescribed real locus and sign](#pi-6-signed-branch-section); [The branch conditions imply the cover hypotheses](#pi-6-topology-to-cover-hypotheses); [The vanishing variation of the double-cover family](#pi-6-vanishing-variation); [Transport of the chosen Kummer lift along the family](#pi-6-kummer-lift-transport); ResolutionOfSingularitiesCharacteristicZero §5.1 (`principalization`); AlgebraicTopologyPartII AT2.16/finite-index-lattice (gap:at2-finite-index-lattice); [Green's infinitesimal criterion over ℝ](#pi-6-real-green-criterion); [Open cones meet lattice cosets](#pi-2-open-cone-lattice-coset); MotivesAndAlgebraicCycles §7.8; MotivesAndAlgebraicCycles §7.6b.

**Source:** B19, Proposition 6.6 and proof, pp. 93–95: Existence of a degree-2 cover T → S with p(T(ℝ)) ⊂ Ξ splitting α, by the double-cover family, Propositions 4.2–4.5, Green's real criterion and the real Lefschetz (1,1) theorem. BW20, Proposition 2.8: Real Lefschetz (1,1): integral equivariant classes of type (1,1) are classes of real line bundles.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Splitting`, namespace `TauCeti.RealSurface`.

## Layer PI.7: Period equals index: the main theorems and the u-invariant

Uniform evaluation of the half-period class; the induction step and Proposition 6.7; Theorem 0.3 (S(ℝ) = ∅), Theorem 0.4 (zero real evaluation), the sufficient half of Theorem 0.5; real-closure triviality implies pointwise triviality; Theorem 0.12 (u(K) ≤ 4 in transcendence degree 2, u(ℝ(S)) = 4 with the corrected anisotropic witness); Theorem 0.10 (rank ≥ 5 forms isotropic when S(ℝ) = ∅); the anticanonical model of degree-four del Pezzo surfaces and Theorem 0.13 (degree-four del Pezzo surfaces over ℝ(C) with C(ℝ) = ∅ have points).

*Builds on:* RealSurfacePeriodIndex PI.0; RealSurfacePeriodIndex PI.1; RealSurfacePeriodIndex PI.2; RealSurfacePeriodIndex PI.6; ResolutionOfSingularitiesCharacteristicZero §6.2; SchemeAndStackFoundations §2.22.

<a id="pi-7-half-period-uniform-evaluation"></a>

### Uniform evaluation of the half-period class

`PI.7/half-period-uniform-evaluation` · theorem

Let α ∈ Br(ℝ(S)) have even period n, U = U\_α, and Ψ = Θ(α), assumed to be a union of components of S(ℝ) contained in U(ℝ). The period-2 class a = (n/2)α evaluates at every x ∈ Ψ to (n/2 mod 2)·(−1,−1) and to 0 at every x ∈ U(ℝ) ∖ Ψ. Hence any Kummer lift of a restricted to U(ℂ) has \[·]₀|\_Ψ constant equal to t = n/2 mod 2: t = 1 if n ≡ 2 mod 4 and t = 0 if 4 | n; in the latter case Θ(a) = ∅ although Ψ need not be empty.

**Hypotheses and conventions.** n even; Θ(α) a union of components of S(ℝ) inside U(ℝ).

**Proof.**

1. α\_x ∈ Br(ℝ) ≅ ℤ/2 equals the nonzero element on Ψ and 0 off Ψ; multiplying by n/2 gives the stated values.
2. The degree-zero component of a Kummer lift is the evaluation (PI.1/real-evaluation-locus).

**Acceptance.** For n = 2, t = 1 and Θ(a) = Θ(α). For n = 4, t = 0.

**Direct prerequisites:** [Real evaluation and the nonzero evaluation locus](#pi-1-real-evaluation-locus); [Unramified locus of a Brauer class](#pi-1-unramified-locus).

**Source:** B19, Proof of Proposition 6.7, p. 95: Proposition 6.6 is applied to (n/2)α with Ψ = Θ and Ξ = S(ℝ) ∖ Θ.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Induction`, namespace `TauCeti.RealSurface`.

<a id="pi-7-period-induction-step"></a>

### The induction step on the period

`PI.7/period-induction-step` · theorem

Let α ∈ Br(ℝ(S)) have even period n, with Θ(α) a union of components of S(ℝ) and a lift ξ ∈ H²\_G(U\_α(ℂ), 𝔽₂) of (n/2)α with \[ξ]₁|\_{Θ(α)} = 0. Then there is a degree-2 morphism p : T → S of connected smooth projective real surfaces with p(T(ℝ)) ∩ Θ(α) = ∅ such that α\_{ℝ(T)} has period exactly n/2 and evaluates to 0 at every real point of its unramified locus.

**Hypotheses and conventions.** The setting of PI.7/half-period-uniform-evaluation.

**Proof.**

1. a = (n/2)α has unramified locus U\_a ⊃ U\_α; lift a on U\_a and compare with ξ on U\_α: the difference is the reduction of a Picard class of U\_α, which extends to U\_a (PI.1/point-removal-extension); subtract it to get a lift ã on U\_a restricting to ξ.
2. Ψ = Θ(α) is a union of components inside U\_α(ℝ) ⊂ U\_a(ℝ), Θ(a) ⊂ Ψ by density of U\_α and local constancy, and \[ã]₀|\_Ψ is constant (PI.7/half-period-uniform-evaluation).
3. PI.6/degree-two-splitting-uniform with Ξ = S(ℝ) ∖ Ψ gives p : T → S of degree 2 with a\_{ℝ(T)} = 0 and p(T(ℝ)) ∩ Ψ = ∅.
4. Period: m = per(α\_{ℝ(T)}) divides n/2 since (n/2)α\_T = a\_T = 0; corestriction (PI.0/brauer-corestriction) gives cor(α\_T) = 2α, of period n/2, so n/2 divides m.
5. Evaluation: for y ∈ V(ℝ), V the unramified locus of α\_T, either y ∈ p⁻¹(U)(ℝ), where α\_T(y) = α(p(y)) = 0 as p(y) ∉ Θ, or y lies in a component of V(ℝ) meeting p⁻¹(U)(ℝ) densely; local constancy gives α\_T(y) = 0.

**Acceptance.** For n = 2, α\_{ℝ(T)} = 0.

**Direct prerequisites:** [Uniform evaluation of the half-period class](#pi-7-half-period-uniform-evaluation); [Degree-two splitting with real-point avoidance under uniform evaluation](#pi-6-degree-two-splitting-uniform); [Removing finitely many points and extending line bundles](#pi-1-point-removal-extension); [Real evaluation and the nonzero evaluation locus](#pi-1-real-evaluation-locus); [Corestriction of Brauer classes](#pi-0-brauer-corestriction); [Kummer and topological Brauer sequences](#pi-1-kummer-brauer-sequences).

**Source:** B19, Proof of Proposition 6.7, p. 95: Apply Proposition 6.6 to (n/2)α with Ψ = Θ; α\_{ℝ(T)} has period n/2 and vanishes at real points, and induction concludes. B19, Proposition 6.7 statement, p. 95: The odd case is handled by de Jong and a norm argument; the half-period lift condition concerns even n (RealSurfacePeriodIndex/E8).

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Induction`, namespace `TauCeti.RealSurface`.

<a id="pi-7-arbitrary-period-sufficiency"></a>

### Sufficient condition for period equals index

`PI.7/arbitrary-period-sufficiency` · theorem

Let S be a connected smooth projective surface over ℝ and α ∈ Br(ℝ(S)) of period n, U = U\_α, Θ = Θ(α), assumed to be a union of components of S(ℝ). If n is odd, ind(α) = n. If n is even and some lift ξ ∈ H²\_G(U(ℂ), 𝔽₂) of (n/2)α has \[ξ]₁|\_Θ = 0, then ind(α) = n.

**Hypotheses and conventions.** The odd case needs no lift condition.

**Proof.**

1. Odd n: PI.2/real-closed-norm-bound.
2. Even n, by induction on n: PI.7/period-induction-step gives p : T → S of degree 2 with α\_T of period n/2 evaluating to 0 at all real points of its unramified locus; then Θ(α\_T) = ∅ and the lift condition holds trivially for α\_T (zero first component on the empty set), so by induction (or by the odd case) ind(α\_T) = n/2.
3. Reverse index divisibility: ind(α) divides 2·ind(α\_T) = n (PI.0/brauer-period-index), and n = per(α) divides ind(α).

**Acceptance.** For α of period 2 with Θ = ∅ and any lift, ind(α) = 2.

**Direct prerequisites:** [The induction step on the period](#pi-7-period-induction-step); [Norm bound over a real closed field](#pi-2-real-closed-norm-bound); [Period and index of a Brauer class](#pi-0-brauer-period-index).

**Source:** B19, Proposition 6.7 and proof, p. 95: If Θ is a union of components and the half-period lift has vanishing first component on Θ, then ind(α) = n, by induction on n.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Induction`, namespace `TauCeti.RealSurface`.

<a id="pi-7-no-real-points-period-index"></a>

### Period equals index on real surfaces without real points

`PI.7/no-real-points-period-index` · theorem

Let S be a connected smooth projective surface over ℝ with S(ℝ) = ∅. Then ind(α) = per(α) for every α ∈ Br(ℝ(S)), ramified or not.

**Hypotheses and conventions.** S connected smooth projective over ℝ, S(ℝ) = ∅.

**Proof.**

1. Θ = ∅ is a union of components of the empty S(ℝ), and the lift condition is empty; apply PI.7/arbitrary-period-sufficiency.

**Acceptance.** For S the anisotropic quadric x² + y² + z² + w² = 0 in ℙ³\_ℝ, every class of Br(ℝ(S)) has index equal to its period. K = ℝ(x, y, z | x² + y² + z² = −1) is a field of cohomological dimension 2 on which period equals index.

**Direct prerequisites:** [Sufficient condition for period equals index](#pi-7-arbitrary-period-sufficiency).

**Source:** B19, Theorem 0.3, p. 64; §6.3, p. 95: If S(ℝ) = ∅ then ind(α) = per(α) for every α ∈ Br(ℝ(S)); it is the case S(ℝ) = ∅ of Proposition 6.7.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/MainTheorems`, namespace `TauCeti.RealSurface`.

<a id="pi-7-zero-evaluation-period-index"></a>

### Period equals index for classes vanishing at real points

`PI.7/zero-evaluation-period-index` · theorem

Let U be a connected smooth surface over ℝ and α ∈ Br(U) ⊂ Br(ℝ(U)) with α\_x = 0 ∈ Br(ℝ) for every x ∈ U(ℝ). Then ind(α) = per(α).

**Hypotheses and conventions.** U connected smooth over ℝ, not necessarily proper; U is quasi-projective (a smooth separated surface over a field is, by Nagata compactification, resolution of surface singularities and Zariski's projectivity of smooth proper surfaces).

**Proof.**

1. Compactify U to a connected smooth projective S with ℝ(S) = ℝ(U) (ResolutionOfSingularitiesCharacteristicZero §6.2, `sncCompactification`); then U ⊂ U\_α.
2. Each component of S(ℝ) is a smooth surface and S ∖ U meets it in a set of dimension ≤ 1, so U(ℝ) is dense in S(ℝ) and in U\_α(ℝ); evaluation is locally constant on U\_α(ℝ) (PI.1/real-evaluation-locus) and vanishes on U(ℝ), hence Θ(α) = ∅.
3. Apply PI.7/arbitrary-period-sufficiency with Θ = ∅, a union of (no) components, for which the lift condition is empty.

**Acceptance.** For α = (−1, 1 + x²) on 𝔸², α\_x = 0 everywhere and ind α = per α = 1 (α = 0).

**Direct prerequisites:** [Sufficient condition for period equals index](#pi-7-arbitrary-period-sufficiency); [Real evaluation and the nonzero evaluation locus](#pi-1-real-evaluation-locus); [Unramified locus of a Brauer class](#pi-1-unramified-locus); ResolutionOfSingularitiesCharacteristicZero §6.2 (`sncCompactification`).

**Source:** B19, Theorem 0.4, p. 64; §6.3, p. 95: If α ∈ Br(U) vanishes at every real point of U then ind(α) = per(α); it is Proposition 6.7 with Θ = ∅.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/MainTheorems`, namespace `TauCeti.RealSurface`.

<a id="pi-7-unramified-odd-or-vanishing"></a>

### Unramified classes: the sufficient half of Theorem 0.5

`PI.7/unramified-odd-or-vanishing` · theorem

Let S be a connected smooth projective surface over ℝ and α ∈ Br(S) of period n. If n is odd, or if some lift ξ ∈ H²\_G(S(ℂ), 𝔽₂) of (n/2)α in the Kummer sequence 0 → Pic(S)/2 → H²\_G(S(ℂ), 𝔽₂) → Br(S)\[2] → 0 satisfies \[ξ]₁|\_Θ = 0, then ind(α) = per(α).

**Hypotheses and conventions.** α unramified on S, so U = S and Θ = Θ(α) is a union of components of S(ℝ).

**Proof.**

1. Apply PI.7/arbitrary-period-sufficiency with U = S.

**Acceptance.** If S(ℝ) is orientable and every class of H¹(S(ℝ)) is algebraic, the condition can be met by a Picard correction.

**Direct prerequisites:** [Sufficient condition for period equals index](#pi-7-arbitrary-period-sufficiency); [Real evaluation and the nonzero evaluation locus](#pi-1-real-evaluation-locus).

**Source:** B19, Theorem 0.5, first statement, p. 64; §6.3, p. 95: Odd period, or existence of a half-period lift with vanishing first component on Θ, implies ind = per; it is Proposition 6.7 with U = S.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/MainTheorems`, namespace `TauCeti.RealSurface`.

<a id="pi-7-real-closure-pointwise-triviality"></a>

### Vanishing at real closures implies vanishing at real points

`PI.7/real-closure-pointwise-triviality` · theorem

Let U be a smooth real surface and α ∈ Br(U)\[2]. If α vanishes at every real closure of ℝ(U), then α\_x = 0 for every x ∈ U(ℝ).

**Hypotheses and conventions.** α unramified on U.

**Proof.**

1. At x ∈ U(ℝ) choose local parameters z₁, z₂; completion gives ℝ(U) ⊂ Frac ℝ\[\[z₁, z₂]] ⊂ ℝ((z₁))((z₂)), a field ordered by the sign of the leading coefficient. Let K be a real closure of ℝ((z₁))((z₂)) at this ordering (PI.0/real-closure-at-ordering).
2. In Br(ℝ) → Br(ℝ\[\[z₁, z₂]]) → Br(K), the first map is an isomorphism with retraction given by restriction to x (henselian local rings, SchemeAndStackFoundations §2.22, `brauer_henselian_local`), and the composite is an isomorphism because both groups are generated by (−1, −1) (PI.0/real-closure-at-ordering); hence Br(ℝ\[\[z₁, z₂]]) → Br(K) is injective.
3. K itself is not algebraic over ℝ(U). The relative algebraic closure R₀ of ℝ(U) in K is real closed (an element of K algebraic over R₀ lies in R₀, so square roots of positive elements and roots of odd-degree polynomials over R₀ stay in R₀) and algebraic over ℝ(U), hence a real closure of ℝ(U) at the ordering induced from K. By hypothesis α\_{R₀} = 0, so α\_K = 0; by injectivity the restriction of α to ℝ\[\[z₁, z₂]] vanishes, and α\_x = 0.

**Acceptance.** For α = (−1, −1) pulled back to U, α does not vanish at real closures when U(ℝ) ≠ ∅, consistently: its images over R₀ and over K are both nonzero.

**Direct prerequisites:** [Real closure at a specified ordering](#pi-0-real-closure-at-ordering); [Real evaluation and the nonzero evaluation locus](#pi-1-real-evaluation-locus); SchemeAndStackFoundations §2.22 (`brauer_henselian_local`); `PowerSeries` (Mathlib); `IsRealClosed` (Mathlib).

**Source:** B19, Proof of Theorem 0.12, p. 96: For x ∈ U(ℝ), local parameters and a real closed extension of ℝ((z₁, z₂)) show that α vanishes at x, via Br(ℝ) → Br(ℝ\[\[z₁, z₂]]) → Br(K).

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/UInvariant`, namespace `TauCeti.RealSurface`.

<a id="pi-7-u-invariant-upper-bound"></a>

### The Elman–Lam invariant in transcendence degree two

`PI.7/u-invariant-upper-bound` · theorem

Let K be a field extension of ℝ of transcendence degree 2, not necessarily finitely generated. Then u(K) ≤ 4 (Elman–Lam invariant).

**Hypotheses and conventions.** trdeg\_ℝ K = 2.

**Proof.**

1. By PI.0/pfister-brauer-criterion it suffices that every nonzero α ∈ Br(K)\[2] vanishing at all real closures of K has index 2.
2. Choose a finitely generated K₀ ⊂ K containing a transcendence basis of K/ℝ and over which α is defined (so K/K₀ is algebraic; RealSurfacePeriodIndex/E9), write K as the union of the finite extensions K\_i of K₀, and α\_i ∈ Br(K\_i)\[2]. The sets Z\_i ⊂ X\_{K\_i} of orderings where α\_i survives are closed (PI.0/brauer-nonvanishing-locus) with empty limit, so some Z\_i is empty (PI.0/harrison-compact): replace K by K\_i.
3. Now K = ℝ(S) for an integral surface; let U be an open with α ∈ Br(U); α\_x = 0 for x ∈ U(ℝ) (PI.7/real-closure-pointwise-triviality), so ind(α) = 2 by PI.7/zero-evaluation-period-index (on the smooth locus).

**Acceptance.** u(ℝ(x, y)) ≤ 4, new before Benoist.

**Direct prerequisites:** [Pfister's criterion: index two implies u ≤ 4](#pi-0-pfister-brauer-criterion); [The locus where a Brauer class survives is clopen](#pi-0-brauer-nonvanishing-locus); [Compactness of the Harrison space and inverse limits](#pi-0-harrison-compact); [Vanishing at real closures implies vanishing at real points](#pi-7-real-closure-pointwise-triviality); [Period equals index for classes vanishing at real points](#pi-7-zero-evaluation-period-index).

**Source:** B19, Theorem 0.12, first assertion, p. 66; proof, pp. 95–96: u(K) ≤ 4 for every extension of ℝ of transcendence degree 2, by Pfister's criterion, compactness of orderings and Theorem 0.4.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/UInvariant`, namespace `TauCeti.RealSurface`.

<a id="pi-7-sharp-anisotropic-form"></a>

### A four-dimensional anisotropic zero-signature form

`PI.7/sharp-anisotropic-form` · construction

Let S be an integral surface over ℝ and x a smooth closed point with κ(x) ≅ ℂ. Let w ∈ O\_{S,x} lift √−1 and replace it by w′ = (w² − 1)/(2w), which again lifts √−1 and satisfies w′² + 1 = (w² + 1)²/(4w²) ∈ m\_x². For any regular system of parameters z₁, z₂ at x, y\_j = (1 + z\_j)² + (w′ + z\_j)² (j = 1, 2) is again a regular system of parameters, each y\_j is a sum of two squares (hence positive at every ordering), and q = ⟨1, y₁, −y₂, −y₁y₂⟩ has zero total signature and is anisotropic over ℝ(S).

**Hypotheses and conventions.** x smooth with residue field ℂ (exists on any integral surface over ℝ); the replacement of w is the corrected choice (RealSurfacePeriodIndex/E10).

**Construction.**

1. dy\_j = 2(1 + z\_j)dz\_j + 2(w′ + z\_j)(dw′ + dz\_j) ≡ 2(1 + i)dz\_j modulo m\_x and the differential of w′² + 1 ∈ m\_x², so y₁, y₂ are regular parameters.
2. Completion gives ℝ(S) ⊂ ℂ((y₁))((y₂)) (κ(x) = ℂ); by PI.0/springer-complete-dvr applied twice, q is anisotropic there, hence over ℝ(S) (anisotropy descends to subfields).
3. y\_j is a sum of two squares, so y\_j >\_P 0 at every ordering and sign\_P(q) = 1 + 1 − 1 − 1 = 0.

**Uses.** Benoist 2019, Theorem 0.12 second assertion: the lower bound u(ℝ(S)) ≥ 4. PI.7/u-invariant-equals-four: the witness form.

**API.**

- `RealSurface.sharpForm` (constructor): The form ⟨1, y₁, −y₂, −y₁y₂⟩ over ℝ(S) from (x, w, z₁, z₂).
- `RealSurface.sharpForm_regularParameters` (characterisation): y₁, y₂ is a regular system of parameters at x.
- `RealSurface.sharpForm_anisotropic` (other): sharpForm is anisotropic over ℝ(S).
- `RealSurface.sharpForm_zeroSignature` (other): sharpForm has zero signature at every ordering of ℝ(S).
- `RealSurface.sharpForm_lift_correction` (relation): w′ = (w² − 1)/(2w) lifts √−1 and w′² + 1 ∈ m\_x².

**Unit tests.**

- `RealSurface.sharpForm_affinePlane` (computation): On 𝔸²\_ℝ at the point (x² + 1, y), with w = x and z₁ = x² + 1, z₂ = y, the corrected w′ and the forms y\_j are explicit.
- `RealSurface.sharpForm_dimension` (degenerate): The form has dimension 4 and signature 0 at every ordering, so it witnesses u ≥ 4 and not more.
- `RealSurface.sharpForm_uncorrected_fails` (non-example): With w itself, dw² can be proportional to dz\_j and y₁, y₂ can fail to be regular parameters (the case the source's choice does not exclude).
- `RealSurface.sharpForm_baseChange` (compatibility): Anisotropy over ℂ((y₁))((y₂)) implies anisotropy over ℝ(S) by the contrapositive of QuadraticForm.not\_anisotropic\_baseChange.

**Acceptance.** For S = 𝔸² and x the closed point corresponding to (i, 0), the construction gives an explicit anisotropic form over ℝ(x, y).

**Direct prerequisites:** [Springer's theorem for complete discretely valued fields](#pi-0-springer-complete-dvr); [Signature of a quadratic form at an ordering](#pi-0-signature-at-ordering); `QuadraticMap.Anisotropic` (Mathlib); `QuadraticForm.not_anisotropic_baseChange` (Tau Ceti); `IsLocalRing.maximalIdeal` (Mathlib); `PowerSeries` (Mathlib).

**Source:** B19, Proof of Theorem 0.12, lower bound, p. 96: At a closed point with residue field ℂ, the y\_j built from a lift of √−1 are local parameters and ⟨1, y₁, −y₂, −y₁y₂⟩ is anisotropic over ℂ((y₁))((y₂)) by Springer, with y\_j totally positive.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/UInvariant`, namespace `TauCeti.RealSurface`.

<a id="pi-7-u-invariant-equals-four"></a>

### The u-invariant of a real surface function field is four

`PI.7/u-invariant-equals-four` · theorem

For every integral surface S over ℝ, u(ℝ(S)) = 4, including when S(ℝ) ≠ ∅.

**Hypotheses and conventions.** S integral of dimension 2 over ℝ.

**Proof.**

1. u ≤ 4 by PI.7/u-invariant-upper-bound; u ≥ 4 by PI.7/sharp-anisotropic-form and PI.0/elman-lam-u.

**Acceptance.** u(ℝ(x, y)) = 4.

**Direct prerequisites:** [The Elman–Lam invariant in transcendence degree two](#pi-7-u-invariant-upper-bound); [A four-dimensional anisotropic zero-signature form](#pi-7-sharp-anisotropic-form); [The Elman–Lam u-invariant](#pi-0-elman-lam-u).

**Source:** B19, Theorem 0.12, second assertion, p. 66; proof, p. 96: u(K) = 4 when K = ℝ(S).

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/UInvariant`, namespace `TauCeti.RealSurface`.

<a id="pi-7-rank-five-isotropy"></a>

### Quadratic forms of rank five over surfaces without real points

`PI.7/rank-five-isotropy` · theorem

Let S be an integral surface over ℝ with S(ℝ) = ∅. Every quadratic form of rank ≥ 5 over ℝ(S) is isotropic.

**Hypotheses and conventions.** S(ℝ) = ∅, so ℝ(S) is nonreal (no orderings) on a smooth projective model, and the Elman–Lam invariant is the classical one.

**Proof.**

1. ℝ(S) is nonreal: by the Artin–Lang theorem the function field of an integral real variety is real iff the variety has a smooth real point, and S has no real points at all.
2. By PI.0/elman-lam-u for nonreal fields and PI.7/u-invariant-upper-bound, every anisotropic form has dimension ≤ 4.

**Acceptance.** Over ℝ(x, y, z | x² + y² + z² = −1), ⟨1, 1, 1, 1, a⟩ is isotropic for every a.

**Direct prerequisites:** [The Elman–Lam invariant in transcendence degree two](#pi-7-u-invariant-upper-bound); [The Elman–Lam u-invariant](#pi-0-elman-lam-u); [The space of orderings with the Harrison topology](#pi-0-ordering-space).

**Source:** B19, Theorem 0.10, p. 66: All quadratic forms of rank ≥ 5 over ℝ(S) are isotropic when S(ℝ) = ∅; this is Lang's conjecture for i = 2, d = 2. BCR, §4.1, Artin–Lang homomorphism theorem (pp. 85–87): Orderings of function fields of real varieties are detected by real points.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/UInvariant`, namespace `TauCeti.RealSurface`.

<a id="pi-7-degree-four-del-pezzo-model"></a>

### Degree-four del Pezzo surfaces are intersections of two quadrics

`PI.7/degree-four-del-pezzo-model` · theorem

Let X be a del Pezzo surface of degree 4 over a field F (a smooth projective geometrically integral surface with ample anticanonical sheaf and K\_X² = 4). The anticanonical linear system embeds X in ℙ⁴\_F, and its image is a smooth complete intersection of two quadrics defined over F.

**Hypotheses and conventions.** F any field; del Pezzo surfaces and their degree as in VA13 Definition 1.5.

**Proof.**

1. h⁰(X, −mK\_X) = 1 + m(m + 1)d/2 for a del Pezzo surface of degree d (VA13 p. 9); with d = 4 this gives h⁰(−K\_X) = 5 and h⁰(−2K\_X) = 13.
2. For d ≥ 3 the anticanonical system is very ample and embeds X as a smooth surface of degree d in ℙ^d (VA13 Remark 1.11), not contained in a hyperplane.
3. Restriction H⁰(ℙ⁴, O(2)) → H⁰(X, −2K\_X) goes from a 15-dimensional space to a 13-dimensional one, so its kernel, defined over F, contains two independent quadrics Q₁, Q₂. Each Q\_i is irreducible, since X is irreducible and lies in no hyperplane, so Q₁ ∩ Q₂ is a complete intersection of pure dimension 2 and degree 4 containing X, which also has degree 4; it is therefore generically reduced along X and equal to X, a complete intersection having no embedded components.

**Acceptance.** Over ℂ, the surface {x₀² + ⋯ + x₄² = a₀x₀² + ⋯ + a₄x₄² = 0} with distinct a\_i is a degree-four del Pezzo surface. The count fails in degree 3: for a cubic surface h⁰(−2K) = 10 = h⁰(ℙ³, O(2)), and the surface lies on no quadric. A complete intersection of two quadrics in ℙ⁴ with a singular point is not a del Pezzo surface; smoothness is part of the conclusion, inherited from X.

**Source:** VA13, Definition 1.5, p. 4; anticanonical dimension formula, p. 9; Remark 1.11, p. 10: Del Pezzo surfaces and their degree; h⁰(−mK) = m(m + 1)d/2 + 1; for d ≥ 3 the anticanonical model is a smooth surface of degree d in ℙ^d.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/UInvariant`, namespace `TauCeti.RealSurface`.

<a id="pi-7-del-pezzo-point"></a>

### Degree-four del Pezzo surfaces over real curves without real points

`PI.7/del-pezzo-point` · theorem

Let C be an integral curve over ℝ with C(ℝ) = ∅. Every del Pezzo surface of degree 4 over ℝ(C) has an ℝ(C)-rational point.

**Hypotheses and conventions.** A degree-4 del Pezzo surface over a field F is a smooth complete intersection of two quadrics in ℙ⁴\_F by PI.7/degree-four-del-pezzo-model.

**Proof.**

1. Write the surface as {q₁ = q₂ = 0} ⊂ ℙ⁴ over F = ℝ(C) (PI.7/degree-four-del-pezzo-model).
2. F(t) = ℝ(C × ℙ¹) is the function field of an integral surface without real points, so q₁ + tq₂ (rank 5) is isotropic over F(t) by PI.7/rank-five-isotropy.
3. Amer–Brumer (PI.0/amer-brumer) gives a common nonzero zero of q₁, q₂ over F, a rational point.

**Acceptance.** When C is the anisotropic conic, this is equivalent to the real integral Hodge conjecture for 1-cycles on degree-4 del Pezzo fibrations over C (Benoist–Wittenberg II, Proposition 8.3).

**Direct prerequisites:** [Quadratic forms of rank five over surfaces without real points](#pi-7-rank-five-isotropy); [The Amer–Brumer theorem](#pi-0-amer-brumer); [Degree-four del Pezzo surfaces are intersections of two quadrics](#pi-7-degree-four-del-pezzo-model).

**Source:** B19, Theorem 0.13, p. 66: Every degree 4 del Pezzo surface over ℝ(C) with C(ℝ) = ∅ has a rational point, from Theorem 0.10 and the Amer–Brumer theorem.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/UInvariant`, namespace `TauCeti.RealSurface`.

## Layer PI.8: The obstruction to period equals index

The finite-flat open U₀ and Θ₀; the alternating double cover and branch multiplicities; the trace-quotient lift and the sign-corrected pullback lift; the circle double cover and its local monodromy correction; the correcting line bundle and algebraicity of the quotient component; Proposition 7.1 (even-degree splitting obstruction) and the obstruction half of Theorem 0.5 (ind = 2 per).

*Builds on:* RealSurfacePeriodIndex PI.0; RealSurfacePeriodIndex PI.1; RealSurfacePeriodIndex PI.2; AlgebraicTopologyPartII AT2.12/surface-loop-representatives (gap:at2-surface-loop-representatives); AlgebraicTopologyPartII AT2.14/equivariant-ext-stalk (gap:at2-equivariant-ext-stalk); AlgebraicTopologyPartII AT2.15/circle-extension (gap:at2-circle-extension); AlgebraicTopologyPartII AT2.15/corrected-integral-lift (gap:at2-corrected-integral-lift); AlgebraicTopologyPartII AT2.15/cyclic-reduction-degrees (gap:at2-cyclic-reduction-degrees); AlgebraicTopologyPartII AT2.15/permutation-quotient (gap:at2-permutation-quotient); AlgebraicTopologyPartII AT2.15/trace-quotient-lift (gap:at2-trace-quotient-lift); AlgebraicTopologyPartII AT2.15/trace-zero-operator (gap:at2-trace-zero-operator); ComplexComparisonPartII §C6.2; ComplexComparisonPartII §C6.3 (gap:real-artin-comparison); ModularCurves 4D; MotivesAndAlgebraicCycles §7.6b; MotivesAndAlgebraicCycles §7.8 (gap:picard-cokernel-torsion-free); PurityOfBranchLocus §2.3; ResolutionOfSingularitiesCharacteristicZero §7.8; SchemeAndStackFoundations §3.4; Tau Ceti roadmap `TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

<a id="pi-8-finite-flat-open"></a>

### The finite-flat open and the restricted evaluation locus

`PI.8/finite-flat-open` · definition

Let p : T → S be a generically finite morphism of connected smooth projective real surfaces of even degree n, α ∈ Br(ℝ(S))\[n] with p\*α = 0, U = U\_α and Θ = Θ(α). Let U₀ ⊂ U be the largest open over which p is finite flat with smooth branch locus Δ ∩ U₀; U ∖ U₀ is finite. Put Θ₀ = Θ ∩ U₀(ℝ). Then p(T(ℝ)) ∩ Θ = ∅, and Θ₀ is contained in the étale locus V of the alternating double cover (PI.8/alternating-double-cover).

**Hypotheses and conventions.** n even; p\*α = 0 in Br(ℝ(T)).

**Construction.**

1. If y ∈ T(ℝ) with p(y) ∈ Θ, then α\_{p(y)} = (p\*α)\_y = 0 after restricting to a real point, contradicting p(y) ∈ Θ (evaluation commutes with pullback; p\*α is unramified near y).
2. A finite-type map of smooth surfaces is flat where it is finite (miracle flatness, ModularCurves 4D), and the locus where the branch divisor is not smooth or p not finite is finite in U.
3. If x ∈ Δ\_i(ℝ) ∩ Θ₀ with m\_i odd, a general such x has geometric fibre of odd cardinality n − m\_i, so a real preimage, contradicting the first point; hence Θ₀ ⊂ V(ℝ).

**Uses.** Benoist 2019, §§7.2–7.5, pp. 97–104: the open U₀ on which the trace sequence lifts the Kummer class. PI.8/trace-quotient-lift-surface: the finite-flat locus V = U₀. PI.8/quotient-component-algebraicity: the restricted locus Θ₀.

**API.**

- `RealSurface.finiteFlatOpen` (data): U₀ ⊂ U, the largest open where p is finite flat with smooth branch locus.
- `RealSurface.finiteFlatOpen_compl_finite` (other): U ∖ U₀ is finite.
- `RealSurface.avoid_theta` (other): p(T(ℝ)) ∩ Θ = ∅.
- `RealSurface.restrictedTheta` (data): Θ₀ = Θ ∩ U₀(ℝ).
- `RealSurface.restrictedTheta_subset_etale` (other): Θ₀ ⊂ V(ℝ), V the étale locus of the alternating double cover.

**Unit tests.**

- `RealSurface.finiteFlatOpen_etale` (degenerate): If p is finite étale over U, U₀ = U and Θ₀ = Θ.
- `RealSurface.restrictedTheta_double_cover` (computation): For n = 2, V = S ∖ Δ, and Θ₀ ⊂ V(ℝ) says Θ₀ avoids Δ(ℝ), as it must since Δ(ℝ) ⊂ p(T(ℝ)).
- `RealSurface.finiteFlatOpen_not_all` (non-example): At an isolated point where p is not finite (a contracted curve), U₀ ≠ U.
- `RealSurface.restrictedTheta_dense` (compatibility): Θ₀ is dense in Θ and H¹(Θ) ↪ H¹(Θ₀) (PI.1/point-removal-extension).

**Acceptance.** If p is finite étale over U then U₀ = U and Θ₀ = Θ.

**Direct prerequisites:** [Real evaluation and the nonzero evaluation locus](#pi-1-real-evaluation-locus); [Unramified locus of a Brauer class](#pi-1-unramified-locus); ModularCurves 4D.

**Source:** B19, §7.1, p. 96; §7.2, p. 98: p(T(ℝ)) ∩ Θ = ∅; U₀ the largest open where p is finite flat with smooth ramification locus; Θ₀ = Θ ∩ U₀(ℝ) ⊂ V(ℝ).

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Obstruction`, namespace `TauCeti.RealSurface`.

<a id="pi-8-alternating-double-cover"></a>

### The alternating double cover and branch multiplicities

`PI.8/alternating-double-cover` · construction

For p : T → S as in PI.8/finite-flat-open with étale locus S\* (degree n), compose the monodromy π₁^ét(S\*) → 𝔖\_n with the sign to get a finite étale double cover Ŝ\* → S\*, independent of the numbering; its normalisation Ŝ → S is a finite double cover. For a branch component Δ\_i with geometric generic fibre F\_i put m\_i = n − |F\_i| = Σ\_{y ∈ F\_i}(e\_y − 1). The maximal open over which Ŝ → S is étale is V = S ∖ ⋃\_{m\_i odd} Δ\_i.

**Hypotheses and conventions.** Purity of the branch locus (Zariski–Nagata; PurityOfBranchLocus §2.3) for the normal double cover.

**Construction.**

1. The sign of the monodromy is a homomorphism to ℤ/2, giving the double cover; renumbering conjugates the monodromy and does not change the sign. Its topological class ê is read off through the étale–equivariant comparison in degree one (gap:real-artin-comparison); over ℂ, étale and topological covers correspond by ComplexComparisonPartII §C6.2 (`riemannExistence`).
2. Local monodromy around Δ\_i is a permutation with cycle type given by the ramification indices; it is odd iff m\_i is odd.
3. The branch locus of the normal double cover has pure codimension one, so V is as stated.

**Uses.** Benoist 2019, Lemma 7.6 and proof of Proposition 7.4, pp. 100–103: comparison with the circle double cover. PI.8/correcting-line-bundle: the line bundle attached to the alternating cover over V.

**API.**

- `RealSurface.alternatingCover` (data): The finite double cover Ŝ → S.
- `RealSurface.branchMultiplicity` (data): m\_i = n − |F\_i| for each branch component.
- `RealSurface.branchMultiplicity_eq_sum` (characterisation): m\_i = Σ\_{y ∈ F\_i}(e\_y − 1).
- `RealSurface.alternatingCover_etale_locus` (characterisation): Ŝ → S is étale exactly over S ∖ ⋃\_{m\_i odd} Δ\_i.
- `RealSurface.alternatingCover_class` (data): ê ∈ H¹\_G(V(ℂ), 𝔽₂), the class of the étale part.

**Unit tests.**

- `RealSurface.alternatingCover_degree_two` (degenerate): For n = 2 the sign 𝔖₂ → ℤ/2 is an isomorphism, so the alternating cover is p itself over S\* and V = S ∖ Δ.
- `RealSurface.branchMultiplicity_simple` (computation): For a simple branch point (one ramification point of index 2), m\_i = 1.
- `RealSurface.alternatingCover_even_branch` (non-example): If all m\_i are even, V = S even though p is ramified.
- `RealSurface.alternatingCover_sign` (compatibility): The monodromy of Ŝ\* is the composite of the monodromy of p with Equiv.Perm.sign.

**Acceptance.** For n = 2, m\_i = 1 for every branch component, and V = S ∖ Δ.

**Direct prerequisites:** [The finite-flat open and the restricted evaluation locus](#pi-8-finite-flat-open); ComplexComparisonPartII §C6.2 (`riemannExistence`); ComplexComparisonPartII §C6.3 (gap:real-artin-comparison); PurityOfBranchLocus §2.3; `Equiv.Perm.sign` (Mathlib).

**Source:** B19, §7.2, pp. 97–98: The alternating double cover from the signature of the monodromy, its normal extension, the multiplicities m\_i and the étale locus V = S ∖ ⋃\_{m\_i odd} Δ\_i.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Obstruction`, namespace `TauCeti.RealSurface`.

<a id="pi-8-trace-quotient-lift-surface"></a>

### Lifting the Kummer class through the trace sequence

`PI.8/trace-quotient-lift-surface` · theorem

In PI.8/finite-flat-open let α̃ ∈ H²\_G(U(ℂ), ℤ/n(1)) lift α in the Kummer sequence. Then α̃|\_{U₀} = η mod n − φ(ζ) for some η ∈ H²\_G(U₀(ℂ), ℤ(1)) and ζ ∈ H²\_G(U₀(ℂ), Q(1)), where Q = coker(ℤ → p\_\*ℤ) and φ : Q → ℤ/n is induced by the trace.

**Hypotheses and conventions.** p finite over U₀, so the Leray spectral sequence of T\_{U₀} → U₀ degenerates.

**Proof.**

1. The obstruction is the image of α̃|\_{U₀} in H³\_G(U₀(ℂ), p\_\*ℤ(1)) ≅ H³\_G(T\_{U₀}(ℂ), ℤ(1)).
2. Comparing the Kummer sequence with the trace sequence 0 → p\_\*ℤ → ℤ ⊕ Q → ℤ/n → 0, this image is the topological obstruction of p\*α|\_{U₀}, which vanishes since p\*α = 0.
3. Apply AlgebraicTopologyPartII AT2.15/trace-quotient-lift.

**Acceptance.** If α = 0 one can take η = ζ = 0.

**Direct prerequisites:** [The finite-flat open and the restricted evaluation locus](#pi-8-finite-flat-open); AlgebraicTopologyPartII AT2.15/trace-quotient-lift (gap:at2-trace-quotient-lift); AlgebraicTopologyPartII AT2.15/permutation-quotient (gap:at2-permutation-quotient); [Kummer and topological Brauer sequences](#pi-1-kummer-brauer-sequences).

**Source:** B19, Lemma 7.2 and proof, p. 98: α̃|\_{U₀} is the image under (1, −φ) of (η, ζ), because its boundary vanishes in H³\_G(T\_{U₀}(ℂ), ℤ(1)).

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Obstruction`, namespace `TauCeti.RealSurface`.

<a id="pi-8-corrected-pullback-lift"></a>

### The sign-corrected pullback lift

`PI.8/corrected-pullback-lift` · theorem

With η, ζ from PI.8/trace-quotient-lift-surface and ψ : Q → p\_\*ℤ the trace-zero operator, p\*α̃|\_{U₀} ∈ H²\_G(T\_{U₀}(ℂ), ℤ/n(1)) is the reduction modulo n of p\*η − ψ(ζ). (The published Lemma 7.3 and (7.13) have +ψ(ζ).)

**Hypotheses and conventions.** The minus sign matches the convention (1, −φ); equality of maps Q → p\_\*(ℤ/n) is checked on the target, which injects into j\_\*j\*.

**Proof.**

1. α̃ = η mod n − φ(ζ); p\*(η mod n) = (p\*η) mod n.
2. ψ mod n = p\*∘φ as maps Q → p\_\*(ℤ/n): they agree on étale stalks and p\_\*(ℤ/n) → j\_\*j\*p\_\*(ℤ/n) is injective (AlgebraicTopologyPartII AT2.15/trace-zero-operator); hence p\*φ(ζ) = ψ(ζ) mod n.
3. This is AlgebraicTopologyPartII AT2.15/corrected-integral-lift on the surface.

**Acceptance.** Tr(p\*η − ψ(ζ)) = nη, since Tr∘ψ = 0.

**Direct prerequisites:** [Lifting the Kummer class through the trace sequence](#pi-8-trace-quotient-lift-surface); AlgebraicTopologyPartII AT2.15/corrected-integral-lift (gap:at2-corrected-integral-lift); AlgebraicTopologyPartII AT2.15/trace-zero-operator (gap:at2-trace-zero-operator).

**Source:** B19, Lemma 7.3 and proof, pp. 98–99: p\*α̃ is the reduction of p\*η + ψ(ζ), via diagrams (7.3)–(7.4); the sign must be minus (RealSurfacePeriodIndex/E6) and the injectivity used concerns the target sheaf (RealSurfacePeriodIndex/E7).

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Obstruction`, namespace `TauCeti.RealSurface`.

<a id="pi-8-circle-double-cover"></a>

### The circle double cover attached to the quotient class

`PI.8/circle-double-cover` · construction

Let ι : 𝕊¹ → Θ₀ be a C^∞ embedding meeting the branch locus of p transversally at general points. On 𝕊¹ the permutation stalks of p\_\*ℤ are free ℤ\[G]-modules (no real sheets). The sheaf 𝒢 = coker\[(φ₂, 1 + σ) : ι\*Q(1) → 𝔽₂ ⊕ (ι\*Q(1))^G] sits in an exact sequence 0 → 𝔽₂ → 𝒢 → 𝔽₂ → 0 (AlgebraicTopologyPartII AT2.15/circle-extension), with stalks 𝔽₂² if 4 | n and ℤ/4 if n ≡ 2 mod 4. The elements of 𝒢 mapping to 1 form a double cover ρ̃ : 𝕊̃¹ → 𝕊¹ whose class ε̃ ∈ H¹(𝕊¹, 𝔽₂) is the boundary of 1, namely ι\*\[φ(ζ)]₁.

**Hypotheses and conventions.** n even; ι transverse to the branch locus (such embedded circles represent every class of H₁(Θ₀, 𝔽₂): AlgebraicTopologyPartII AT2.12/surface-loop-representatives); the input ζ has normalised degree-two component 1 because φ(ζ)|\_x = −α̃|\_x ≠ 0 at x ∈ 𝕊¹ ⊂ Θ.

**Construction.**

1. Ext stalks: (Ext^q\_G(ℤ, ι\*p\_\*ℤ))\_x = H^q(G, ℤ\[G]^k) = 0 for q > 0 (AlgebraicTopologyPartII AT2.14/equivariant-ext-stalk).
2. AT2.15/circle-extension gives exactness and identifies the boundary of 1 with the degree-one component of φζ; the degree-zero normalisation holds because η|\_x = 0 (H²(G, ℤ(1)) = 0) and α̃|\_x ≠ 0 on Θ.
3. The reduction from ℤ/n(1) to 𝔽₂ on the two twisted cyclic degrees is (id, n/2 mod 2) (AT2.15/cyclic-reduction-degrees), which gives the stalk computation and forbids treating both cases as split.

**Uses.** Benoist 2019, Lemma 7.6, p. 101: comparison with the alternating double cover. PI.8/circle-monodromy-correction: the class ε̃.

**API.**

- `RealSurface.circleSheaf` (data): 𝒢 on 𝕊¹ with 0 → 𝔽₂ → 𝒢 → 𝔽₂ → 0.
- `RealSurface.circleCover` (data): The double cover of 𝕊¹ given by the elements of 𝒢 over 1.
- `RealSurface.circleCover_class` (characterisation): Its class is ι\*\[φ(ζ)]₁ ∈ H¹(𝕊¹, 𝔽₂).
- `RealSurface.circleSheaf_stalk` (relation): Stalks are 𝔽₂² if 4 | n and ℤ/4 if n ≡ 2 mod 4.

**Unit tests.**

- `RealSurface.circleSheaf_stalk_two` (computation): For n = 2 every stalk of 𝒢 is ℤ/4.
- `RealSurface.circleSheaf_stalk_four` (computation): For n = 4 every stalk of 𝒢 is 𝔽₂ ⊕ 𝔽₂.
- `RealSurface.circleCover_trivial` (degenerate): If φ(ζ) has zero first component along 𝕊¹, the circle cover is trivial.
- `RealSurface.circleSheaf_not_split` (non-example): For n ≡ 2 mod 4 the extension 𝒢 is not split: its stalk ℤ/4 is not 𝔽₂².

**Acceptance.** For n = 2 the stalks are ℤ/4.

**Direct prerequisites:** [The sign-corrected pullback lift](#pi-8-corrected-pullback-lift); [The finite-flat open and the restricted evaluation locus](#pi-8-finite-flat-open); AlgebraicTopologyPartII AT2.15/circle-extension (gap:at2-circle-extension); AlgebraicTopologyPartII AT2.14/equivariant-ext-stalk (gap:at2-equivariant-ext-stalk); AlgebraicTopologyPartII AT2.15/cyclic-reduction-degrees (gap:at2-cyclic-reduction-degrees); AlgebraicTopologyPartII AT2.12/surface-loop-representatives (gap:at2-surface-loop-representatives).

**Source:** B19, (7.5)–(7.9) and Lemma 7.5, pp. 99–100: The sheaf 𝒢 on 𝕊¹, the exact sequence (7.6), and the identification of the boundary of 1 with ι\*\[φ(ζ)]₁; stalks 𝔽₂ ⊕ 𝔽₂ if 4 | n and ℤ/4 otherwise. B19, p. 100–101: The double cover of 𝕊¹ defined inside the étalé space of 𝒢.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Obstruction`, namespace `TauCeti.RealSurface`.

<a id="pi-8-circle-monodromy-correction"></a>

### Local monodromy correction of circle covers

`PI.8/circle-monodromy-correction` · theorem

In PI.8/circle-double-cover let ε̂ ∈ H¹(𝕊¹, 𝔽₂) be the class of the pullback of the alternating double cover ((ι\*ê)). Then ε̃ = ε̂ + Σ\_{4 ∤ m\_i} ι\*cl\_R(Δ\_i) in H¹(𝕊¹, 𝔽₂). On Θ₀ every m\_i met by 𝕊¹ is even, and the local discrepancy at a crossing with Δ\_i is m\_i/2 mod 2.

**Hypotheses and conventions.** ι meets the branch components at general points of Δ\_i(ℝ) ∩ Θ₀.

**Proof.**

1. Off the finitely many crossings, a canonical bijection χ\_x between the fibres of the two covers comes from orderings (a₁, …, a\_{n/2}, σa₁, …, σa\_{n/2}) of p⁻¹(x) up to even permutations and the functions equal to √−1 on the a\_j and 0 on the σa\_j.
2. At a crossing with Δ\_i, the monodromy of a small loop exchanges the a's with conjugates of the b's in a way whose two permutations have the same cycle type, odd iff 4 ∤ m\_i; so χ extends iff 4 | m\_i.
3. Each nonextending crossing contributes ι\*cl\_R(Δ\_i).

**Acceptance.** If no branch component meets 𝕊¹, ε̃ = ε̂.

**Direct prerequisites:** [The circle double cover attached to the quotient class](#pi-8-circle-double-cover); [The alternating double cover and branch multiplicities](#pi-8-alternating-double-cover); MotivesAndAlgebraicCycles §7.6b.

**Source:** B19, Lemma 7.6 and proof, pp. 101–102: ε̃ = ε̂ + Σ\_{4∤m\_i} ι\*cl\_R(Δ\_i), by a canonical isomorphism off branch points extending through a crossing iff 4 | m\_i.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Obstruction`, namespace `TauCeti.RealSurface`.

<a id="pi-8-correcting-line-bundle"></a>

### The line bundle correcting the obstruction

`PI.8/correcting-line-bundle` · construction

Let ê ∈ H¹\_G(V(ℂ), 𝔽₂) be the class of the alternating double cover over V. By PI.1/two-torsion-line-bundle-class there is ϕ ∈ Pic(S) with \[ê]₁ = cl\_R(ϕ)|\_{V(ℝ)}; put θ = ϕ ⊗ O(Σ\_{4 ∤ m\_i} Δ\_i) ∈ Pic(S).

**Hypotheses and conventions.** Pic(S) → Pic(V) onto (PI.1/point-removal-extension); υ(ê) ∈ Pic(V)\[2] extended to S.

**Construction.**

1. cl\_R(υ(ê)) = \[ê]₁ (PI.1/two-torsion-line-bundle-class); extend υ(ê) to ϕ on S (SchemeAndStackFoundations §3.4).
2. Add the branch components with 4 ∤ m\_i.

**Uses.** Benoist 2019, Proposition 7.4, p. 99: θ ∈ Pic(S) with \[φ(ζ)]₁ = cl\_R(θ) on Θ₀. PI.8/quotient-component-algebraicity: the line bundle θ.

**API.**

- `RealSurface.correctingBundle` (constructor): θ = ϕ ⊗ O(Σ\_{4∤m\_i} Δ\_i).
- `RealSurface.correctingBundle_realClass` (relation): cl\_R(θ)|\_{V(ℝ)} = \[ê]₁ + Σ\_{4∤m\_i} cl\_R(Δ\_i)|\_{V(ℝ)}.
- `RealSurface.correctingBundle_ext` (other): ϕ restricts to υ(ê) on V.

**Unit tests.**

- `RealSurface.correctingBundle_unramified` (degenerate): If p is étale (no Δ\_i) and the alternating cover is trivial, θ = O\_S.
- `RealSurface.correctingBundle_simple_branch` (computation): For a branch component with m\_i = 2, 4 ∤ m\_i and Δ\_i contributes to θ.
- `RealSurface.correctingBundle_multiple_four` (non-example): A component with m\_i = 4 does not contribute, although it is in the branch locus.
- `RealSurface.correctingBundle_lemma21` (compatibility): cl\_R(υ(ê)) = \[ê]₁ is PI.1/two-torsion-line-bundle-class (Lemma 2.1 of the source).

**Acceptance.** For n = 2 the alternating cover is p itself over S\*, every m\_i equals 1, and every branch component contributes to θ.

**Direct prerequisites:** [The alternating double cover and branch multiplicities](#pi-8-alternating-double-cover); [Removing finitely many points and extending line bundles](#pi-1-point-removal-extension); [The real class of a two-torsion line bundle](#pi-1-two-torsion-line-bundle-class); SchemeAndStackFoundations §3.4.

**Source:** B19, Proof of Proposition 7.4, pp. 102–103: Choice of ϕ with \[ê]₁ = cl\_R(ϕ)|\_V and the identity (7.11).

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Obstruction`, namespace `TauCeti.RealSurface`.

<a id="pi-8-quotient-component-algebraicity"></a>

### Algebraicity of the quotient component

`PI.8/quotient-component-algebraicity` · theorem

In PI.8/trace-quotient-lift-surface, \[φ(ζ)]₁|\_{Θ₀} = cl\_R(θ)|\_{Θ₀} in H¹(Θ₀, 𝔽₂) for the θ ∈ Pic(S) of PI.8/correcting-line-bundle (brackets include reduction modulo 2).

**Hypotheses and conventions.** The setting of §7: n even, p\*α = 0.

**Proof.**

1. H¹(Θ₀, 𝔽₂) is detected by smooth embedded circles transverse to the branch locus at general points (AlgebraicTopologyPartII AT2.12/surface-loop-representatives and duality).
2. For each such ι, ι\*\[φ(ζ)]₁ = ε̃ (PI.8/circle-double-cover) = ε̂ + Σ\_{4∤m\_i} ι\*cl\_R(Δ\_i) (PI.8/circle-monodromy-correction), and ε̂ = ι\*\[ê]₁ = ι\*cl\_R(ϕ).

**Acceptance.** If α evaluates to 0 everywhere, Θ₀ = ∅ and the statement is empty.

**Direct prerequisites:** [The circle double cover attached to the quotient class](#pi-8-circle-double-cover); [Local monodromy correction of circle covers](#pi-8-circle-monodromy-correction); [The line bundle correcting the obstruction](#pi-8-correcting-line-bundle); AlgebraicTopologyPartII AT2.12/surface-loop-representatives (gap:at2-surface-loop-representatives); Tau Ceti roadmap `TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Source:** B19, Proposition 7.4 and proof, pp. 99, 102–103: \[φ(ζ)]₁ = cl\_R(θ) on Θ₀ for some θ ∈ Pic(S), tested on circles through Lemmas 7.5–7.6.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Obstruction`, namespace `TauCeti.RealSurface`.

<a id="pi-8-even-degree-splitting-obstruction"></a>

### Obstruction to splitting by an even-degree cover

`PI.8/even-degree-splitting-obstruction` · theorem

Let p : T → S be a generically finite morphism of even degree n between connected smooth projective real surfaces, α ∈ Br(ℝ(S))\[n] with p\*α = 0, U = U\_α, Θ = Θ(α), α̃ ∈ H²\_G(U(ℂ), ℤ/n(1)) a Kummer lift and ξ its reduction modulo 2. Then \[ξ]₁|\_Θ = cl\_R(ν)|\_Θ for some ν ∈ Pic(S).

**Hypotheses and conventions.** n even.

**Proof.**

1. PI.8/corrected-pullback-lift: p\*α̃|\_{U₀} = (p\*η − ψ(ζ)) mod n; p\*α|\_{U₀} = 0 gives p\*η − ψ(ζ) = nγ + cl(ϕ) on T\_{U₀} (real topological Brauer sequence, PI.1/kummer-brauer-sequences).
2. Push forward: p\_\*ψ(ζ) = 0, so n(η − p\_\*γ) = cl(p\_\*ϕ); torsion-freeness of the cokernel of cl on Pic(U₀) (gap:picard-cokernel-torsion-free) and extension to S give μ with η − p\_\*γ = cl(μ|\_{U₀}), hence \[η]₁ − p\_\*\[γ]₁ = cl\_R(μ) on U₀(ℝ).
3. p\_\*\[γ]₁ vanishes on Θ₀ (no real preimages); with PI.8/quotient-component-algebraicity, \[ξ]₁ = \[η]₁ + \[φ(ζ)]₁ = cl\_R(μ + θ) on Θ₀.
4. H¹(Θ) → H¹(Θ₀) is injective (PI.1/point-removal-extension), so the identity holds on Θ.

**Acceptance.** If T(ℝ) = ∅ and Θ = S(ℝ), the conclusion says \[ξ]₁ is algebraic on all of S(ℝ).

**Direct prerequisites:** [The sign-corrected pullback lift](#pi-8-corrected-pullback-lift); [Algebraicity of the quotient component](#pi-8-quotient-component-algebraicity); [The finite-flat open and the restricted evaluation locus](#pi-8-finite-flat-open); [Removing finitely many points and extending line bundles](#pi-1-point-removal-extension); [Kummer and topological Brauer sequences](#pi-1-kummer-brauer-sequences); MotivesAndAlgebraicCycles §7.8 (gap:picard-cokernel-torsion-free); MotivesAndAlgebraicCycles §7.6b.

**Source:** B19, Proposition 7.1, p. 96; proof §7.5, pp. 103–104: If p\*α = 0 for an even-degree p then \[ξ]₁|\_Θ = cl\_R(ν)|\_Θ, by Lemma 7.3, pushforward, primitivity of the Picard image and Proposition 7.4.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Obstruction`, namespace `TauCeti.RealSurface`.

<a id="pi-8-unramified-index-doubling"></a>

### Unramified classes: the obstruction half of Theorem 0.5

`PI.8/unramified-index-doubling` · theorem

Let S be a connected smooth projective surface over ℝ and α ∈ Br(S) of even period n. If no lift ξ ∈ H²\_G(S(ℂ), 𝔽₂) of (n/2)α satisfies \[ξ]₁|\_Θ = 0, then ind(α) = 2n.

**Hypotheses and conventions.** α unramified on S; the criterion is existential in the lift.

**Proof.**

1. ind(α) ∈ {n, 2n} (PI.2/real-closed-norm-bound). Suppose ind(α) = n: take a degree-n splitting field L of ℝ(S) (PI.0/brauer-period-index), the normalisation N of S in L (finite over S), and a resolution T → N with T smooth projective and connected (ResolutionOfSingularitiesCharacteristicZero §7.8, `resolution_field`); p : T → S is generically finite of degree n.
2. Let α̃ ∈ H²\_G(S(ℂ), ℤ/n(1)) lift α; its reduction ξ lifts (n/2)α, and PI.8/even-degree-splitting-obstruction gives ν with \[ξ]₁|\_Θ = cl\_R(ν)|\_Θ.
3. ξ′ = ξ − (cl(ν) mod 2) is another lift of (n/2)α with \[ξ′]₁|\_Θ = 0 (compatibility of cl and cl\_R, MotivesAndAlgebraicCycles §7.6b), contradicting the hypothesis.

**Acceptance.** Period-4 classes on real Enriques surfaces have index 4 (PI.9/enriques-period-four), consistent with this dichotomy.

**Direct prerequisites:** [Obstruction to splitting by an even-degree cover](#pi-8-even-degree-splitting-obstruction); [Norm bound over a real closed field](#pi-2-real-closed-norm-bound); ResolutionOfSingularitiesCharacteristicZero §7.8 (`resolution_field`); [Period and index of a Brauer class](#pi-0-brauer-period-index); MotivesAndAlgebraicCycles §7.6b.

**Source:** B19, Theorem 0.5, second statement, p. 64; proof, p. 104: If ind(α) = n then a degree-n splitting cover gives a lift with vanishing first component on Θ; otherwise ind(α) = 2n.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/MainTheorems`, namespace `TauCeti.RealSurface`.

## Layer PI.9: Real Enriques surfaces and the Puiseux counterexample

The image of the first two real components (Proposition 8.1); real Enriques surfaces and their halves, the Brauer group killed by 4, period-four classes, w₁² = 0, the half detector, and Theorem 0.6; real closedness of the Puiseux field, the sextic double plane and its K3 resolution with four sphere components, a class evaluating to zero on exactly one component, the quaternion sign contradiction, and Proposition 0.7.

*Builds on:* RealSurfacePeriodIndex PI.0; RealSurfacePeriodIndex PI.1; RealSurfacePeriodIndex PI.2; RealSurfacePeriodIndex PI.7; RealSurfacePeriodIndex PI.8; AlgebraicTopologyPartII AT2.10/corrected-localization (gap:at2-corrected-localization); AlgebraicTopologyPartII AT2.10/localization-self-dual (gap:at2-localization-self-dual); AlgebraicTopologyPartII AT2.12/gamma-stiefel-whitney (gap:at2-gamma-stiefel-whitney); AlgebraicTopologyPartII AT2.9/gamma-class (gap:at2-gamma-class); AlgebraicTopologyPartII AT2.9/mod-two-splitting (gap:at2-mod-two-splitting); EnriquesSurfaces E1a; EnriquesSurfaces E1c; EnriquesSurfaces E1d; FormalLaurentPuiseux L4; MotivesAndAlgebraicCycles §7.10; MotivesAndAlgebraicCycles §7.6a; MotivesAndAlgebraicCycles §7.6b; RealAlgebraicGeometry Layer 1; SchemeAndStackFoundations §5.10; Tau Ceti roadmap `TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; Tau Ceti roadmap `TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`; WeilConjectures WC.7.

<a id="pi-9-real-locus-image"></a>

### Image of the first two real components

`PI.9/real-locus-image` · theorem

Let S be a connected smooth projective surface over ℝ with total Stiefel–Whitney class w = (w\_i) of S(ℝ). The image of ρ : H²\_G(S(ℂ), 𝔽₂) → H⁰(S(ℝ)) ⊕ H¹(S(ℝ)), restriction followed by the canonical decomposition and projection, is the set of (a₀, a₁) with deg(\[δ]₁ ∪ (a₁ + a₀ ∪ w₁)) = 0 for every δ ∈ H¹\_G(S(ℂ), 𝔽₂) with \[δ]₀ = 0.

**Hypotheses and conventions.** 𝔽₂ coefficients; deg the mod-2 degree on H²(S(ℝ)).

**Proof.**

1. The localisation sequence with supports on S(ℝ) is canonically split (AlgebraicTopologyPartII AT2.9/mod-two-splitting), giving H²\_G = H²\_{G,S(ℝ)} ⊕ H²\_G(S(ℂ) ∖ S(ℝ)).
2. Equivariant purity identifies H²\_{G,S(ℝ)} with H⁰(S(ℝ)), and its image under ρ is {(a₀, a₀ ∪ w₁)}, since the self-intersection class γ is the total Stiefel–Whitney class (AT2.9/gamma-class, AT2.12/gamma-stiefel-whitney).
3. The image of the complement factor is {(0, a₁)} with a₁ orthogonal to all \[δ]₁ with \[δ]₀ = 0, by the self-duality of the corrected localisation sequence (AT2.10/localization-self-dual).

**Acceptance.** If S(ℝ) = ∅ the image is 0.

**Direct prerequisites:** AlgebraicTopologyPartII AT2.9/mod-two-splitting (gap:at2-mod-two-splitting); AlgebraicTopologyPartII AT2.9/gamma-class (gap:at2-gamma-class); AlgebraicTopologyPartII AT2.12/gamma-stiefel-whitney (gap:at2-gamma-stiefel-whitney); AlgebraicTopologyPartII AT2.10/localization-self-dual (gap:at2-localization-self-dual); AlgebraicTopologyPartII AT2.10/corrected-localization (gap:at2-corrected-localization); MotivesAndAlgebraicCycles §7.6b; Tau Ceti roadmap `TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Source:** B19, Proposition 8.1 and proof, pp. 105–106: Description of the image of ρ through the split localisation sequence, equivariant purity, γ = w and the duality theorem of Benoist–Wittenberg. BW20, Proposition 1.3, Definition 1.4, Remark 1.6(i), Theorem 1.12: Canonical splitting, the class γ, its identification with w and the duality theorem.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Enriques`, namespace `TauCeti.RealSurface`.

<a id="pi-9-real-enriques-halves"></a>

### Real Enriques surfaces and their two halves

`PI.9/real-enriques-halves` · definition

A real Enriques surface is a smooth projective geometrically connected surface S over ℝ with S\_ℂ an Enriques surface (WeilConjectures WC.7, `IsEnriques` with `enriques_characterization`; in characteristic 0 this is the classical condition h¹(O) = 0 with K of order 2 used in EnriquesSurfaces E1a). The two lifts of K\_S ∈ Pic(S)\[2] in H¹\_ét(S, μ₂) ≅ H¹\_G(S(ℂ), 𝔽₂) define the two real forms Y₁, Y₂ → S of the canonical K3 double cover; their real images are the halves S₁, S₂ of S, open and closed with S(ℝ) = S₁ ⊔ S₂, either of which may be empty.

**Hypotheses and conventions.** The canonical cover is the connected étale K3 double cover (EnriquesSurfaces E1a). The two lifts differ by the constant class of ℝˣ/ℝˣ² in the degree-one Kummer sequence 0 → ℝˣ/ℝˣ² → H¹\_G(S(ℂ), 𝔽₂) → Pic(S)\[2] → 0.

**Construction.**

1. Pic(S) → Pic(S\_ℂ) is injective (Hilbert 90 for H¹(G, ℂˣ)), Pic(S\_ℂ)\[2] = {0, K}, the kernel of Pic → Num being {O, K} and Num torsion-free (EnriquesSurfaces E1a), and K\_S is defined over ℝ, so Pic(S)\[2] = {0, K\_S}.
2. Each lift is a finite étale double cover, a real form of the canonical cover; a real point x of S lifts to exactly one of the two forms, which defines the partition of S(ℝ).

**Uses.** Benoist 2019, Theorem 0.6, p. 65: the case distinction 'exactly one half nonempty'. PI.9/enriques-half-detector: the class δ with \[δ]₀ = 0. PI.9/real-enriques-criterion: the statement of the criterion.

**API.**

- `RealSurface.IsRealEnriques` (data): S/ℝ smooth projective geometrically connected with S\_ℂ Enriques.
- `RealSurface.enriquesHalf` (data): The halves S₁, S₂ ⊂ S(ℝ).
- `RealSurface.enriquesHalf_partition` (characterisation): S(ℝ) = S₁ ⊔ S₂ with both open and closed.
- `RealSurface.enriquesHalf_swap` (relation): Changing the lift of K\_S by the constant class exchanges the halves.
- `RealSurface.canonical_torsion` (other): Pic(S)\[2] = {0, K\_S}.

**Unit tests.**

- `RealSurface.enriquesHalf_empty` (degenerate): If S(ℝ) = ∅ both halves are empty.
- `RealSurface.enriquesHalf_union` (characterisation): Every real point lies in exactly one half.
- `RealSurface.enriquesHalf_not_components` (non-example): The halves are unions of components but need not be single components.
- `RealSurface.isRealEnriques_compat` (compatibility): IsRealEnriques S iff WeilConjectures' IsEnriques holds for S over ℝ (`enriques_baseChange`).

**Acceptance.** If S(ℝ) = ∅ both halves are empty. Each half is a union of components of S(ℝ).

**Direct prerequisites:** WeilConjectures WC.7 (`IsEnriques`); EnriquesSurfaces E1a; [Kummer and topological Brauer sequences](#pi-1-kummer-brauer-sequences).

**Source:** B19, §0.3, p. 64; §8.1, p. 106: The canonical decomposition S(ℝ) = S₁ ⊔ S₂ into halves, from the two preimages of K\_S in H¹\_ét(S, ℤ/2), following Degtyarev–Kharlamov. DK96, §1.3 (not read; cited at Benoist's locator): Halves of a real Enriques surface.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Enriques`, namespace `TauCeti.RealSurface`.

<a id="pi-9-enriques-complex-brauer"></a>

### The Brauer group of a real Enriques surface is killed by four

`PI.9/enriques-complex-brauer` · theorem

For a real Enriques surface S, H²(S, O\_S) = 0 and H³(S(ℂ), ℤ)\_tors ≅ ℤ/2, so Br(S\_ℂ) ≅ ℤ/2 by the complex topological Brauer sequence; restriction and corestriction to S\_ℂ show that Br(S) is killed by 4.

**Hypotheses and conventions.** Enriques invariants from EnriquesSurfaces E1a, E1c and E1d: H²(O) = 0, c₁ : Pic(S\_ℂ) ≅ H²(S(ℂ), ℤ), π₁(S(ℂ)) = ℤ/2.

**Proof.**

1. H²(O) = 0 (EnriquesSurfaces E1a) and c₁ : Pic(S\_ℂ) ≅ H²(S(ℂ), ℤ) (EnriquesSurfaces E1c), so the complex topological Brauer sequence (PI.1/kummer-brauer-sequences) gives Br(S\_ℂ) ≅ H³(S(ℂ), ℤ)\_tors, which is ℤ/2 by Poincaré duality H³ ≅ H₁ and π₁ = ℤ/2 (EnriquesSurfaces E1d).
2. For α ∈ Br(S) ⊂ Br(ℝ(S)), cor(res α) = 2α for the quadratic extension ℂ(S)/ℝ(S) (PI.0/brauer-corestriction) and res α ∈ Br(S\_ℂ) is killed by 2, so 4α = 0.

**Acceptance.** Br(S\_ℂ) has exactly two elements.

**Direct prerequisites:** [Real Enriques surfaces and their two halves](#pi-9-real-enriques-halves); EnriquesSurfaces E1a; EnriquesSurfaces E1c; EnriquesSurfaces E1d; [Kummer and topological Brauer sequences](#pi-1-kummer-brauer-sequences); [Corestriction of Brauer classes](#pi-0-brauer-corestriction).

**Source:** B19, Proof of Theorem 0.6, p. 106: Br(S\_ℂ) ≅ H³(S(ℂ), ℤ)\_tors = ℤ/2 by (1.2), so Br(S) is 4-torsion; Mangolte–van Hamel compute it precisely.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Enriques`, namespace `TauCeti.RealSurface`.

<a id="pi-9-enriques-period-four"></a>

### Period-four classes on real Enriques surfaces

`PI.9/enriques-period-four` · theorem

If α ∈ Br(S) has period 4 on a real Enriques surface S, then ind(α) = 4.

**Hypotheses and conventions.** S real Enriques.

**Proof.**

1. α\_ℂ has period 2 (Br(S\_ℂ) ≅ ℤ/2), so index 2 by PI.2/de-jong-period-index.
2. ind(α) divides 2·ind(α\_ℂ) = 4 and is divisible by per(α) = 4.

**Acceptance.** Classes of period 4 exist on some real Enriques surfaces (Mangolte–van Hamel).

**Direct prerequisites:** [The Brauer group of a real Enriques surface is killed by four](#pi-9-enriques-complex-brauer); [De Jong's period-index theorem in characteristic zero](#pi-2-de-jong-period-index); [Period and index of a Brauer class](#pi-0-brauer-period-index).

**Source:** B19, Proof of Theorem 0.6, p. 106: A period-4 class has α\_ℂ of period and index 2, hence index 4.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Enriques`, namespace `TauCeti.RealSurface`.

<a id="pi-9-enriques-half-detector"></a>

### Detecting an empty half

`PI.9/enriques-half-detector` · theorem

Let S be a real Enriques surface with S(ℝ) ≠ ∅. In 0 → ℝˣ/ℝˣ² → H¹\_G(S(ℂ), 𝔽₂) → Pic(S)\[2] → 0 the constant nonzero class has degree-zero component 1. A nonzero δ ∈ H¹\_G(S(ℂ), 𝔽₂) with \[δ]₀ = 0 exists iff exactly one half of S is empty; it is then unique, and \[δ]₁ = cl\_R(K\_S) = w₁(S(ℝ)).

**Hypotheses and conventions.** S(ℝ) ≠ ∅ (if S(ℝ) = ∅ all three nonzero classes have zero restriction and uniqueness fails).

**Proof.**

1. H¹\_G has four elements: 0, the constant class c (with \[c]₀ = 1 on S(ℝ)), and the two lifts of K\_S; \[·]₀ of a lift of K\_S is the indicator of the complement of its half.
2. A lift with \[δ]₀ = 0 exists iff its half is all of S(ℝ), that is iff the other half is empty; it is unique since the two lifts differ by c.
3. \[δ]₁ = cl\_R(υ(δ)) = cl\_R(K\_S) (PI.1/two-torsion-line-bundle-class) and cl\_R(K\_S) = w₁ (Kahn's theorem, MotivesAndAlgebraicCycles §7.10).

**Acceptance.** If both halves are nonempty, no such δ exists.

**Direct prerequisites:** [Real Enriques surfaces and their two halves](#pi-9-real-enriques-halves); [The real class of a two-torsion line bundle](#pi-1-two-torsion-line-bundle-class); MotivesAndAlgebraicCycles §7.10; [Kummer and topological Brauer sequences](#pi-1-kummer-brauer-sequences).

**Source:** B19, Proof of Theorem 0.6, pp. 106–107: The degree-one Kummer sequence, the two preimages of K\_S, and \[δ]₁ = cl\_R(K\_S) = w₁ by Lemma 2.1 and Kahn's theorem; uniqueness of the nonzero δ (RealSurfacePeriodIndex/E15).

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Enriques`, namespace `TauCeti.RealSurface`.

<a id="pi-9-enriques-orientable-case"></a>

### Orientable or empty real locus

`PI.9/enriques-orientable-case` · theorem

If S is a real Enriques surface with S(ℝ) empty or orientable, every α ∈ Br(S) has ind(α) = per(α).

**Hypotheses and conventions.** S real Enriques.

**Proof.**

1. S(ℝ) = ∅: PI.7/no-real-points-period-index.
2. Br(S) is killed by 4 (PI.9/enriques-complex-brauer); classes of period 4 have index 4 (PI.9/enriques-period-four).
3. For α of period 2 and any lift α̃, cl\_R is onto when S(ℝ) is orientable (MotivesAndAlgebraicCycles §7.10), so \[α̃]₁ = cl\_R(θ) = \[cl(θ)]₁ (MotivesAndAlgebraicCycles §7.6b) and α̃ − (cl(θ) mod 2) is a lift with zero first component; PI.7/unramified-odd-or-vanishing gives index 2.

**Acceptance.** Real Enriques surfaces whose real locus is a union of spheres and tori satisfy period = index for all unramified classes.

**Direct prerequisites:** MotivesAndAlgebraicCycles §7.10; MotivesAndAlgebraicCycles §7.6b; [Period-four classes on real Enriques surfaces](#pi-9-enriques-period-four); [Unramified classes: the sufficient half of Theorem 0.5](#pi-7-unramified-odd-or-vanishing); [Period equals index on real surfaces without real points](#pi-7-no-real-points-period-index).

**Source:** B19, Proof of Theorem 0.6, p. 106: If S(ℝ) is empty or orientable, every period-2 class has a lift with \[α̃]₁ = 0, so index 2.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Enriques`, namespace `TauCeti.RealSurface`.

<a id="pi-9-enriques-two-halves"></a>

### Two nonempty halves and a nonorientable real locus

`PI.9/enriques-two-halves` · theorem

If S(ℝ) is nonorientable and both halves of S are nonempty, there is α ∈ Br(S) of period 2 and index 4.

**Hypotheses and conventions.** S real Enriques; both halves nonempty; w₁ ≠ 0.

**Proof.**

1. No nonzero δ with \[δ]₀ = 0 exists (PI.9/enriques-half-detector), so by PI.9/real-locus-image every (1, a₁) is in the image of ρ; choose a₁ ∉ im cl\_R (cl\_R is not onto since w₁ ≠ 0, MotivesAndAlgebraicCycles §7.10).
2. The induced α has Θ = S(ℝ) and no lift with zero first component: lifts differ by Picard classes, whose components are cl\_R; PI.8/unramified-index-doubling gives index 4.

**Acceptance.** Such surfaces exist (Degtyarev–Itenberg–Kharlamov classification).

**Direct prerequisites:** [Detecting an empty half](#pi-9-enriques-half-detector); [Image of the first two real components](#pi-9-real-locus-image); MotivesAndAlgebraicCycles §7.10; [Unramified classes: the obstruction half of Theorem 0.5](#pi-8-unramified-index-doubling).

**Source:** B19, Proof of Theorem 0.6, pp. 106–107: When both halves are nonempty, Proposition 8.1 gives a lift with \[α̃]₀ = 1 and \[α̃]₁ outside im cl\_R; its class has index 4.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Enriques`, namespace `TauCeti.RealSurface`.

<a id="pi-9-enriques-w1-square"></a>

### The square of w₁ on a real Enriques surface

`PI.9/enriques-w1-square` · theorem

Let S be a real Enriques surface. Then deg(w₁(S(ℝ)) ∪ w₁(S(ℝ))) = 0 in 𝔽₂; equivalently, S(ℝ) has an even number of connected components of odd Euler characteristic.

**Hypotheses and conventions.** S real Enriques (PI.9/real-enriques-halves); for S(ℝ) = ∅ both sides vanish.

**Proof.**

1. w₁(S(ℝ)) = cl\_R(K\_S) (MotivesAndAlgebraicCycles §7.10, Kahn's theorem).
2. The image of cl\_R : Pic(S) → H¹(S(ℝ), 𝔽₂) is the orthogonal complement of w₁ (MotivesAndAlgebraicCycles §7.10; MVH98 Theorem 4.4); as K\_S ∈ Pic(S), w₁ is orthogonal to itself.
3. On each component Σ, deg(w₁(Σ)²) ≡ χ(Σ) mod 2 (AlgebraicTopologyPartII AT2.12/gamma-stiefel-whitney), so deg(w₁²) is the number of components of odd Euler characteristic modulo 2.

**Acceptance.** If S(ℝ) = ∅ the statement is empty. A real locus ℝℙ² ⊔ ℝℙ² has two components of Euler characteristic 1 and is not excluded; a real locus with a single ℝℙ² component, or any odd number of components of odd Euler characteristic, cannot occur. Two Klein bottles: χ = 0 for both, and deg(w₁²) = 0 although w₁ ≠ 0.

**Direct prerequisites:** [Real Enriques surfaces and their two halves](#pi-9-real-enriques-halves); MotivesAndAlgebraicCycles §7.10; AlgebraicTopologyPartII AT2.12/gamma-stiefel-whitney (gap:at2-gamma-stiefel-whitney).

**Source:** MVH98, Theorem 4.4 and proof of Proposition 4.2, p. 12 (arXiv v1): A class of H₁(Y(ℝ), ℤ/2) is algebraic iff its cap product with w₁ has degree 0; the canonical class has real component w₁ and lies in the image. B19, Theorem 0.6 and proof, pp. 65, 107: The case of one nonempty half with an odd number of odd-Euler components, which this target shows to be empty (E25).

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Enriques`, namespace `TauCeti.RealSurface`.

<a id="pi-9-enriques-one-half"></a>

### One nonempty half

`PI.9/enriques-one-half` · theorem

If exactly one half of the real Enriques surface S is nonempty, every period-2 class α ∈ Br(S) has index 2.

**Hypotheses and conventions.** S real Enriques with exactly one half nonempty, so S(ℝ) ≠ ∅; deg(w₁²) = 0 holds automatically (PI.9/enriques-w1-square).

**Proof.**

1. For a lift α̃ and the unique nonzero δ of PI.9/enriques-half-detector (\[δ]₀ = 0, \[δ]₁ = w₁), PI.9/real-locus-image gives deg(\[α̃]₁ ∪ w₁ + \[α̃]₀ ∪ w₁²) = 0.
2. If deg(\[α̃]₁ ∪ w₁) = 0 take a = \[α̃]₁. Otherwise deg(\[α̃]₀ ∪ w₁²) = 1, so Θ = Θ(α) contains an odd number of components of odd Euler characteristic; as their total number is even (PI.9/enriques-w1-square), some component Σ of odd Euler characteristic lies outside Θ, and a = \[α̃]₁ + w₁(Σ) on Σ, a = \[α̃]₁ elsewhere, has deg(a ∪ w₁) = 1 + χ(Σ) = 0 and agrees with \[α̃]₁ on Θ.
3. deg(a ∪ w₁) = 0, so a = cl\_R(θ) for some θ ∈ Pic(S) (MotivesAndAlgebraicCycles §7.10); subtracting cl(θ) mod 2 gives a lift whose first component vanishes on Θ, and PI.7/unramified-odd-or-vanishing gives index 2.

**Acceptance.** Real Enriques surfaces with S(ℝ) a union of two Klein bottles in one half satisfy period = index. If S(ℝ) is orientable, w₁ = 0 and a = \[α̃]₁ always works.

**Direct prerequisites:** [Image of the first two real components](#pi-9-real-locus-image); [Detecting an empty half](#pi-9-enriques-half-detector); [The square of w₁ on a real Enriques surface](#pi-9-enriques-w1-square); MotivesAndAlgebraicCycles §7.10; [Unramified classes: the sufficient half of Theorem 0.5](#pi-7-unramified-odd-or-vanishing); AlgebraicTopologyPartII AT2.12/gamma-stiefel-whitney (gap:at2-gamma-stiefel-whitney).

**Source:** B19, Proof of Theorem 0.6, p. 107: With an even number of odd-Euler components, the first component can be corrected into the image of cl\_R on Θ, so index 2.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Enriques`, namespace `TauCeti.RealSurface`.

<a id="pi-9-real-enriques-criterion"></a>

### Real Enriques surfaces with period different from index

`PI.9/real-enriques-criterion` · theorem

Let S be a real Enriques surface. There is α ∈ Br(S) with ind(α) ≠ per(α) iff S(ℝ) is nonorientable and, if exactly one half of S is nonempty, S(ℝ) has an odd number of connected components of odd Euler characteristic.

**Hypotheses and conventions.** S real Enriques; Br(S) ⊂ Br(ℝ(S)). The second clause is the source's; by PI.9/enriques-w1-square it never holds (E25).

**Proof.**

1. Period-4 classes have ind = per (PI.9/enriques-period-four). For period 2: if S(ℝ) is empty or orientable use PI.9/enriques-orientable-case; if it is nonorientable with both halves nonempty use PI.9/enriques-two-halves; if exactly one half is nonempty use PI.9/enriques-one-half, which gives ind = per, in agreement with the criterion because an odd number of odd-Euler components never occurs (PI.9/enriques-w1-square).

**Acceptance.** By PI.9/enriques-w1-square the criterion is equivalent to: S(ℝ) is nonorientable and both halves are nonempty. Many possible real loci (Degtyarev–Itenberg–Kharlamov) satisfy the condition and many do not.

**Direct prerequisites:** [Orientable or empty real locus](#pi-9-enriques-orientable-case); [Two nonempty halves and a nonorientable real locus](#pi-9-enriques-two-halves); [One nonempty half](#pi-9-enriques-one-half); [The square of w₁ on a real Enriques surface](#pi-9-enriques-w1-square); [Period-four classes on real Enriques surfaces](#pi-9-enriques-period-four).

**Source:** B19, Theorem 0.6, p. 65; proof §8.1, pp. 106–107: Characterisation of real Enriques surfaces carrying unramified classes with ind ≠ per.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Enriques`, namespace `TauCeti.RealSurface`.

<a id="pi-9-real-puiseux-field"></a>

### The Puiseux field over a real closed field is real closed

`PI.9/real-puiseux-field` · definition

For a real closed field R let K = puiseuxField R ⊂ HahnSeries ℚ R be the Puiseux field of FormalLaurentPuiseux L4 (series whose support lies in (1/n)ℤ and is bounded below for some n), ordered by the sign of the leading coefficient. Then K is real closed (IsRealClosed K), R ⊂ K is an ordered subfield, t is positive and smaller than every positive element of R, and K(√−1) = puiseuxField (R(√−1)). For R = ℝ this is the field K = ⋃\_n ℝ((t^{1/n})) of Proposition 0.7, which is non-archimedean. Semialgebraic topology and cohomology over K are those of MotivesAndAlgebraicCycles §7.6a.

**Hypotheses and conventions.** R real closed; f > 0 in K iff the leading coefficient of f is positive in R. IsRealClosed is Mathlib's class: semireal, every element or its negative a square, and every polynomial of odd degree has a root.

**Construction.**

1. The leading-coefficient order is a linear order compatible with addition and multiplication (the leading coefficient of a product is the product of leading coefficients), so K is an ordered field and in particular semireal.
2. Squares: write f = a t^q (1 + ε) with a ∈ Rˣ, q ∈ ℚ and ε of positive order, all at a single level R((t^{1/n})) (FormalLaurentPuiseux L4). If a > 0 then f = (√a · t^{q/2} · (1 + ε)^{1/2})², the binomial series converging t-adically at level 2n; if a < 0 the same applies to −f.
3. Odd-degree roots: R(√−1) is algebraically closed of characteristic 0 (RealAlgebraicGeometry Layer 1), so puiseuxField (R(√−1)) = K(√−1) is algebraically closed (FormalLaurentPuiseux L4, `puiseuxField_isAlgClosed`). Coefficientwise conjugation is a K-automorphism of order 2; the roots in K(√−1) of an odd-degree f ∈ K\[X] are permuted in pairs, so one of them is fixed and lies in K.
4. t − r has leading coefficient −r for r > 0 in R, so 0 < t < r; for R = ℝ, n·t < 1 for every natural n, so K is non-archimedean.

**Uses.** Benoist 2019, Proposition 0.7, p. 65: the base field of the counterexample. PI.9/sextic-k3-degeneration: the K3 surface over K. PI.2/real-closed-norm-bound: the norm bound applies over K.

**API.**

- `RealSurface.puiseuxLinearOrder` (instance): The leading-coefficient order on puiseuxField R, making it a strictly ordered field.
- `RealSurface.puiseuxField_isRealClosed` (other): IsRealClosed (puiseuxField R) for every real closed R.
- `RealSurface.puiseuxField_t_pos` (simp): 0 < t and t < r for every positive r ∈ R.
- `RealSurface.puiseuxField_adjoin_sqrt_neg_one` (equivalence): puiseuxField (R(√−1)) is (puiseuxField R)(√−1), coefficientwise, with conjugation acting on coefficients.

**Unit tests.**

- `RealSurface.puiseuxField_sqrt_t` (computation): t^{1/2} · t^{1/2} = t in puiseuxField ℝ, while −t has negative leading coefficient and is not a square.
- `RealSurface.puiseuxField_not_archimedean` (non-example): puiseuxField ℝ is not archimedean: n·t < 1 for every natural n.
- `RealSurface.puiseuxField_constants` (degenerate): The constant series form an ordered subfield isomorphic to R; the order does not depend on a choice of root of unity or uniformiser.
- `RealSurface.puiseuxField_isRealClosed_compat` (compatibility): IsRealClosed in Mathlib's sense, so PI.0/real-closure-at-ordering applies to (puiseuxField ℝ, id).

**Acceptance.** X² − t has the two roots ±t^{1/2} in K. X³ − t has the root t^{1/3} in K and two further roots in K(√−1) ∖ K.

**Direct prerequisites:** FormalLaurentPuiseux L4 (`puiseuxField`); FormalLaurentPuiseux L4 (`puiseuxField_isAlgClosed`); RealAlgebraicGeometry Layer 1; `HahnSeries` (Mathlib); `IsRealClosed` (Mathlib); MotivesAndAlgebraicCycles §7.6a.

**Source:** B19, §0.4, p. 65; §8.2, p. 107: K = ⋃\_n ℝ((t^{1/n})) is a real closed field; Theorem 0.5 makes sense there with semialgebraic cohomology. BCR, Example 15.2.2, p. 392: The field of real Puiseux series and a sextic double cover separating semialgebraic components by signs.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Puiseux`, namespace `TauCeti.RealSurface`.

<a id="pi-9-sextic-k3-degeneration"></a>

### The sextic double plane and its K3 resolution

`PI.9/sextic-k3-degeneration` · construction

Over ℝ\[\[t]] let 𝒳 = {z² = (w² − u² − v²)u²v² − t w⁶}, a double cover of ℙ² branched along a sextic. Its base change to K = puiseuxField ℝ has rational double points only, and the minimal resolution S of 𝒳\_K is a K3 surface over K (smooth projective geometrically connected with K\_S ≅ O\_S and H¹(O\_S) = 0). S(K) has four semialgebraically connected components, distinguished by the signs of u/w and v/w, each semialgebraically homeomorphic to a sphere, so H¹(S(K), 𝔽₂) = 0 (semialgebraic cohomology).

**Hypotheses and conventions.** Verify the K3 property from the equation (double plane branched along a sextic with ADE singularities), not from an unaccepted K3 roadmap.

**Construction.**

1. The branch sextic f = (w² − u² − v²)u²v² − tw⁶ has only ADE singularities over K (for t ≠ 0 the components separate), so the double cover has rational double points and its minimal resolution has trivial canonical bundle and q = 0.
2. Real points: z² = f requires f ≥ 0; BCR Example 15.2.2 shows the semialgebraic set {f ≥ 0} in the affine chart w = 1 has four bounded components, one in each sign quadrant of (u, v), and the double cover over each is a sphere.
3. Semialgebraic cohomology of a semialgebraic sphere vanishes in degree 1 (MotivesAndAlgebraicCycles §7.6a).

**Uses.** Benoist 2019, Proposition 0.7: the K3 surface of the counterexample. PI.9/prescribed-evaluation-class: the component Ξ with u/w, v/w > 0.

**API.**

- `RealSurface.sexticDoublePlane` (data): 𝒳 over ℝ\[\[t]] and its generic fibre over K.
- `RealSurface.sexticK3` (constructor): The minimal resolution S of 𝒳\_K.
- `RealSurface.sexticK3_isK3` (other): S is a K3 surface over K.
- `RealSurface.sexticK3_components` (characterisation): S(K) has exactly four semialgebraically connected components, indexed by signs of u/w and v/w.
- `RealSurface.sexticK3_h1` (simp): H¹(S(K), 𝔽₂) = 0.

**Unit tests.**

- `RealSurface.sexticK3_special_fibre` (degenerate): At t = 0 the double plane is z² = (w² − u² − v²)u²v², reducible branch locus, not a K3 surface.
- `RealSurface.sexticK3_component_count` (computation): The number of semialgebraic components of S(K) is 4.
- `RealSurface.sexticK3_real_fibre_differs` (non-example): The four components are not separated by the sign of any rational function on S (BCR Example 15.2.2), unlike real loci of surfaces over ℝ.
- `RealSurface.sexticK3_cohomology_compat` (compatibility): H¹(S(K), 𝔽₂) is computed in the semialgebraic theory of MotivesAndAlgebraicCycles §7.6a.

**Acceptance.** At t = 0 the special fibre is the double cover z² = (w² − u² − v²)u²v², whose normalisation is the quadric z² = w² − u² − v².

**Direct prerequisites:** [The Puiseux field over a real closed field is real closed](#pi-9-real-puiseux-field); MotivesAndAlgebraicCycles §7.6a; Tau Ceti roadmap `TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`; SchemeAndStackFoundations §5.10.

**Source:** B19, Proof of Proposition 0.7, p. 107: The sextic double cover of ℙ²\_{ℝ\[\[t]]}, the K3 resolution over K, and the four semialgebraic sphere components of S(K). BCR, Example 15.2.2, pp. 392–393: The bounded set z² = f(x, y) with four semialgebraically connected components that no polynomial separates by sign.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Puiseux`, namespace `TauCeti.RealSurface`.

<a id="pi-9-prescribed-evaluation-class"></a>

### A class evaluating to zero on exactly one component

`PI.9/prescribed-evaluation-class` · construction

For the K3 surface S of PI.9/sextic-k3-degeneration and the component Ξ ⊂ S(K) where u/w, v/w > 0, there is α ∈ Br(S)\[2] whose evaluation at x ∈ S(K) vanishes iff x ∈ Ξ.

**Hypotheses and conventions.** Cited: Colliot-Thélène–Parimala's realisation of locally constant evaluation functions by 2-torsion Brauer classes on varieties over real closed fields.

**Construction.**

1. Cited input (CTP90 Proposition 3.1.2): every locally constant function S(K) → Br(K)\[2] constant on semialgebraic components is the evaluation function of a class of Br(S)\[2].

**Uses.** Benoist 2019, Proposition 0.7: the class of index 4. PI.9/quaternion-sign-contradiction: the class α.

**API.**

- `RealSurface.prescribedClass` (constructor): α ∈ Br(S)\[2] with evaluation vanishing exactly on Ξ.
- `RealSurface.prescribedClass_eval` (characterisation): α\_x = 0 iff x ∈ Ξ.
- `RealSurface.prescribedClass_period` (other): per α = 2.

**Unit tests.**

- `RealSurface.prescribedClass_theta` (computation): Θ(α) = S(K) ∖ Ξ, three components.
- `RealSurface.prescribedClass_not_zero` (non-example): α ≠ 0 since it evaluates nontrivially off Ξ.
- `RealSurface.prescribedClass_trivial_on_xi` (degenerate): Restricted to a point of Ξ, α is trivial.
- `RealSurface.prescribedClass_eval_compat` (compatibility): Evaluation at K-points uses Br(K) ≅ ℤ/2 of PI.0/real-closure-at-ordering.

**Acceptance.** Θ(α) is the union of the three components other than Ξ.

**Direct prerequisites:** [The sextic double plane and its K3 resolution](#pi-9-sextic-k3-degeneration); [Real evaluation and the nonzero evaluation locus](#pi-1-real-evaluation-locus); MotivesAndAlgebraicCycles §7.6a.

**Source:** CTP90, Proposition 3.1.2 (not read; cited at Benoist's locator): Real components and étale cohomology: realisation of evaluation functions. B19, Proof of Proposition 0.7, p. 107: There is α ∈ Br(S)\[2] trivial at x ∈ S(K) exactly when x ∈ Ξ.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Puiseux`, namespace `TauCeti.RealSurface`.

<a id="pi-9-quaternion-sign-contradiction"></a>

### The class is not a quaternion class

`PI.9/quaternion-sign-contradiction` · theorem

The class α of PI.9/prescribed-evaluation-class has index ≠ 2, hence index 4.

**Hypotheses and conventions.** Generic-point form of the source's sign argument (RealSurfacePeriodIndex/E13).

**Proof.**

1. If α = (f, g) with f, g ∈ K(S)ˣ, then at points x outside zeros and poles, x ∈ Ξ iff f(x) > 0 or g(x) > 0.
2. Descend f, g to ℝ((t^{1/n})) and multiply by suitable powers of the positive t^{1/n} (preserving signs) so that they specialise to nonzero rational functions f₀, g₀ on the special fibre, viewed on the quadric Q = {z² = w² − u² − v²}.
3. On the divisor D = {u = 0} ⊂ Q, choose general real points on the arc v/w < 0, avoiding zeros and poles of the unit parts of f₀, g₀ after factoring the powers of u; the sign pattern there forces even orders of f₀, g₀ along D.
4. At general points of the arc v/w > 0, the signs of f₀, g₀ are then constant across D, contradicting the required jump between u/w > 0 (in Ξ) and u/w < 0 (not in Ξ).
5. ind(α) divides 4 by PI.2/real-closed-norm-bound (de Jong over K(√−1)), and is not 2, so it is 4.

**Acceptance.** The index of α is 4 while its period is 2.

**Direct prerequisites:** [A class evaluating to zero on exactly one component](#pi-9-prescribed-evaluation-class); [Norm bound over a real closed field](#pi-2-real-closed-norm-bound); [The Puiseux field over a real closed field is real closed](#pi-9-real-puiseux-field).

**Source:** B19, Proof of Proposition 0.7, pp. 107–108: Writing α = (f, g), specialising f, g to the quadric Q and comparing signs near u = 0 gives a contradiction; the fixed point used must be replaced by general points avoiding zeros and poles on both arcs.

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Puiseux`, namespace `TauCeti.RealSurface`.

<a id="pi-9-puiseux-counterexample"></a>

### Failure of the criterion over a non-archimedean real closed field

`PI.9/puiseux-counterexample` · theorem

There are a K3 surface S over K = ⋃\_n ℝ((t^{1/n})) with H¹(S(K), 𝔽₂) = 0 (semialgebraic cohomology) and α ∈ Br(S)\[2] with ind(α) = 4. Since every Kummer lift has zero first real component (H¹(S(K)) = 0), the analogue of Theorem 0.5 over K fails.

**Hypotheses and conventions.** K the real Puiseux field.

**Proof.**

1. PI.9/sextic-k3-degeneration, PI.9/prescribed-evaluation-class and PI.9/quaternion-sign-contradiction.

**Acceptance.** Over ℝ the same criterion holds (PI.7/unramified-odd-or-vanishing, PI.8/unramified-index-doubling).

**Direct prerequisites:** [The sextic double plane and its K3 resolution](#pi-9-sextic-k3-degeneration); [A class evaluating to zero on exactly one component](#pi-9-prescribed-evaluation-class); [The class is not a quaternion class](#pi-9-quaternion-sign-contradiction).

**Source:** B19, Proposition 0.7, p. 65; proof §8.2, pp. 107–108: A K3 surface over the real Puiseux field with H¹(S(K), ℤ/2) = 0 and a class of index 4 in Br(S)\[2].

*Suggested home:* `TauCeti/AlgebraicGeometry/RealSurface/PeriodIndex/Puiseux`, namespace `TauCeti.RealSurface`.

## Dependencies on other roadmaps

Each entry names a supplier section, what this roadmap assumes of it, and the targets that use it. Roadmaps on main are cited as they stand there; the others precede this roadmap in the merge order or are other authors' open roadmaps. Prerequisites that a supplier does not yet state are listed under Gaps.

- **AffineMorseLefschetz §A3**: a smooth closed affine complex submanifold of complex dimension n has integral cohomology zero above degree n (Andreotti–Frankel). *Needed by:* [PI.3/complex-pushforward-iso](#pi-3-complex-pushforward-iso).
- **AffineMorseLefschetz §A5**: integral weak Lefschetz: for a hyperplane section A of a projective variety X of pure dimension n containing its singular points, H_j(X, A; ℤ) = 0 for j < n. *Needed by:* [PI.2/complex-obstruction-vanishes](#pi-2-complex-obstruction-vanishes), [PI.2/compatible-complex-lift](#pi-2-compatible-complex-lift).
- **AlgebraicModuliForArithmeticGeometry §1.1**: the projective bundle P(E) = Proj Sym E of a quasi-coherent module with its twisting sheaves (quotient convention). *Needed by:* [PI.3/incidence-double-cover](#pi-3-incidence-double-cover).
- **AlgebraicModuliForArithmeticGeometry §1.4**: `amplePowersAndFixedTwists`: for A ample and B fixed on a proper scheme, B ⊗ A^m is very ample for m ≫ 0. *Needed by:* [PI.2/complex-hypersurface-family](#pi-2-complex-hypersurface-family), [PI.5/curve-bearing-parameters](#pi-5-curve-bearing-parameters), [PI.6/signed-branch-section](#pi-6-signed-branch-section).
- **ComplexComparisonPartII §C5.2**: `ehresmannFibration`, `relativeBettiLocalSystem`, `GaussManin` and `relativeDeRhamBetti` for smooth proper families. *Needed by:* [PI.2/geometric-variation](#pi-2-geometric-variation), [PI.2/voisin-kernel-cone](#pi-2-voisin-kernel-cone), [PI.2/dense-splitting-hypersurfaces](#pi-2-dense-splitting-hypersurfaces).
- **ComplexComparisonPartII §C5.3**: `properPureHodge` and `relativeHodgeBundles` (the Hodge filtration of a smooth proper family is by locally direct summands). *Needed by:* [PI.2/geometric-variation](#pi-2-geometric-variation).
- **ComplexComparisonPartII §C6.2**: `riemannExistence`: finite étale covers of a complex variety and finite topological covers of its complex points correspond. *Needed by:* [PI.8/alternating-double-cover](#pi-8-alternating-double-cover).
- **ComplexComparisonPartII §C6.3**: `artinComparison`: étale and Betti cohomology of a complex variety with finite coefficients agree. *Needed by:* [PI.1/kummer-brauer-sequences](#pi-1-kummer-brauer-sequences).
- **EnriquesSurfaces E1a**: for an Enriques surface over an algebraically closed field of characteristic ≠ 2: H²(O) = 0, the kernel of Pic → Num is {O, K}, and the canonical cover is a connected étale K3 double cover. *Needed by:* [PI.9/real-enriques-halves](#pi-9-real-enriques-halves), [PI.9/enriques-complex-brauer](#pi-9-enriques-complex-brauer).
- **EnriquesSurfaces E1c**: for a complex Enriques surface, c₁ : Pic(S) ≅ H²(S(ℂ), ℤ). *Needed by:* [PI.9/enriques-complex-brauer](#pi-9-enriques-complex-brauer).
- **EnriquesSurfaces E1d**: for a complex Enriques surface, π₁ = ℤ/2 and the Brauer term of the 2-primary Kummer sequence is ℤ/2. *Needed by:* [PI.9/enriques-complex-brauer](#pi-9-enriques-complex-brauer).
- **FormalLaurentPuiseux L4**: `puiseuxField K`, `ramifiedEmbedding` and, for K algebraically closed of characteristic zero, `puiseuxField_isAlgClosed`. *Needed by:* [PI.9/real-puiseux-field](#pi-9-real-puiseux-field).
- **HeightsRationalPointsAndObstructions §2.16b**: Brauer residues for smooth varieties in characteristic zero: `smoothBrauer_residueExact` (finitely many nonzero residues, exactness of 0 → Br X → Br U → ⊕ H¹(k(D), ℚ/ℤ), removal of codimension two) and `pullbackMultiplicity` (pullback multiplies residues by the ramification index). *Needed by:* [PI.1/unramified-locus](#pi-1-unramified-locus), [PI.1/ramified-to-unramified-reduction](#pi-1-ramified-to-unramified-reduction), [PI.4/pullback-unramified](#pi-4-pullback-unramified).
- **ModularCurves 4D**: miracle flatness for finite morphisms between regular schemes of the same dimension. *Needed by:* [PI.8/finite-flat-open](#pi-8-finite-flat-open).
- **MotivesAndAlgebraicCycles §0.5b**: Gersten complexes of étale cohomology with their residues; the differential squares to zero. *Needed by:* [PI.4/pullback-unramified](#pi-4-pullback-unramified).
- **MotivesAndAlgebraicCycles §7.10**: for a real Enriques surface, the image of cl_R : Pic → H¹(X(ℝ), 𝔽₂) is w₁(X(ℝ))^⊥, and cl_R(K_X) = w₁(X(ℝ)). *Needed by:* [PI.9/enriques-half-detector](#pi-9-enriques-half-detector), [PI.9/enriques-orientable-case](#pi-9-enriques-orientable-case), [PI.9/enriques-two-halves](#pi-9-enriques-two-halves), [PI.9/enriques-w1-square](#pi-9-enriques-w1-square), [PI.9/enriques-one-half](#pi-9-enriques-one-half).
- **MotivesAndAlgebraicCycles §7.6a**: Borel equivariant Betti cohomology of real varieties (semialgebraic over real closed fields), restriction to the real locus, the norm and the real–complex exact sequences. *Needed by:* [PI.3/equivariant-pushforward-image](#pi-3-equivariant-pushforward-image), [PI.4/obstruction-cup-omega](#pi-4-obstruction-cup-omega), [PI.9/real-puiseux-field](#pi-9-real-puiseux-field), [PI.9/sextic-k3-degeneration](#pi-9-sextic-k3-degeneration), [PI.9/prescribed-evaluation-class](#pi-9-prescribed-evaluation-class).
- **MotivesAndAlgebraicCycles §7.6b**: equivariant purity and proper pushforward, the canonical mod-two and sign-twisted integral decompositions of the cohomology of the real locus with their coefficient reductions (including [ξ]_i = [ξ ∪ ω]_i), Krasnov's equivariant cycle class cl, the Borel–Haefliger class cl_R and the real-locus component equations, in particular cl_R(M) = [cl(M)]₁ for line bundles and compatibility of cl with Kummer boundaries. *Needed by:* [PI.1/kummer-brauer-sequences](#pi-1-kummer-brauer-sequences), [PI.1/two-torsion-line-bundle-class](#pi-1-two-torsion-line-bundle-class), [PI.1/real-evaluation-locus](#pi-1-real-evaluation-locus), [PI.3/equivariant-pushforward-image](#pi-3-equivariant-pushforward-image), [PI.4/brauer-cover-hypotheses](#pi-4-brauer-cover-hypotheses), [PI.4/obstruction-cup-omega](#pi-4-obstruction-cup-omega), [PI.4/uniform-first-component](#pi-4-uniform-first-component), [PI.4/uniform-obstruction-vanishing](#pi-4-uniform-obstruction-vanishing), [PI.4/curve-adjustment](#pi-4-curve-adjustment), [PI.6/branch-locus-conditions](#pi-6-branch-locus-conditions), [PI.6/branch-conditions-blowup](#pi-6-branch-conditions-blowup), [PI.6/nash-approximation-input](#pi-6-nash-approximation-input), [PI.6/brocker-sign-input](#pi-6-brocker-sign-input), [PI.6/degree-two-splitting-uniform](#pi-6-degree-two-splitting-uniform), [PI.8/circle-monodromy-correction](#pi-8-circle-monodromy-correction), [PI.8/even-degree-splitting-obstruction](#pi-8-even-degree-splitting-obstruction), [PI.8/unramified-index-doubling](#pi-8-unramified-index-doubling), [PI.9/real-locus-image](#pi-9-real-locus-image), [PI.9/enriques-orientable-case](#pi-9-enriques-orientable-case).
- **MotivesAndAlgebraicCycles §7.8**: the complex and real Lefschetz (1,1) theorems: integral (equivariant) classes of type (1,1) on a smooth projective variety over ℝ are classes of line bundles. *Needed by:* [PI.2/dense-splitting-hypersurfaces](#pi-2-dense-splitting-hypersurfaces), [PI.6/degree-two-splitting-uniform](#pi-6-degree-two-splitting-uniform).
- **ProfiniteCohomology Layer 6**: corestriction along open subgroups of profinite groups, with cor ∘ res multiplication by the index. *Needed by:* [PI.0/brauer-corestriction](#pi-0-brauer-corestriction).
- **PurityOfBranchLocus §2.3**: Zariski–Nagata purity of the ramification and branch loci of a finite cover of a regular scheme. *Needed by:* [PI.8/alternating-double-cover](#pi-8-alternating-double-cover).
- **RealAlgebraicGeometry Layer 1**: `exists_realClosure` and the preordering-extension lemma; adjoining √−1 to a real closed field gives an algebraically closed field. *Needed by:* [PI.9/real-puiseux-field](#pi-9-real-puiseux-field).
- **ResolutionOfSingularitiesCharacteristicZero §5.1**: `principalization` of a coherent ideal by smooth blow-ups that are isomorphisms off its zero locus. *Needed by:* [PI.1/ramified-to-unramified-reduction](#pi-1-ramified-to-unramified-reduction), [PI.6/degree-two-splitting-uniform](#pi-6-degree-two-splitting-uniform).
- **ResolutionOfSingularitiesCharacteristicZero §6.2**: `sncCompactification` of a smooth quasi-projective variety. *Needed by:* [PI.7/zero-evaluation-period-index](#pi-7-zero-evaluation-period-index).
- **ResolutionOfSingularitiesCharacteristicZero §7.8**: `resolution_field`: a projective birational resolution, smooth over the field, of every reduced finite-type scheme in characteristic zero. *Needed by:* [PI.2/de-jong-period-index](#pi-2-de-jong-period-index), [PI.2/real-closed-norm-bound](#pi-2-real-closed-norm-bound), [PI.8/unramified-index-doubling](#pi-8-unramified-index-doubling).
- **SchemeAndStackFoundations §0.1**: quasi-coherent algebras and relative Spec, for the finite model Spec_S(O_S ⊕ M⁻¹). *Needed by:* [PI.3/branch-cover-finite-model](#pi-3-branch-cover-finite-model).
- **SchemeAndStackFoundations §0.17**: depth, Cohen–Macaulay modules and Serre's conditions; a hypersurface in a regular scheme is Cohen–Macaulay. *Needed by:* [PI.3/branch-cover-finite-model](#pi-3-branch-cover-finite-model).
- **SchemeAndStackFoundations §0.9**: Noetherian approximation and spreading out of finitely presented data. *Needed by:* [PI.1/index-algebraically-closed-base-change](#pi-1-index-algebraically-closed-base-change).
- **SchemeAndStackFoundations §2.11**: the Kummer sequence and Hilbert 90. *Needed by:* [PI.1/kummer-brauer-sequences](#pi-1-kummer-brauer-sequences).
- **SchemeAndStackFoundations §2.16**: `tsen_theorem`: a function field of transcendence degree one over an algebraically closed field is C₁ and has trivial Brauer group. *Needed by:* [PI.0/witt-real-curve](#pi-0-witt-real-curve).
- **SchemeAndStackFoundations §2.2**: Leray and Čech spectral sequences. *Needed by:* [PI.3/incidence-local-resolution](#pi-3-incidence-local-resolution), [PI.5/twisted-curve-vanishing](#pi-5-twisted-curve-vanishing), [PI.5/blowup-auxiliary-bundle](#pi-5-blowup-auxiliary-bundle).
- **SchemeAndStackFoundations §2.20**: Serre duality. *Needed by:* [PI.5/auxiliary-hypotheses](#pi-5-auxiliary-hypotheses), [PI.5/normal-bundle-bound](#pi-5-normal-bundle-bound), [PI.5/twisted-curve-vanishing](#pi-5-twisted-curve-vanishing).
- **SchemeAndStackFoundations §2.22**: Brauer groups of schemes: `brauer_regular_injectivity`, `brauer_kummer_sequence`, `brauer_henselian_local`. *Needed by:* [PI.1/unramified-locus](#pi-1-unramified-locus), [PI.1/kummer-brauer-sequences](#pi-1-kummer-brauer-sequences), [PI.7/real-closure-pointwise-triviality](#pi-7-real-closure-pointwise-triviality).
- **SchemeAndStackFoundations §2.6**: quasi-coherent cohomology, `ample_serre_vanishing` and `projectiveSpace_cohomology`. *Needed by:* [PI.2/complex-hypersurface-family](#pi-2-complex-hypersurface-family), [PI.5/curve-bearing-parameters](#pi-5-curve-bearing-parameters), [PI.5/auxiliary-hypotheses](#pi-5-auxiliary-hypotheses), [PI.5/blowup-auxiliary-bundle](#pi-5-blowup-auxiliary-bundle).
- **SchemeAndStackFoundations §3.4**: Picard groups of integral schemes through Cartier and Weil divisors (`cartierClass_picard_equiv`), hence surjectivity of Pic(S) → Pic(V) for a dense open V of a smooth S. *Needed by:* [PI.1/point-removal-extension](#pi-1-point-removal-extension), [PI.4/uniform-first-component](#pi-4-uniform-first-component), [PI.4/primitive-picard-trace-correction](#pi-4-primitive-picard-trace-correction), [PI.8/correcting-line-bundle](#pi-8-correcting-line-bundle).
- **SchemeAndStackFoundations §4.11**: modifications, blow-ups and strict transforms. *Needed by:* [PI.3/incidence-double-cover](#pi-3-incidence-double-cover).
- **SchemeAndStackFoundations §4.13**: regular schemes, Serre's normality criterion and Bertini's theorem. *Needed by:* [PI.1/ramified-to-unramified-reduction](#pi-1-ramified-to-unramified-reduction), [PI.2/complex-hypersurface-family](#pi-2-complex-hypersurface-family), [PI.3/branch-cover-finite-model](#pi-3-branch-cover-finite-model), [PI.5/curve-lift](#pi-5-curve-lift).
- **SchemeAndStackFoundations §4.17**: strict normal crossings divisors. *Needed by:* [PI.3/branch-cover-finite-model](#pi-3-branch-cover-finite-model).
- **SchemeAndStackFoundations §4.9**: the theorem on formal functions and Stein factorisation. *Needed by:* [PI.3/incidence-local-resolution](#pi-3-incidence-local-resolution).
- **SchemeAndStackFoundations §5.10**: adjunction, Riemann–Roch and intersection numbers on smooth projective surfaces. *Needed by:* [PI.2/complex-hypersurface-family](#pi-2-complex-hypersurface-family), [PI.5/normal-bundle-bound](#pi-5-normal-bundle-bound), [PI.9/sextic-k3-degeneration](#pi-9-sextic-k3-degeneration).
- **SchemeAndStackFoundations §5.4**: projective bundles and Chern classes. *Needed by:* [PI.3/incidence-double-cover](#pi-3-incidence-double-cover).
- **ShimuraData §3.1**: `Variation`, the carrier of a real or rational variation of Hodge structure on a complex manifold. *Needed by:* [PI.2/geometric-variation](#pi-2-geometric-variation), [PI.6/real-green-criterion](#pi-6-real-green-criterion), [PI.6/vanishing-variation](#pi-6-vanishing-variation).
- **WeilConjectures WC.7**: `IsEnriques`, `enriques_characterization` and `enriques_baseChange`. *Needed by:* [PI.9/real-enriques-halves](#pi-9-real-enriques-halves).
- **Tau Ceti roadmap `TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`** (main), imported as stated there. *Needed by:* [PI.1/point-removal-extension](#pi-1-point-removal-extension), [PI.2/complex-obstruction-vanishes](#pi-2-complex-obstruction-vanishes), [PI.2/compatible-complex-lift](#pi-2-compatible-complex-lift), [PI.3/complex-pushforward-iso](#pi-3-complex-pushforward-iso), [PI.6/branch-locus-conditions](#pi-6-branch-locus-conditions), [PI.8/quotient-component-algebraicity](#pi-8-quotient-component-algebraicity), [PI.9/real-locus-image](#pi-9-real-locus-image).
- **Tau Ceti roadmap `TauCetiRoadmap/QuadraticFormInvariants#layer-0-square-classes-diagonal-calculus-and-chain-equivalence`** (main), imported as stated there. *Needed by:* [PI.0/signature-at-ordering](#pi-0-signature-at-ordering).
- **Tau Ceti roadmap `TauCetiRoadmap/QuadraticFormInvariants#layer-1-hyperbolic-planes-and-witt-theory`** (main), imported as stated there. *Needed by:* [PI.0/signature-at-ordering](#pi-0-signature-at-ordering), [PI.0/springer-complete-dvr](#pi-0-springer-complete-dvr).
- **Tau Ceti roadmap `TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion`** (main), imported as stated there. *Needed by:* [PI.0/witt-real-curve](#pi-0-witt-real-curve).
- **Tau Ceti roadmap `TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`** (main), imported as stated there. *Needed by:* [PI.0/signature-at-ordering](#pi-0-signature-at-ordering), [PI.0/elman-lam-c2-bound](#pi-0-elman-lam-c2-bound).
- **Tau Ceti roadmap `TauCetiRoadmap/QuadraticFormInvariants#layer-5-the-brauer-valued-invariants`** (main), imported as stated there. *Needed by:* [PI.0/witt-real-curve](#pi-0-witt-real-curve), [PI.0/albert-isotropy](#pi-0-albert-isotropy), [PI.0/pfister-brauer-criterion](#pi-0-pfister-brauer-criterion).
- **Tau Ceti roadmap `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-6-the-brauer-group-and-splitting-fields`** (main), imported as stated there. *Needed by:* [PI.0/brauer-nonvanishing-locus](#pi-0-brauer-nonvanishing-locus), [PI.0/brauer-period-index](#pi-0-brauer-period-index).
- **Tau Ceti roadmap `TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`** (main), imported as stated there. *Needed by:* [PI.3/incidence-double-cover](#pi-3-incidence-double-cover), [PI.5/blowup-auxiliary-bundle](#pi-5-blowup-auxiliary-bundle), [PI.6/branch-conditions-blowup](#pi-6-branch-conditions-blowup), [PI.9/sextic-k3-degeneration](#pi-9-sextic-k3-degeneration).

## Gaps

Each gap is a prerequisite that the named supplier must provide; this roadmap does not plan it again.

- **Étale–equivariant comparison for real varieties.** What ComplexComparisonPartII must provide (gap:real-artin-comparison, §C6.3): For X of finite type over ℝ and a finite G-module M (G = Gal(ℂ/ℝ)), a natural isomorphism H^i\_ét(X, M) ≅ H^i\_G(X(ℂ), M) compatible with cup products and with the boundary maps of short exact coefficient sequences (Scheiderer 1994, Corollary 15.3.1). *Needed by:* [PI.1/kummer-brauer-sequences](#pi-1-kummer-brauer-sequences), [PI.1/two-torsion-line-bundle-class](#pi-1-two-torsion-line-bundle-class), [PI.8/alternating-double-cover](#pi-8-alternating-double-cover).
- **Torsion-free cokernel of the real cycle class.** What MotivesAndAlgebraicCycles must provide (gap:picard-cokernel-torsion-free, §7.8): State as a named result, for X smooth over ℝ, that the cokernel of cl : Pic(X) → H²\_G(X(ℂ), ℤ(1)) is torsion-free (Benoist–Wittenberg I, Proposition 2.9), which §7.8 already uses inside its divisor theorem. *Needed by:* [PI.4/primitive-picard-trace-correction](#pi-4-primitive-picard-trace-correction), [PI.8/even-degree-splitting-obstruction](#pi-8-even-degree-splitting-obstruction).
- **Tsen–Lang.** What QuadraticFormInvariantsPartII must provide (gap:q2-tsen-lang, Q2.5/transcendental-ci): If F is C\_i and E/F has finite transcendence degree t, then E is C\_{i+t}; in particular every extension of finite transcendence degree t of an algebraically closed field is C\_t. *Needed by:* [PI.0/curve-u-bound](#pi-0-curve-u-bound), [PI.0/elman-lam-c2-bound](#pi-0-elman-lam-c2-bound).
- **Restriction to the real locus above twice the dimension.** What AlgebraicTopologyPartII must provide (gap:at2-free-descent, AT2.6/free-descent): For X of dimension d over ℝ and a G-module M, restriction H^i\_G(X(ℂ), M) → H^i\_G(X(ℝ), M) is an isomorphism for i > 2d. *Needed by:* [PI.3/equivariant-pushforward-image](#pi-3-equivariant-pushforward-image), [PI.4/obstruction-cup-omega](#pi-4-obstruction-cup-omega).
- **Bockstein in canonical coordinates.** What AlgebraicTopologyPartII must provide (gap:at2-twisted-bockstein, AT2.7/twisted-bockstein): For a ∈ H^k\_G(Y, 𝔽₂) with canonical components a\_i on a subset Y of the real locus, the mod-two reduction of the integral Bockstein has components β(a\_{i−1}) + (k − i)a\_i. *Needed by:* [PI.1/two-torsion-line-bundle-class](#pi-1-two-torsion-line-bundle-class), [PI.4/uniform-first-component](#pi-4-uniform-first-component).
- **Canonical splitting of the localisation sequence.** What AlgebraicTopologyPartII must provide (gap:at2-mod-two-splitting, AT2.9/mod-two-splitting): For X smooth of pure dimension d over ℝ, the sequence 0 → H^i\_{G,X(ℝ)}(X(ℂ), 𝔽₂) → H^i\_G(X(ℂ), 𝔽₂) → H^i\_G(X(ℂ) ∖ X(ℝ), 𝔽₂) → 0 is canonically split. *Needed by:* [PI.9/real-locus-image](#pi-9-real-locus-image).
- **The self-intersection class of the real locus.** What AlgebraicTopologyPartII must provide (gap:at2-gamma-class, AT2.9/gamma-class): For X smooth of pure dimension d over ℝ, the class γ\_X ∈ ⊕ H^p(X(ℝ), 𝔽₂) obtained by restricting the fundamental class of X(ℝ) with supports, with γ\_0 = 1. *Needed by:* [PI.9/real-locus-image](#pi-9-real-locus-image).
- **Corrected localisation sequence.** What AlgebraicTopologyPartII must provide (gap:at2-corrected-localization, AT2.10/corrected-localization): For X smooth proper of pure dimension d over ℝ, the exact sequence relating H^i\_G(X(ℂ), X(ℝ); 𝔽₂), H^i\_G(X(ℂ) ∖ X(ℝ), 𝔽₂) and the windows of H^\*(X(ℝ), 𝔽₂) through multiplication by γ\_X. *Needed by:* [PI.9/real-locus-image](#pi-9-real-locus-image).
- **Self-duality of the corrected localisation sequence.** What AlgebraicTopologyPartII must provide (gap:at2-localization-self-dual, AT2.10/localization-self-dual): The corrected localisation sequence is self-dual under i ↔ 2d − i, the real windows being paired by (x, y) ↦ deg(x y γ\_X). *Needed by:* [PI.9/real-locus-image](#pi-9-real-locus-image).
- **γ is the Stiefel–Whitney class.** What AlgebraicTopologyPartII must provide (gap:at2-gamma-stiefel-whitney, AT2.12/gamma-stiefel-whitney): Over ℝ, γ\_X = w(TX(ℝ)); for a compact smooth surface Σ, w₁ = 0 exactly when Σ is orientable and deg(w₁(Σ)²) = χ(Σ) mod 2. *Needed by:* [PI.9/real-locus-image](#pi-9-real-locus-image), [PI.9/enriques-w1-square](#pi-9-enriques-w1-square), [PI.9/enriques-one-half](#pi-9-enriques-one-half).
- **Embedded loop representatives.** What AlgebraicTopologyPartII must provide (gap:at2-surface-loop-representatives, AT2.12/surface-loop-representatives): On a compact smooth surface every class of H₁(Σ, 𝔽₂) is represented by disjoint smooth embedded circles, which may be chosen transverse to finitely many given immersed curves and avoiding a finite set. *Needed by:* [PI.6/branch-conditions-blowup](#pi-6-branch-conditions-blowup), [PI.8/circle-double-cover](#pi-8-circle-double-cover), [PI.8/quotient-component-algebraicity](#pi-8-quotient-component-algebraicity).
- **Sign local system of a double cover.** What AlgebraicTopologyPartII must provide (gap:at2-double-cover-local-system, AT2.14/double-cover-local-system): For an equivariant double covering p : T → S, L = coker(ℤ → p\_\*ℤ) is an equivariant rank-one local system with sequences 0 → ℤ → p\_\*ℤ → L → 0 and 0 → L → p\_\*ℤ → ℤ → 0, and equivariant double covers are classified by H¹\_G(S, 𝔽₂). *Needed by:* [PI.3/double-cover-strata](#pi-3-double-cover-strata).
- **Ramified trace triangle.** What AlgebraicTopologyPartII must provide (gap:at2-ramified-triangle, AT2.14/ramified-triangle): For an equivariant double cover T₀ → S₀ of smooth complex surfaces ramified along a smooth divisor, with étale locus j : S\* ⊂ S₀ and sign system L, a distinguished triangle Rj\_\*L → p\_\*ℤ → ℤ → Rj\_\*L\[1] whose second map is the trace. *Needed by:* [PI.3/complex-pushforward-iso](#pi-3-complex-pushforward-iso).
- **Extension class of the trace sequence.** What AlgebraicTopologyPartII must provide (gap:at2-double-cover-extension, AT2.14/double-cover-extension): The extension class e\_L ∈ H¹\_G(S, L) of the trace sequence, with mod-two image e, satisfies β\_L(x) = β(x) + e ∪ x for the boundary β\_L of 0 → 𝔽₂ → L/4 → 𝔽₂ → 0. *Needed by:* [PI.4/uniform-first-component](#pi-4-uniform-first-component).
- **Equivariant Ext stalks on a fixed circle.** What AlgebraicTopologyPartII must provide (gap:at2-equivariant-ext-stalk, AT2.14/equivariant-ext-stalk): On a circle with trivial G-action, the stalks of the equivariant Ext sheaves are (Ext^q\_G(ℤ, F))\_x ≅ H^q(G, F\_x), which vanish for q > 0 when F\_x ≅ ℤ\[G]^k. *Needed by:* [PI.8/circle-double-cover](#pi-8-circle-double-cover).
- **Permutation quotient and trace sequence.** What AlgebraicTopologyPartII must provide (gap:at2-permutation-quotient, AT2.15/permutation-quotient): For p : T → S proper generically finite of degree n between smooth complex surfaces with conjugation, Q = coker(ℤ → p\_\*ℤ), the trace induces φ : Q → ℤ/n and 0 → p\_\*ℤ → ℤ ⊕ Q → ℤ/n → 0 (maps (Tr, π) and (1, −φ)) is exact. *Needed by:* [PI.8/trace-quotient-lift-surface](#pi-8-trace-quotient-lift-surface).
- **Trace-zero operator.** What AlgebraicTopologyPartII must provide (gap:at2-trace-zero-operator, AT2.15/trace-zero-operator): A natural ψ : Q → p\_\*ℤ with Tr ∘ ψ = 0 whose reduction modulo n is p^\* ∘ φ, equality checked through injectivity of p\_\*(ℤ/n) → j\_\*j^\*p\_\*(ℤ/n). *Needed by:* [PI.4/primitive-picard-trace-correction](#pi-4-primitive-picard-trace-correction), [PI.8/corrected-pullback-lift](#pi-8-corrected-pullback-lift).
- **Trace-quotient lifting criterion.** What AlgebraicTopologyPartII must provide (gap:at2-trace-quotient-lift, AT2.15/trace-quotient-lift): On an open V where p is finite, a class a ∈ H²\_G(V, ℤ/n(1)) whose pullback has vanishing integral Bockstein is η mod n − φ(ζ) for some η ∈ H²\_G(V, ℤ(1)) and ζ ∈ H²\_G(V, Q(1)). *Needed by:* [PI.4/primitive-picard-trace-correction](#pi-4-primitive-picard-trace-correction), [PI.8/trace-quotient-lift-surface](#pi-8-trace-quotient-lift-surface).
- **Corrected integral lift.** What AlgebraicTopologyPartII must provide (gap:at2-corrected-integral-lift, AT2.15/corrected-integral-lift): With a = η mod n − φ(ζ), the class b = p^\*η − ψ(ζ) reduces to p^\*a modulo n and Tr(b) = nη. *Needed by:* [PI.4/primitive-picard-trace-correction](#pi-4-primitive-picard-trace-correction), [PI.8/corrected-pullback-lift](#pi-8-corrected-pullback-lift).
- **Circle extension.** What AlgebraicTopologyPartII must provide (gap:at2-circle-extension, AT2.15/circle-extension): On an embedded fixed circle with free permutation stalks and n even, the sheaf E = coker\[(φ₂, 1 + σ) : Q(1) → 𝔽₂ ⊕ Q(1)^G] sits in 0 → 𝔽₂ → E → 𝔽₂ → 0, and the boundary of 1 is the degree-one component of φζ. *Needed by:* [PI.8/circle-double-cover](#pi-8-circle-double-cover).
- **Reduction in the two sign degrees.** What AlgebraicTopologyPartII must provide (gap:at2-cyclic-reduction-degrees, AT2.15/cyclic-reduction-degrees): For n even and A = ℤ/n with the sign action, reduction A → 𝔽₂ is the identity on H¹(G, A) and multiplication by n/2 mod 2 on H²(G, A). *Needed by:* [PI.8/circle-double-cover](#pi-8-circle-double-cover).
- **Equivariant Ehresmann trivialisation.** What AlgebraicTopologyPartII must provide (gap:at2-equivariant-ehresmann, AT2.16/equivariant-ehresmann): A proper submersion of manifolds with commuting involutions is equivariantly trivial over a small invariant neighbourhood of a fixed point of the base. *Needed by:* [PI.6/kummer-lift-transport](#pi-6-kummer-lift-transport).
- **Equivariant stratified pair transport.** What AlgebraicTopologyPartII must provide (gap:at2-stratified-pair-transport, AT2.16/stratified-pair-transport): For f : M → B proper on a G-invariant Whitney-stratified closed subset with every stratum submersive over B, invariant f-compatible control data exist (the obligation that AT2 records with this target) and give, near a fixed point of B, a G-equivariant trivialisation preserving every distinguished union of strata. *Needed by:* [PI.6/kummer-lift-transport](#pi-6-kummer-lift-transport).
- **Double-cover chase comparison.** What AlgebraicTopologyPartII must provide (gap:at2-double-cover-diagram, AT2.16/double-cover-diagram): For γ ∈ H³(T₀(ℂ), ℤ), δ ∈ H³\_G(S₀(ℂ), ℤ) with ordinary image Tr(γ) and ζ ∈ H³\_G(S\*(ℂ), L(1)) with κ(ζ) = N(γ), there is η₀ ∈ H²\_G(S₀(ℂ), ℤ(1)) with g(δ) + ζ ∪ ω = g(η₀ ∪ ω), with the plus sign and modulo the indeterminacy recorded there (the common-lift cochain chase and its sign, which AlgebraicTopologyPartII records as open). *Needed by:* [PI.4/uniform-obstruction-vanishing](#pi-4-uniform-obstruction-vanishing).
- **Finite-index equivariant lattice.** What AlgebraicTopologyPartII must provide (gap:at2-finite-index-lattice, AT2.16/finite-index-lattice): For a compact G-space T of finite CW type, the image of H²\_G(T, ℤ(j)) in H²(T, ℤ(j))^G has finite index. *Needed by:* [PI.6/degree-two-splitting-uniform](#pi-6-degree-two-splitting-uniform).

## Mistakes in the source

Each entry states what Benoist 2019 (published version) has at the locator and the corrected statement the targets use.

- **E1** (error, §3.1, p. 76 (published version)). The surface T = {rv² = sw²} is called a finite double cover of S ramified over Δ. *Correction:* The incidence model is proper and generically of degree 2 but has ℙ¹ fibres over R ∩ D; it is finite flat only over S₀. The finite flat model is Spec\_S(O\_S ⊕ L⁻¹(−R)) with multiplication by rs (PI.3/branch-cover-finite-model). *Reason:* Over a crossing x of R and D both r and s vanish, so the fibre equation rv² = sw² is identically zero and the fibre is all of ℙ¹. *Affects:* a stated result.
- **E2** (gap, Lemma 1.4, p. 70 (published version)). The proof uses that the reduction of p\*β modulo n is p\*p\*α̃ for an integral β lifting p\*α. *Correction:* Choose β with β mod n = p\*α̃ before Lemma 1.4; Lemma 1.3 kills the Bockstein of p\*α̃, so such β exists (PI.2/compatible-complex-lift). *Reason:* An integral lift of p\*α in (1.2) is determined only up to n·H² + cl(Pic), so its reduction need not be p\*α̃. *Affects:* the proof.
- **E3** (gap, Proposition 4.4, p. 84, after (4.8) (published version)). The computation concludes (\[ζ]₁)|\_Ψ = (\[e]₁)|\_Ψ from (\[α̃]₁)|\_Ψ = 0. *Correction:* The diagonal-arrow formula gives \[ζ]₁ = \[α̃]₀·\[e]₁ on Ψ; with \[α̃]₀ constant equal to t the Picard correction must be multiplied by t (PI.4/uniform-first-component). The statements of Propositions 4.4, 4.5 and 6.6 are therefore planned only under uniform evaluation on Ψ, the case the induction uses. *Reason:* Ψ ⊃ Θ may contain components where α evaluates to 0, where \[α̃]₀ = 0; this case occurs in the induction when 4 | n. *Affects:* a stated result.
- **E4** (gap, Proposition 4.5, pp. 84–85 (published version)). The proof writes β|\_{T\_U} = p\*α̃ + 2ε + cl(ϕ), adding the mod-2 class p\*α̃ to integral classes. *Correction:* Use the integral class b = p\*η − ψ(ζ) from the trace quotient and Picard primitivity (PI.4/primitive-picard-trace-correction, PI.4/uniform-pushforward-adjustment). *Reason:* α̃ lies in H²\_G(U(ℂ), 𝔽₂) while β lives in integral equivariant cohomology; the displayed sum is not typed. *Affects:* a stated result.
- **E5** (gap, Proposition 4.5, p. 85, application of Assumption 4.1 (ii) (published version)). δ − cl(θ₂) is fed to Proposition 3.3 after its first component vanishes on Ψ. *Correction:* First subtract cl(ν) for a combination ν of curves avoiding Ψ given by Assumption 4.1 (ii), then apply Proposition 3.3; add 2ν to θ (PI.4/curve-adjustment). *Reason:* Proposition 3.3 needs \[ξ]₁ ∈ I on all of S(ℝ), not only vanishing on Ψ. *Affects:* the proof.
- **E6** (misprint, Lemma 7.3, p. 98, and (7.13), p. 103 (published version)). p\*α̃ is the reduction of p\*η + ψ(ζ). *Correction:* p\*η − ψ(ζ), consistently with the map (1, −φ) in (7.2); (7.14) is unchanged since Tr∘ψ = 0. *Reason:* α̃ = η mod n − φ(ζ) and ψ mod n = p\*φ give p\*α̃ = (p\*η − ψ(ζ)) mod n. *Affects:* nothing.
- **E7** (misprint, Proof of Lemma 7.3, p. 99 (published version)). Equality of the two maps out of Q is deduced from injectivity of Q → j\_\*j\*Q. *Correction:* Use injectivity of the target p\_\*(ℤ/n) → j\_\*j\*p\_\*(ℤ/n). *Reason:* Injectivity of the source does not separate two maps out of it; injectivity of the target does. *Affects:* nothing.
- **E8** (misprint, Proposition 6.7, p. 95 (published version)). The statement imposes a lift of (n/2)α for every n. *Correction:* State the odd case separately and impose the half-period lift only for even n; the restricted period is exactly n/2 by corestriction (PI.7/arbitrary-period-sufficiency, PI.7/period-induction-step). *Reason:* (n/2)α is undefined for odd n. *Affects:* nothing.
- **E9** (gap, Proof of Theorem 0.12, p. 95 (published version)). K is written as the union of all finite extensions of a finitely generated K₀ carrying α. *Correction:* Enlarge K₀ by a transcendence basis of K/ℝ first, so that K/K₀ is algebraic. *Reason:* Otherwise K is not a union of finite extensions of K₀. *Affects:* the proof.
- **E10** (gap, Proof of Theorem 0.12, lower bound, p. 96 (published version)). Parameters z₁, z₂ are chosen with neither proportional to w² + 1 in m/m², and y\_j = (1 + z\_j)² + (w + z\_j)² are claimed to be local parameters. *Correction:* Replace w by w′ = (w² − 1)/(2w), so that w′² + 1 ∈ m²; then for any regular parameters z\_j the y\_j are regular parameters (PI.7/sharp-anisotropic-form). *Reason:* dy\_j = a + 2(1 + i)dz\_j with a the differential of w² + 1; separate non-proportionality conditions do not make the 2×2 determinant nonzero. *Affects:* the proof.
- **E11** (misprint, (2.1), p. 72 (published version)). The source of the Gysin map has coefficient M(−k). *Correction:* M(d′ − d), as in Benoist–Wittenberg (1.22). *Reason:* The twist depends on the codimension, not on the degree k. *Affects:* nothing.
- **E12** (misprint, (5.7), p. 88 (published version)). The normal-sequence boundary in the factorisation of φ\_λ lands in H⁰(C, N\_{C/T}). *Correction:* H¹(C, N\_{C/T}). *Reason:* It is the boundary of 0 → N\_{C/T} → N\_{C/X} → N\_{T/X}|\_C → 0 from H⁰ of the last term (Benoist 2018, Proposition 2.1). *Affects:* nothing.
- **E13** (gap, Proof of Proposition 0.7, p. 108 (published version)). Signs of f₀, g₀ are compared at the fixed point \[0 : −1 : 1 : 0] and near general points avoiding poles only. *Correction:* On both arcs v/w < 0 and v/w > 0 of D = {u = 0} choose general real points avoiding zeros and poles of the unit parts after factoring the D-orders (PI.9/quaternion-sign-contradiction). *Reason:* The fixed point may lie on zeros or poles of f₀, g₀; avoiding poles alone does not make the signs locally constant. *Affects:* the proof.
- **E14** (misprint, Proof of Proposition 0.7, p. 107 (published version)). α = (f, g) is written in Br(R(S)). *Correction:* Br(K(S)) for the real Puiseux field K. *Reason:* S is defined over K, not ℝ. *Affects:* nothing.
- **E15** (misprint, Proof of Theorem 0.6, p. 107 (published version)). The class δ with \[δ]₀ = 0 is called unique. *Correction:* Unique nonzero class, as on p. 106. *Reason:* δ = 0 always satisfies \[δ]₀ = 0. *Affects:* nothing.
- **E17** (misprint, Proof of Theorem 1.5, p. 71 (published version)). Voisin's Proposition 9 is applied with n = dl. *Correction:* Use a separate letter for Voisin's degree, m = dn for surfaces in |dnH|. *Reason:* n is already the period of α. *Affects:* nothing.
- **E18** (misprint, §3.1, p. 77 (published version)). The fixed singular points of T are the points over Sing R where v vanishes. *Correction:* where w vanishes (and v ≠ 0). *Reason:* Over Sing R the equation rv² = sw² with s a unit and r vanishing forces w = 0 at points with r = 0; v and w do not vanish together. *Affects:* nothing.
- **E20** (gap, Proposition 4.2, p. 80 (published version)). After curves over R, the remaining curves are treated as exceptional divisors of the blow-up T → T̄. *Correction:* Treat both the exceptional ℙ¹'s over Sing R and the ℙ¹ fibres over R ∩ D of the incidence model, by the same Gersten and Witt argument (PI.4/pullback-unramified). *Reason:* The ℙ¹ fibres over R ∩ D lie in T̄ already and are not exceptional for T → T̄. *Affects:* the proof.
- **E21** (gap, Proposition 6.6, pp. 94–95 (published version)). The proposition follows by replacing T with T\_x. *Correction:* Normalise the integral lift so that its reduction on T\_U is p\*α̃ and transport the pair (T, p⁻¹R) so that this persists on T\_x; only then does algebraicity modulo 2 give splitting (PI.6/kummer-lift-transport, PI.6/family-pair-stratification). *Reason:* An Ehresmann trivialisation that does not preserve p⁻¹R need not identify the Kummer data on T\_U. *Affects:* the proof.
- **E22** (error, Lemma 6.4, p. 92 (published version)). h₁ is chosen vanishing to order one along R and H, and t = −h₁h₂ru. *Correction:* Choose h₁ with real divisor H − R (simple pole along R, simple zero along H); then t = −h₁h₂ru has real zero locus H(ℝ) (PI.6/signed-branch-section). *Reason:* With a zero of h₁ along R, t vanishes to order 2 along R, so its real zero locus contains R(ℝ) and is not ι′(𝒮). *Affects:* the proof.
- **E23** (misprint, Proof of Proposition 4.5, p. 85 (published version)). \[p\_\*ε]₁ = 0 in H¹(S(ℝ)). *Correction:* \[p\_\*ε]₁ ∈ H¹(U(ℝ)) vanishes on Ψ. *Reason:* ε lives over T\_U; only its restriction to Ψ, which has no real preimage, vanishes. *Affects:* nothing.
- **E24** (misprint, Proof of Lemma 6.5, p. 92 (published version)). p(T(ℝ)) is said to be disjoint from Θ. *Correction:* Disjoint from Ψ = S(ℝ) ∖ Ξ, the set to avoid in Assumption 4.1. *Reason:* Lemma 6.5 concerns Assumption 4.1 with Ψ = S(ℝ) ∖ Ξ; Θ does not occur in its statement. *Affects:* nothing.
- **E25** (error, Theorem 0.6 (ii), p. 65, and its proof, p. 107 (published version)). If exactly one half of S is nonempty and S(ℝ) has an odd number of components of odd Euler characteristic, the lift with components (1, w₁) gives a class of index 4. *Correction:* This case never occurs: w₁ = cl\_R(K\_S) lies in im cl\_R = w₁^⊥, so deg(w₁²) = 0 and the number of components of odd Euler characteristic is even (PI.9/enriques-w1-square). Theorem 0.6 stays true; its condition (ii) is equivalent to S(ℝ) being nonorientable with both halves nonempty. *Reason:* Kahn's cl\_R(K\_S) = w₁ and Mangolte–van Hamel's description of im cl\_R as the orthogonal of w₁. *Affects:* the proof.

## References

Works marked *cited by locator* are behind a paywall; they are cited at the locator given and their statements are not used beyond it.

- **B19**: Olivier Benoist, *The period-index problem for real surfaces*, Publications Mathématiques de l'IHÉS 130 (2019), 63–110; published version (Numdam), printed page numbers. <https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf>
- **CT05**: Jean-Louis Colliot-Thélène, *Algèbres simples centrales sur les corps de fonctions de deux variables (d'après A. J. de Jong)*, Séminaire Bourbaki, exposé 949, Astérisque 307 (2006), 379–413. <https://www.numdam.org/item/SB_2004-2005__47__379_0.pdf>
- **BW20**: Olivier Benoist and Olivier Wittenberg, *On the integral Hodge conjecture for real varieties, I*, Inventiones Mathematicae 222 (2020), 1–77; arXiv:1801.00872v3. <https://arxiv.org/abs/1801.00872v3>
- **BW20II**: Olivier Benoist and Olivier Wittenberg, *On the integral Hodge conjecture for real varieties, II*, Journal de l'École polytechnique 7 (2020), 373–429; arXiv:1801.00873v3. <https://arxiv.org/abs/1801.00873v3>
- **BEN18**: Olivier Benoist, *Sums of three squares and Noether–Lefschetz loci*, Compositio Mathematica 154 (2018), 1048–1065; arXiv:1706.02053v2. <https://arxiv.org/abs/1706.02053v2>
- **VOI06**: Claire Voisin, *On integral Hodge classes on uniruled or Calabi–Yau threefolds*, Moduli Spaces and Arithmetic Geometry, Adv. Stud. Pure Math. 45 (2006), 43–73; arXiv:math/0412279v1. <https://arxiv.org/abs/math/0412279v1>
- **MVH98**: Frédéric Mangolte and Joost van Hamel, *Algebraic cycles and topology of real Enriques surfaces*, Compositio Mathematica 110 (1998), 215–237; arXiv:alg-geom/9606007v1. <https://arxiv.org/abs/alg-geom/9606007v1>
- **EKM**: Richard Elman, Nikita Karpenko and Alexander Merkurjev, *The Algebraic and Geometric Theory of Quadratic Forms*, AMS Colloquium Publications 56 (2008); author PDF, printed page numbers. <https://www.math.ucla.edu/~merkurev/Book/Kniga-final/Kniga.pdf>
- **BEC05**: Karim Johannes Becher, *On fields of u-invariant 4*, Linear Algebraic Groups and Related Structures preprint 154 (2005). <https://www.math.uni-bielefeld.de/lag/man/154.pdf>
- **VA13**: Anthony Várilly-Alvarado, *Arithmetic of del Pezzo surfaces*, Birational Geometry, Rational Curves, and Arithmetic, Springer (2013), 293–319; editor-hosted final version. <https://math.nyu.edu/~tschinke/books/simons12/final/varilly-alvarado/varilly-alvarado.pdf>
- **BCR**: Jacek Bochnak, Michel Coste and Marie-Françoise Roy, *Real Algebraic Geometry*, Ergebnisse der Mathematik und ihrer Grenzgebiete (3) 36, Springer (1998); cited by locator. <https://doi.org/10.1007/978-3-662-03718-8>
- **ARA75**: J. K. Arason, *Primideale im graduierten Wittring und im mod 2 Cohomologiering*, Mathematische Zeitschrift 145 (1975), 139–143; cited by locator. <https://doi.org/10.1007/BF01214778>
- **SPR55**: T. A. Springer, *Quadratic forms over fields with a discrete valuation. I*, Indagationes Mathematicae 17 (1955), 352–362; cited by locator. <https://doi.org/10.1016/S1385-7258(55)50049-3>
- **EL73**: R. Elman and T. Y. Lam, *Quadratic forms and the u-invariant. I*, Mathematische Zeitschrift 131 (1973), 283–304; cited by locator. <https://doi.org/10.1007/BF01174904>
- **BRO80**: L. Bröcker, *Reelle Divisoren*, Archiv der Mathematik 35 (1980), 140–143; cited by locator. <https://doi.org/10.1007/BF01235330>
- **DK96**: A. Degtyarev and V. Kharlamov, *Halves of a real Enriques surface*, Commentarii Mathematici Helvetici 71 (1996), 628–663; cited by locator. <https://doi.org/10.1007/BF02566441>
- **DIK00**: A. Degtyarev, I. Itenberg and V. Kharlamov, *Real Enriques Surfaces*, Lecture Notes in Mathematics 1746, Springer (2000); cited by locator. <https://doi.org/10.1007/BFb0103960>
- **CTP90**: J.-L. Colliot-Thélène and R. Parimala, *Real components of algebraic varieties and étale cohomology*, Inventiones Mathematicae 101 (1990), 81–99; cited by locator. <https://doi.org/10.1007/BF01231497>
- **SCH94**: C. Scheiderer, *Real and Étale Cohomology*, Lecture Notes in Mathematics 1588, Springer (1994); cited by locator. <https://doi.org/10.1007/BFb0074269>
- **SER06**: E. Sernesi, *Deformations of Algebraic Schemes*, Grundlehren 334, Springer (2006); cited by locator. <https://doi.org/10.1007/978-3-540-30615-3>
- **GG73**: M. Golubitsky and V. Guillemin, *Stable Mappings and Their Singularities*, Graduate Texts in Mathematics 14, Springer (1973); cited by locator. <https://doi.org/10.1007/978-1-4615-7904-5>
- **BRE97**: G. E. Bredon, *Sheaf Theory*, 2nd edition, Graduate Texts in Mathematics 170, Springer (1997); cited by locator. <https://doi.org/10.1007/978-1-4612-0647-7>
- **DIM85**: A. Dimca, *Monodromy and Betti numbers of weighted complete intersections*, Topology 24 (1985), 369–374; cited by locator. <https://doi.org/10.1016/0040-9383(85)90009-3>
