Verdict: design
Name: CohomologyOfGroups
Base: none
Owner: none

## Scope

The roadmap owns the homology and cohomology of an arbitrary (discrete) group `G` with
coefficients in representations over an arbitrary commutative ring `k`: hyper(co)homology of
complexes, cup and cap products, products of groups and the homology of abelian groups, group
extensions, groups acting on complexes and on trees, the finite-index and Sylow calculus, Tate
duality and periodicity for finite groups. Finite groups are always instances of statements for
arbitrary groups wherever the mathematics allows. Only Tate duality (7.3) and periodicity
(Layer 8) are theories of finite groups.

**Carriers (no second carrier).** Mathlib's `groupCohomology`, `groupHomology` and
`tateCohomology` on `Rep k G`, with `Rep.standardResolution`, `Rep.barResolution`,
`groupCohomologyIsoExt`, `groupHomologyIsoTor`, `groupCohomology.coindIso`, `groupHomology.indIso`,
`TateCohomology.isoGroupCohomology` and `TateCohomology.isoGroupHomology`. Tau Ceti's operations
on them are consumed, not rebuilt:
- corestriction `TauCeti.groupCohomology.corestriction`;
- the homological transfer `TauCeti.groupHomology.transfer`;
- inflation–restriction `TauCeti.groupCohomology.HInfRes_exact`;
- the cochain transgression lift `TauCeti.ContCohomology.IsTransgressionLift` and its descended
  cocycle `IsTransgressionLift.cocycle`, stated for any topological group. The transgression map
  `TauCeti.ContCohomology.transgression` and its five-term exactness assume a profinite group;
- the Sylow injectivity theorem
  `TauCeti.groupCohomology.eq_zero_of_pow_nsmul_eq_zero_of_map_sylow_eq_zero`;
- the Tate cup product `TauCeti.TateCohomology.cup` with `cup_assoc`, `cup_gradedComm` and
  `cup_projection`;
- the continuous cup product `TauCeti.TopPairing.cup`;
- the continuous Mackey formula `TauCeti.ContinuousCohomology.corestriction_mackey`.

**Spectral sequences.** Every spectral sequence is produced by a construction of
SpectralSequencesAndConvergencePartII (Layers 2–5: hyper-derived functors, composite functors, Tor
and Ext, products). It carries a convergence structure of SpectralSequencesAndConvergence (§3.2),
and its abutment, filtration, edge maps and naturality are named. No spectral-sequence machinery
is built here.

**Generality, against the filed wording.**
- Hyperhomology is defined for bounded-below complexes over any `k`, in both variances, and
  identified with derived-category Tor/Ext. The integral, non-negatively graded forms of
  SchemeKTheoryOperations §6.7 and K3BlochGroups §4.1 are instances.
- The cup product is for an arbitrary equivariant `k`-bilinear pairing `M ⊗ N ⟶ P` in `Rep k G`,
  not only for `M ⊗ N` itself.
- The filed "agreement with the continuous cup product for a profinite group" is restated
  correctly. For a profinite `G` and discrete coefficients, continuous cohomology is the colimit
  of the cohomology of the finite quotients (ProfiniteCohomology §10.1), and the continuous cup is
  the colimit of the discrete cups. For a group with the discrete topology, the continuous and
  discrete cups agree under a named comparison isomorphism. The abstract group cohomology of a
  profinite group is a different object and is not compared.
- The double coset formula is for any group `G`, any subgroup `H` of finite index and any
  subgroup `K`, in both variances. The finite-group formula is a Check.
- Stable elements hold for every `G`-module `M` over any `k`, in cohomology, in homology (with
  corestriction) and in Tate cohomology. The `ℤ₍ᵣ₎`-coefficient form of K3BlochGroups §5.2 is an
  instance.
- The free-action periodicity of Layer 8 is stated first algebraically: an exact sequence of
  cohomologically trivial modules from `ℤ_χ` to `ℤ`. A free cellular action on a
  finite-dimensional homology sphere is its geometric instance.
- The filed Layer 7 is titled "finite groups", but its first item holds for every group.

**Owned elsewhere and imported by name (boundaries).**
- ProfiniteCohomology (main): continuous cohomology of profinite groups, its low-degree model,
  the profinite five-term sequence (§5.5), the continuous Mackey formula (§§6.4, 10.5) and the
  continuous cup product (Layers 8, 12). Used here only in comparisons.
- ClassFieldTheory (main), Layer 0: the Tate-cohomology interface (Herbrand quotient,
  Tate–Nakayama, Nakayama–Rim, cohomological triviality). Class formations stay there.
- AlgebraicTopology (main):
  - §§4.1–4.3: cellular chains (consumed by Layer 5).
  - §5.3: the Cartan–Leray sequence of a finite regular cover. Layer 5's free case is compared
    with it, not restated.
  - §5.4: torus homology by the Pontryagin product (a Check for 3.4).
  - §8.15: non-freeness of `C_p × C_p` actions on spheres (a Check for 8.3).
- FreeGroupsAndLimitGroups (main), Layer 4: graphs of groups, `GTree` (§4.6), the Bass–Serre tree
  (§4.7), one-edge splittings as Mathlib's `Monoid.PushoutI` and `HNNExtension` (§4.5), and the
  structure theorem (§4.8). Consumed by Layer 6.
- ClassifyingSpaces (main): `K(G, 1)` models. Used only in Checks.
- SpectralSequencesAndConvergence (board design) and SpectralSequencesAndConvergencePartII (open
  target #14490): all spectral-sequence constructions, convergence and the algebraic
  Künneth/universal-coefficient spectral sequences. The Check of SpectralSequencesAndConvergencePartII
  that applies its composite-functor sequence to invariants under a normal subgroup stays there.
  This roadmap owns:
  - the identification of that sequence's `E₂` page with `Hᵖ(G/N, H^q(N, M))`;
  - its edge maps, transgression, products and low-degree consequences.
- FinitenessAndDualityOfGroups (open target #14492): finiteness types, cohomological and virtual
  cohomological dimension, duality groups, Euler characteristics and Farrell cohomology. That
  roadmap consumes this one. Nothing here uses its notions; the cohomological Künneth hypothesis
  (3.2) is stated directly on resolutions for that reason.

**Pieces already restated by roadmaps in review.** None of these owns the general theory. Each
is a local statement of an instance, listed under Consumers with the section that should import
this roadmap:
- SchemeKTheoryOperations §6.7 and K3BlochGroups §4.1: integral group hyperhomology.
- MappingClassGroupsAndCanonicalRepresentations §1.1: the cohomological Hochschild–Serre
  sequence and five-term sequence for discrete groups.
- InductionRestrictionPartII: the central-extension sequence, by hand.
- K3BlochGroups §5.2: stable elements, homology duality and periods, with `ℤ₍ᵣ₎` coefficients.
- ModularCurvesPartII §15.4: the amalgam sequence for one amalgam.

**Non-goals.**
- Continuous cohomology of profinite groups and its dimension theory (ProfiniteCohomology).
- Class formations and Tate's theorem (ClassFieldTheory).
- Classifying spaces and singular models (AlgebraicTopology, ClassifyingSpaces).
- Finiteness conditions, dimension, duality groups, Euler characteristics and Farrell
  cohomology (FinitenessAndDualityOfGroups).
- The Evens norm and finite generation of cohomology rings.
- Equivariant Tate cohomology of complexes.
- Realising periods by finite complexes (the subject of Swan, *Periodic resolutions for finite
  groups*, Ann. of Math. 72, 1960).

## Final targets

Notation: `G` a group, `k` a commutative ring, `M, N, P ∈ Rep k G`; `Hⁿ`, `Hₙ` are Mathlib's
carriers, and `Ĥⁿ` is `tateCohomology`. "Natural" means natural in the group (for compatible
pairs) and in the coefficients.

### Layer 1: coefficients in a complex

1.1 **Hyperhomology and hypercohomology.**
- *Homology.* For a chain complex `C` in `Rep k G` that is bounded below, define `Hₙ(G; C)` as the
  homology of the total complex of `P_• ⊗_G C_•`, for a projective resolution `P_•` of the trivial
  module `k`.
- *Cohomology.* For a bounded-below cochain complex `C`, define `Hⁿ(G; C)` from the product total
  complex of `Hom_G(P_•, C^•)`.
- *Invariance.* Both are independent of `P_•` by canonical isomorphisms and invariant under
  equivariant quasi-isomorphisms. Both are functorial for a group homomorphism together with a
  compatible chain map.
- *Identifications.* They are identified with `Tor`/`Ext` from the trivial module in the derived
  category of `Rep k G`. For `C` concentrated in degree 0 they are Mathlib's `groupHomology` and
  `groupCohomology`, through `groupHomologyIsoTor` and `groupCohomologyIsoExt`.

Locators: HS53 Ch. I §2 Prop. 1 (p. 111; independence of the resolution) and Ch. I §4 (p. 114;
the double complex of a cochain complex of `Π`-modules); CE56
Ch. XVII (uncertified).

1.2 **Long exact sequences.** A degreewise short exact sequence of complexes gives natural long
exact sequences in hyperhomology and in hypercohomology.

1.3 **The two spectral sequences.**
- *Statement.* For bounded-below `C`, there are natural spectral sequences
  `E¹_{p,q} = H_q(G, C_p) ⇒ H_{p+q}(G; C)`, with `d¹ = H_q(G, ∂)`, and
  `E²_{p,q} = H_p(G, H_q(C)) ⇒ H_{p+q}(G; C)`. The cohomological duals are
  `E₁^{p,q} = H^q(G, C^p)` and `E₂^{p,q} = Hᵖ(G, H^q(C))`.
- *Construction and convergence.* Both are the hyper-derived-functor sequences of
  SpectralSequencesAndConvergencePartII Layer 2 for coinvariants and for invariants. Their
  filtrations are finite in each total degree (SpectralSequencesAndConvergence §§3.2, 3.4).
- *Consequences.* If `H_i(C) = 0` for `i ≤ t`, then `H_n(G; C) = 0` for `n ≤ t`. If
  `C_p = ⊕_x k[G/G_x]`, Shapiro's lemma gives `E¹_{p,q} ≅ ⊕_x H_q(G_x, k)`.

Locators: HS53 Ch. I §5 Prop. 5 (p. 116) for the cohomological `E₂` form; CE56 Ch. XVII
(uncertified).

Checks:
- For `G = ℤ/2` and `C = ℤ` in degree 0, `H₁ = ℤ/2`.
- For `G = S₃` and `C = (ℤ[S₃/A₃] → ℤ)`, `H₀ = 0` and `H₁ = ℤ/2` although the coinvariant complex
  is acyclic.
- For the trivial group, `Hₙ(1; C) = Hₙ(C)`.

### Layer 2: products on the carriers

2.1 **Cup product.**
- *Construction.* An Alexander–Whitney diagonal approximation on `Rep.standardResolution`, and any
  two diagonal approximations are homotopic. For a morphism `μ : M ⊗ N ⟶ P` in `Rep k G`, it gives
  the cochain cup product with the Leibniz rule and a `k`-bilinear `Hᵖ(G, M) × H^q(G, N) →
  H^{p+q}(G, P)`.
- *Identities.* The cup product is unital, associative for compatible pairings, and graded
  commutative with sign `(−1)^{pq}` against the flipped pairing.
- *Naturality.* It is natural for compatible pairs, in particular for restriction to any
  subgroup, inflation from any quotient, and coefficient maps.
- *Connecting maps.* It is compatible with connecting homomorphisms in either variable: no sign on
  the left and `(−1)ᵖ` on the right. This holds for short exact sequences that stay exact after
  pairing.
- *Characterisation.* It is the unique family with these properties and the degree-0 product.

Locators: MilneCFT Ch. II Prop. 1.38 (p. 73), for an arbitrary group with `k = ℤ`, and
Prop. 1.39(a)–(c), (e) (pp. 73–74) for associativity, graded commutativity and naturality; HS53
Ch. II §1 (cochain formula); Brown82 Ch. V (checklist, uncertified).

2.2 **Projection formula.** For `H ≤ G` of finite index, `x ∈ Hᵖ(H, Res M)` and
`y ∈ H^q(G, N)`: `cor(x ∪ res y) = cor(x) ∪ y`, and the mirrored form, with
`TauCeti.groupCohomology.corestriction`. Locator: MilneCFT Ch. II Prop. 1.39(d), p. 74.

2.3 **Cap product and evaluation.**
- *Cap product.* For a pairing `M ⊗ N ⟶ P`, a natural `Hᵖ(G, M) ⊗ H_n(G, N) → H_{n−p}(G, P)` with
  `(x ∪ y) ∩ z = x ∩ (y ∩ z)`, the projection formula `f_*(f^*x ∩ z) = x ∩ f_*z` for a group
  homomorphism `f`, and its finite-index form with the transfer `TauCeti.groupHomology.transfer`.
- *Evaluation.* The pairing `Hⁿ(G, Hom_k(M, A)) ⊗ H_n(G, M) → A` for a trivial module `A`, and
  its compatibility with the cap product.

Locator: Brown82 Ch. V (checklist, uncertified).

2.4 **Agreement with the library's other cups.**
- *(a) Tate cup.* For finite `G` and `p, q ≥ 1`, under `TateCohomology.isoGroupCohomology` the cup
  of 2.1 for `μ = 𝟙 : M ⊗ N ⟶ M ⊗ N` is `TauCeti.TateCohomology.cup`. In degree 0 it agrees
  through `H⁰ ↠ Ĥ⁰`.
- *(b) Discrete topological groups.* For `G` with the discrete topology and discrete coefficients,
  there is a named natural isomorphism between Mathlib's continuous cohomology and
  `groupCohomology` in every degree. It agrees in degrees `≤ 2` with ProfiniteCohomology §3.1's
  explicit comparisons and carries `TauCeti.TopPairing.cup` to the cup of 2.1. The library has only
  the existence `TauCeti.ContCohomology.nonempty_continuousCohomology_addEquiv_groupCohomology`,
  and only for finite `G`.
- *(c) Profinite groups.* For profinite `G` and discrete `M, N`, under the finite-quotient colimit
  description of ProfiniteCohomology §10.1, `TauCeti.TopPairing.cup` is the colimit of the cups
  of 2.1 on the quotients `G/U`.

Locators: NSW (1.4.1)–(1.4.5), as ProfiniteCohomology Layer 12 uses them.

### Layer 3: products of groups and abelian groups

3.1 **Künneth formula in homology.**
- *Cross product.* For groups `G, H`, `M ∈ Rep k G` and `N ∈ Rep k H`, the natural cross product
  `H_p(G, M) ⊗_k H_q(H, N) → H_{p+q}(G × H, M ⊠ N)`.
- *Spectral sequence.* When `M` is `k`-flat, the Künneth spectral sequence
  `E²_{p,q} = ⊕_{i+j=q} Tor^k_p(H_i(G, M), H_j(H, N))` converges to `H_{p+q}(G × H, M ⊠ N)`
  (SpectralSequencesAndConvergencePartII Layer 4, applied to `k[G × H] = k[G] ⊗ k[H]`).
- *Collapse.* Over a field the cross product is an isomorphism. When `k` is hereditary (for
  instance a PID) it gives the short exact sequence with `Tor^k_1` terms, split but not
  naturally, consuming Tau Ceti's `HomologicalComplex.homologyKunnethShortComplex_shortExact`.

Locators: Loh19 Cor. 3.2.23 (p. 136) (PID, trivial coefficients); Brown82 Ch. V (uncertified).

3.2 **Cross product in cohomology.** `x × y = pr₁^*x ∪ pr₂^*y`. It is an isomorphism over a
field when the trivial module of each factor has a resolution by finitely generated projectives
in every degree. The hypothesis is stated in these words, not by a name from
FinitenessAndDualityOfGroups.

3.3 **Universal coefficient sequences.** For hereditary `k`, any group `G` and a `k`-module `A`
with trivial action, there are natural short exact sequences, split but not naturally:
- `0 → H_n(G; k) ⊗_k A → H_n(G; A) → Tor^k_1(H_{n−1}(G; k), A) → 0`;
- `0 → Ext^1_k(H_{n−1}(G; k), A) → Hⁿ(G; A) → Hom_k(H_n(G; k), A) → 0`.

The second map of the cohomological sequence is the evaluation of 2.3. Over a general `k` these
are the universal-coefficient spectral sequences of SpectralSequencesAndConvergencePartII Layer 4.
Locators: Loh19 Cor. 3.2.21 (p. 135); Tau Ceti's universal coefficient sequence
(`Algebra/Homology/UniversalCoefficient`).

3.4 **Pontryagin product.**
- *Algebra structure.* For an abelian group `A`, the multiplication `A × A → A` and 3.1 make
  `H_•(A; k)` a graded-commutative, associative, unital `k`-algebra, natural in `A`.
- *Exterior algebra.* The induced algebra map `Λ_k(A ⊗ k) → H_•(A; k)` is an isomorphism in
  degrees `≤ 2` for `k = ℤ` (so `H₂(A; ℤ) ≅ Λ²A` for every abelian `A`). It is an isomorphism in
  all degrees when `k` is a `ℚ`-algebra.
- *Finitely generated groups.* For finitely generated `A` and a field `k`, `H_•(A; k)` is computed
  from cyclic and free factors by 3.1 and Mathlib's cyclic-group computations, together with its
  algebra structure.

Locator: Brown82 Ch. V (uncertified; the designer confirms the theorem numbers).

Checks:
- `H₂(ℤ/2 × ℤ/2; ℤ) = ℤ/2`.
- `H_•(ℤⁿ; ℤ) ≅ Λ(ℤⁿ)`, compared with AlgebraicTopology §5.4 through ClassifyingSpaces' torus.

### Layer 4: extensions

4.1 **The extension spectral sequences.**
- *Statement.* For `N ◁ G`, `Q = G/N` and `M ∈ Rep k G`, there are natural spectral sequences
  `E₂^{p,q} = Hᵖ(Q, H^q(N, M)) ⇒ H^{p+q}(G, M)` and `E²_{p,q} = H_p(Q, H_q(N, M)) ⇒ H_{p+q}(G, M)`.
  `Q` acts on `H^q(N, M)` through conjugation together with the action on `M`. They are natural
  for morphisms of extensions.
- *Construction.* The cohomological one is the composite-functor sequence of `(−)^N` followed by
  `(−)^Q` (SpectralSequencesAndConvergencePartII Layer 3); the homological one uses coinvariants.
  The design proves `R^q(−)^N ≅ H^q(N, Res −)` as `Q`-representations.

Locators: HS53 Ch. I Prop. 7 (p. 117) and Ch. II Thm. 2 (p. 125); Loh19 Thm. 3.2.12 (p. 123)
and Prop. 3.2.13; CE56 Ch. XVI (uncertified).

4.2 **Edge maps.**
- *Cohomology.* `Hⁿ(Q, M^N) ↠ E_∞^{n,0} ↪ Hⁿ(G, M)` is inflation, and
  `Hⁿ(G, M) ↠ E_∞^{0,n} ↪ Hⁿ(N, M)^Q` is restriction.
- *Homology.* `H_n(N, M) → H_n(N, M)_Q ↠ E^∞_{0,n} ↪ H_n(G, M)` is the map induced by the
  inclusion, and `H_n(G, M) → H_n(Q, M_N)` is the map induced by the projection.

Locator: HS53 Ch. III §1 (p. 126).

4.3 **Transgression.**
- *Transgressive classes.* A class of `Hⁿ(N, M)` is transgressive when a cochain on `G`
  restricting to a representing cocycle has coboundary inflated from `Q`.
- *Agreement with the differential.* The cochain transgression `τ` from transgressive classes to a
  quotient of `H^{n+1}(Q, M^N)` agrees with `d_{n+1}`.
- *Degree one, for every group.* For `n = 1` every class of `H¹(N, M)^Q` is transgressive. Give
  `G` and `M` the discrete topologies. Then a lift in the sense of
  `TauCeti.ContCohomology.IsTransgressionLift` exists through a set-theoretic section of `G → Q`,
  so `τ : H¹(N, M)^Q → H²(Q, M^N)` is defined for every group. This extends
  `TauCeti.ContCohomology.transgression`, which needs a profinite group. The identification with
  Mathlib's `groupCohomology` uses the comparison of 2.4(b).
- *Trivially acting kernel.* When `N` acts trivially on `M`,
  `d₂ : Hᵖ(Q, Hom(N^ab, M)) → H^{p+2}(Q, M)` is `u ↦ −c ∪ u`. Here `c ∈ H²(Q, N^ab)` is the class
  of `1 → N^ab → G/[N, N] → Q → 1`.

Locators: HS53 Ch. III §3 (p. 128) and Ch. III §6 Thm. 4 (p. 133).

4.4 **Multiplicativity.** For a pairing `M ⊗ M' ⟶ P`, the pages carry pairings for which each
`d_r` is a derivation. On `E₂` the pairing is `(−1)^{qp'}` times the cup of Layer 2 on `Q`
applied to the cup on `N`, and it converges to the cup on `G` with its filtration. Locator: HS53
Ch. II Thm. 3 (p. 126), with the remark after it.

4.5 **Exact sequences of low degree, and Hopf's formula.**
- *Cohomological five-term sequence.*
  `0 → H¹(Q, M^N) → H¹(G, M) → H¹(N, M)^Q → H²(Q, M^N) → H²(G, M)`, with the transgression of
  4.3 as third map.
- *Degree-`m` form.* If `H^q(N, M) = 0` for `0 < q < m`, then
  `0 → H^m(Q, M^N) → H^m(G, M) → H^m(N, M)^Q → H^{m+1}(Q, M^N) → H^{m+1}(G, M)` is exact. This
  extends `TauCeti.groupCohomology.HInfRes_exact` by the transgression term.
- *Homological five-term sequence.*
  `H₂(G, M) → H₂(Q, M_N) → H₁(N, M)_Q → H₁(G, M) → H₁(Q, M_N) → 0`.
- *Hopf's formula.* For a free presentation `1 → R → F → G → 1`,
  `H₂(G; ℤ) ≅ (R ∩ [F, F])/[F, R]`, natural in presentations.
- *Corollary.* For a central extension `1 → A → E → G → 1`, the exact sequence
  `H₂(E) → H₂(G) → A → E^ab → G^ab → 0`.

Locators: HS53 Ch. III §4 Thm. 2 (p. 129); Loh19 Thm. 1.5.1 (p. 30) and Thm. 3.2.18 (p. 129).

Checks:
- `N = 1` and `N = G`.
- `ℤ/2 ⊂ ℤ/4` with `𝔽₂` coefficients: the transgression is the nonzero class.
- The split extension `ℤ/2 ⊂ ℤ/2 × ℤ/2`: the transgression is zero.

4.6 **Comparison with the profinite theory, for finite groups.** For finite `G` with the discrete
topology, the five-term sequence of 4.5 corresponds, under 2.4(b), to the explicit five-term
sequence of ProfiniteCohomology §5.5. The comparison of the whole spectral sequence with
NoncommutativeAndEquivariantIwasawa §F.3 (`arithmeticHochschildSerre`), as identified by
ArithmeticGaloisDuality R02.2.1, is placed according to Risk 3.

### Layer 5: groups acting on complexes

5.1 **Equivariant homology.**
- *Definition.* For a bounded-below chain complex `C` of `k[G]`-modules and `M ∈ Rep k G`, the
  equivariant homology is `H^G_•(C; M) := H_•(G; C ⊗ M)` (Layer 1). Equivariant cohomology is the
  dual, with long exact sequences and naturality.
- *Acyclic case.* If `C` is acyclic over `k`, with homology `k` in degree 0, then
  `H^G_•(C; M) = H_•(G, M)`.
- *G-CW complexes.* For a `G`-CW complex `X` (cells permuted, cellular action), take `C` to be the
  cellular chain complex of AlgebraicTopology §§4.1–4.3 with its `G`-action.

5.2 **The orbit spectral sequence.** Suppose each `C_p` is `⊕_{σ ∈ Σ_p} Ind_{G_σ}^G k_σ`, where
`Σ_p` is a set of representatives of the orbits of `p`-cells, `G_σ` is the stabiliser and `k_σ`
is its orientation character.
- *Statement.* Then `E¹_{p,q} = ⊕_{σ ∈ Σ_p} H_q(G_σ, k_σ ⊗ M) ⇒ H^G_{p+q}(C; M)`, and dually
  `E₁^{p,q} = ∏_σ H^q(G_σ, Hom(k_σ, M))`.
- *First differential.* `d¹` is a signed sum of maps induced by inclusions of stabilisers and
  conjugations.
- *Construction.* This is the first sequence of 1.3 followed by Shapiro's lemma.

Locators: Brown82 Ch. VII (uncertified); HS53 Ch. I §5 Prop. 5 (p. 116).

5.3 **Free actions (Cartan–Leray).**
- *Free complexes.* If every `G_σ` is trivial, then `H^G_•(C; M) = H_•(C ⊗_G M)`. In particular
  an acyclic free `C` computes `H_•(G, M)`.
- *Free cellular actions.* For a free cellular action on a CW complex `X`, the second sequence of
  1.3 is `E²_{p,q} = H_p(G, H_q(X; M)) ⇒ H_{p+q}(X/G; M)`.
- *Comparison.* For finite `G` and a regular cover, this is compared with AlgebraicTopology §5.3,
  not restated.

### Layer 6: actions on trees

6.1 **Trees.** Let `G` act on a tree `X` without inversion (`GTree`, FreeGroupsAndLimitGroups
§4.6), with orbit representatives `Σ₀` of vertices and `Σ₁` of geometric edges, and let `M` be
any representation.
- *Homology.* The natural long exact sequence
  `… → ⊕_{e ∈ Σ₁} H_n(G_e, M) → ⊕_{v ∈ Σ₀} H_n(G_v, M) → H_n(G, M) → ⊕_{e ∈ Σ₁} H_{n−1}(G_e, M) → …`.
- *Cohomology.* The dual long exact sequence
  `… → Hⁿ(G, M) → ∏_v Hⁿ(G_v, M) → ∏_e Hⁿ(G_e, M) → H^{n+1}(G, M) → …`.
- *The maps.* Vertex maps are induced by the inclusions. The edge-to-vertex maps are the
  difference of the maps to the terminal and initial vertices.
- *Proof route.* The exact sequence `0 → C₁(X) → C₀(X) → k → 0` of permutation modules, then
  Shapiro's lemma; no spectral sequence is needed. Actions with inversions are the case of 5.2 on
  the subdivided tree (a Check).

Locator: SerreArbres II §2.8 Prop. 13 (pp. 167–169).

6.2 **Amalgams and HNN extensions.**
- *Amalgams.* For `G = A *_C B` (`Monoid.PushoutI`, through FreeGroupsAndLimitGroups §§4.5, 4.7):
  `… → H_n(C) → H_n(A) ⊕ H_n(B) → H_n(G) → H_{n−1}(C) → …`, and its cohomological dual.
- *HNN extensions.* For an HNN extension of `A` along `φ : C → A` (`HNNExtension`):
  `… → H_n(C) → H_n(A) → H_n(G) → H_{n−1}(C) → …`, whose first map is the difference of the
  inclusion and `φ`.
- Both are the one-edge cases of 6.1.

Locators: SerreArbres II §2.8, the example after Prop. 13 (p. 169); Brown82 Ch. VII (uncertified).

Checks:
- `SL₂(ℤ) ≅ ℤ/4 *_{ℤ/2} ℤ/6` gives `H₁ = ℤ/12`.
- A free product gives `H_n(A * B) = H_n(A) ⊕ H_n(B)` for `n ≥ 2`.
- A free group acting on its Cayley tree gives `H₁ = ℤ^S` and `H_n = 0` for `n ≥ 2`.

### Layer 7: finite index and finite groups

7.1 **Double coset formula.** Let `G` be any group, `H ≤ G` of finite index, `K ≤ G` any
subgroup and `n ≥ 0`.
- *Cohomology.* `res^G_K ∘ cor^G_H = Σ_{KgH ∈ K\G/H} cor^K_{K ∩ gHg⁻¹} ∘ c_g ∘ res^H_{H ∩ g⁻¹Kg}`,
  each summand independent of the representative.
- *Homology.* The dual formula for the transfer followed by the inclusion-induced map.

Check: for finite `G`, agreement with `TauCeti.ContinuousCohomology.corestriction_mackey` under
2.4(b), and the `S₃` check of ProfiniteCohomology §6.4. Locator: Brown82 Ch. III §9
(uncertified).

7.2 **Stable elements.** Let `G` be finite, `p` a prime and `P` a Sylow `p`-subgroup.
- *Cohomology.* For `n ≥ 1` and any `M`, restriction maps the `p`-primary part of `Hⁿ(G, M)`
  isomorphically onto the classes `z ∈ Hⁿ(P, M)` satisfying
  `res^P_{P ∩ gPg⁻¹} z = res^{gPg⁻¹}_{P ∩ gPg⁻¹} (c_g z)` for every `g ∈ G`.
- *Homology.* Corestriction identifies the stable part of `H_n(P, M)` with the `p`-primary part of
  `H_n(G, M)`.
- *Tate cohomology.* The same holds in every Tate degree.
- *Proof route.* Injectivity is the library's Sylow theorem; the image is computed by 7.1.

Locators: MilneCFT Ch. II Prop. 1.30 (p. 70) and Cor. 1.33 (p. 71) for injectivity;
Hutchinson13 §3, p. 11 (Hutchinson13 line 482–491: the integral form with corestriction, citing
Brown III.9–III.10); Brown82 Ch. III §10 and CE56 Ch. XII (uncertified).

7.3 **Tate duality.** Let `G` be finite and `M` a `ℤ[G]`-module, with `M^∨ = Hom(M, ℚ/ℤ)`.
- *Torsion dual.* Cup product with the evaluation `M^∨ ⊗ M → ℚ/ℤ`, followed by
  `Ĥ⁻¹(G, ℚ/ℤ) ≅ ℤ/|G|`, gives isomorphisms `Ĥⁱ(G, M^∨) ≅ Hom(Ĥ^{−1−i}(G, M), ℚ/ℤ)` for all
  `i ∈ ℤ`.
- *Integral dual.* For `ℤ`-free `M`, cup into `Ĥ⁰(G, ℤ) = ℤ/|G|` gives
  `Ĥⁱ(G, Hom(M, ℤ)) ≅ Hom(Ĥ^{−i}(G, M), ℚ/ℤ)`.
- *Corollary.* `H^{d+1}(G, ℤ) ≅ Hom(H_d(G, ℤ), ℚ/ℤ)` for `d ≥ 1`, naturally.
- *Hypotheses.* The exact coefficient hypotheses of each form are those of the source; the
  designer confirms them in CE56 Ch. XII or Brown82 Ch. VI (both uncertified).

### Layer 8: periodic cohomology

8.1 **Periodicity theorem.** For a finite group `G` the following are equivalent:
- (a) for some `d > 0` and `u ∈ Ĥ^d(G, ℤ)`, cup with `u` is an isomorphism
  `Ĥⁿ(G, M) → Ĥ^{n+d}(G, M)` for every `n ∈ ℤ` and every `M`;
- (b) `Ĥ^d(G, ℤ) ≅ ℤ/|G|` for some `d ≠ 0`;
- (c) every abelian subgroup of `G` is cyclic;
- (d) every Sylow subgroup of `G` is cyclic or generalised quaternion.

The `p`-primary form also holds. Locators: CE56 Ch. XII and Brown82 Ch. VI (uncertified).

8.2 **Periods.**
- *Cyclic groups.* For `G` cyclic of order `m`, cup with a generator of `Ĥ²(G, ℤ) ≅ ℤ/m` is the
  periodicity isomorphism in every degree and for every `M`. This extends Tau Ceti's
  `Rep.FiniteCyclicGroup.periodicIso` and its degree-0 cup form
  `TauCeti.TateCohomology.cup_characterConnectingClass_eq_groupCohomologyπEven`.
- *Generalised quaternion groups.* For `Q_{2^s}` (`s ≥ 3`) the period is 4.
- *Swan's theorem.* For `p` odd with a cyclic Sylow `p`-subgroup `P`, the `p`-period is
  `2·|N_G(P)/C_G(P)|`. The 2-period is 2 for a cyclic Sylow 2-subgroup and 4 for a generalised
  quaternion one.

Locators: SwanPPeriod60 Thms. 1 and 2 (waived: cited by its locator, without the text); the
open restatement Hutchinson13 Thm. 3.1, p. 12 (Hutchinson13 line 499–504).

8.3 **Free actions on homology spheres.** Let `G` be finite.
- *Algebraic form.* An exact sequence `0 → ℤ_χ → C_n → … → C_0 → ℤ → 0` with every `C_i`
  cohomologically trivial gives `Ĥⁱ(G, M) ≅ Ĥ^{i+n+1}(G, M ⊗ ℤ_χ)` by cup with its class.
- *Geometric instance.* A free cellular action of `G` on a finite-dimensional CW complex with the
  integral homology of `Sⁿ` makes the cohomology periodic. The period divides `2(n+1)`, and
  divides `n+1` when `G` acts trivially on `H_n`.

Locators: Loh19 Thm. 4.3.7 (p. 165), for spheres; Brown82 Ch. VI (uncertified).

Checks:
- `C_p × C_p` is not periodic, consistent with AlgebraicTopology §8.15.
- `SL₂(𝔽_q)` for odd `q` has 2-period 4.

## Suppliers

All on main except the two spectral-sequence roadmaps, which are on the board and not yet in the
merge order.

- **Mathlib** (pinned): the carriers and maps named under Scope; `Rep.FiniteCyclicGroup`
  resolutions and computations; `Monoid.PushoutI`, `HNNExtension`, `DoubleCoset`, `Sylow`; Ext/Tor
  in `Rep k G`.
- **Tau Ceti** (pinned): the operations named under Scope. These include the cochain
  transgression lift (`RepresentationTheory/Homological/ContCohomology/Transgression`) and the
  cyclic-group periodicity of Tate cohomology (`RepresentationTheory/Homological/TateCohomology/`
  `Periodic` and `Cup/Cyclic`). Also its algebraic Künneth sequence and
  universal coefficient sequence (`Algebra/Homology/Monoidal/Homology/Kunneth`,
  `Algebra/Homology/UniversalCoefficient`), and its first-quadrant bicomplex spectral sequences
  (`Algebra/Homology/SpectralSequence/Bicomplex`).
- **SpectralSequencesAndConvergence** (board design): §3.2 convergence structures, §3.3 morphisms,
  §3.4 finite filtrations, §3.5 the comparison theorem, §4.5 convergence of Mathlib's quadrant
  sequences, §§5.1–5.4 filtered complexes.
- **SpectralSequencesAndConvergencePartII** (open target #14490): Layer 1 double complexes, Layer 2
  hyper-derived functors and their two spectral sequences, Layer 3 the composite-functor sequence,
  Layer 4 Künneth and universal-coefficient sequences, Layer 5 products.
- **ProfiniteCohomology** (main): §3.1, §5.5, §§6.4 and 10.5, §10.1, Layer 12 (comparisons in 2.4,
  4.6 and 7.1).
- **ClassFieldTheory** (main): Layer 0 (the Tate-cohomology interface and cohomological triviality
  used in 7.3 and Layer 8).
- **AlgebraicTopology** (main): §§4.1–4.3 (Layer 5), §5.3 (comparison in 5.3), §§5.4 and 8.15
  (Checks).
- **FreeGroupsAndLimitGroups** (main): §§4.5–4.8 (Layer 6).
- **ClassifyingSpaces** (main): `K(G, 1)` models, for Checks only.

## Consumers

- **FinitenessAndDualityOfGroups** (open target #14492). It consumes products and cap products
  (duality groups), Layer 4 (inheritance by extensions), Layer 6 (amalgams, Euler characteristics)
  and Layers 7–8 (Farrell cohomology against Tate cohomology).
- **SchemeKTheoryOperations** §6.7 and **HomologicalStabilityOfGeneralLinearGroups** (#2036, which
  uses §6.7): Layer 1, with 1.3's permutation-module form.
- **K3BlochGroups**:
  - §4.1: Layer 1.
  - §4.15: Layer 4.
  - §5.2, the targets `finiteGroup_stableElements`, `finiteGroup_homologyDuality`,
    `quaternionPeriodicHomology` and `finiteGroup_period_fromSylow`: 7.2, 7.3 and 8.2.
- **InductionRestrictionPartII**: the central-extension sequence and Hopf's formula (4.5).
- **MappingClassGroupsAndCanonicalRepresentations** (#2266) §1.1: Layer 4.
- **ModularCurvesPartII** §15.4, **AutomorphyLiftingBeyondTaylorWiles** and
  **ArithmeticLocallySymmetricSpacesPartII** (WM.5): 6.2.
- **InverseGaloisAndArithmeticFundamentalGroups**: Schur multipliers and Hopf's formula (4.5).
- **ArithmeticLocallySymmetricSpaces**: Layers 4–5.
- **NoncommutativeAndEquivariantIwasawa** §F.3 and **ArithmeticGaloisDuality** R02.2: the
  finite-group comparison of 4.6.

## Sources

Certified (read for this triage; locators checked in the cached text):
- **HS53**: G. Hochschild, J.-P. Serre, *Cohomology of group extensions*, Trans. AMS 74 (1953),
  AMS open back file (`publisher-open`).
  - Ch. I §2 Prop. 1 (p. 111), §4 (p. 114) and §5 Prop. 5 (p. 116): hypercohomology and the
    Cartan–Leray sequence.
  - Ch. I Prop. 7 (p. 117) and Ch. II Thm. 2 (p. 125): `E₂`.
  - Ch. II §1 (cochain cup product) and §5 Thm. 3 (p. 126): products.
  - Ch. III §1 (p. 126): edge maps.
  - Ch. III §3 (p. 128) and §4 Thm. 2 (p. 129): transgression and the degree-`m` sequence.
  - Ch. III §6 Thm. 4 (p. 133): `d₂ = −c ∪`.
  - HS53 line 30–38: its two constructions are not known to agree beyond `E₂`.
- **Loh19**: C. Löh, *Group Cohomology*, lecture notes, Regensburg 2019 (`author-page`).
  - Thm. 1.5.1 (p. 30) and Thm. 3.2.18 (p. 129): Hopf.
  - Thm. 3.2.12 and Prop. 3.2.13 (pp. 123–124): extension sequences.
  - Cor. 3.2.21 and 3.2.23 (pp. 135–136): universal coefficients and Künneth.
  - Thms. 4.3.3 and 4.3.7 (p. 165): sphere actions.
- **MilneCFT**: J. S. Milne, *Class Field Theory* v4.03 (author's page). Ch. II Prop. 1.30 and
  Cor. 1.33 (pp. 70–71); Props. 1.38–1.39 (pp. 73–74).
- **SerreArbres**: J.-P. Serre, *Arbres, amalgames, SL₂*, Astérisque 46, II §2.8 Prop. 13 and the
  following example (pp. 167–169) (Numdam).
- **Hutchinson13**: K. Hutchinson, arXiv:1107.0264v2, §3 (p. 11) and Thm. 3.1 (p. 12) (arXiv),
  an open secondary statement of the stable-element theorem and of Swan's theorems.
- **NSW**: Neukirch–Schmidt–Wingberg, *Cohomology of Number Fields*, online version 2.3
  (`author-page`). The service recorded the landing page, not the PDF. It is cited only through
  ProfiniteCohomology and ArithmeticGaloisDuality for the profinite comparisons; the designer
  confirms the locators in the PDF.

Uncertified (paywalled, cited by locator):
- **Brown82**: K. S. Brown, *Cohomology of Groups*, GTM 87, Chapters III, V, VI, VII. A coverage
  checklist only; its chapter order is not followed.
- **CE56**: H. Cartan, S. Eilenberg, *Homological Algebra*, Chapters XII, XVI, XVII; section
  numbers to be confirmed.

Waived (cited by its locator, without the text; settled by a human answer):
- **SwanPPeriod60**: R. G. Swan, *The p-period of a finite group*, Illinois J. Math. 4 (1960),
  pp. 341–346, DOI 10.1215/ijm/1255456050, Thms. 1 and 2, for 8.2. Its statements are checked
  against the open restatement in Hutchinson13 Thm. 3.1.

Dropped from the filed list, with reasons in the report: Lyndon (1948); Swan, *Periodic
resolutions* (1960); Hopf (1942).

## Risks

1. **Undesigned spectral-sequence suppliers.** SpectralSequencesAndConvergence is a design whose
   latest review asks for changes, and SpectralSequencesAndConvergencePartII is a target still
   waiting for references. Layers 1.3, 3.1, 4.1–4.4 and 5.2 cannot be given exact supplier names
   until those designs fix their sections. Mitigation: the design builds first what needs no
   spectral sequence: Layer 2, 3.3–3.4, 4.5 by the cochain route of HS53 Ch. III, Layer 6
   (Serre's direct proof), and Layers 7–8.
2. **Products on the extension sequence.** HS53 proves multiplicativity (Ch. II Thm. 3) for its
   direct filtration of cochains, not for the composite-functor sequence, and says it does not
   know whether the two sequences agree beyond `E₂` (HS53 line 30–38). Products for a composite
   functor are offered by SpectralSequencesAndConvergencePartII Layer 5 only "in the generality
   in which a proof is written down". The design must pick one model for Layer 4. It then either
   proves 4.4 for it, or builds HS53's filtration and compares it from `E₂` on.
3. **Direction of supply against the filed plan.** The filed text records comparisons with
   roadmaps in review and expects them later to import this one. Both cannot hold without a cycle.
   - *Restaters and their merge-order lines:* SchemeKTheoryOperations (37),
     InductionRestrictionPartII (64), ModularCurvesPartII (71), K3BlochGroups (139),
     MappingClassGroupsAndCanonicalRepresentations (293). The profinite comparison roadmaps are
     NoncommutativeAndEquivariantIwasawa (30) and ArithmeticGaloisDuality (61).
   - *Recommendation.* This roadmap depends only on main, Mathlib, Tau Ceti and the two
     spectral-sequence roadmaps, and is ordered before all of those roadmaps. Their comparisons
     and imports are then made in their own revisions (listed under Consumers). Only comparisons
     with roadmaps on main are stated here.
   - *Alternative.* If the design keeps the comparisons here, it must be ordered after line 293,
     and none of those sections can ever import it.
4. **Continuous–discrete comparison.** The library has only the bare existence of an additive
   equivalence, and only for finite discrete groups. 2.4(b) asks for a named natural isomorphism
   in all degrees for every discrete group. ProfiniteCohomology owns the low-degree comparisons;
   the design confirms that the all-degree comparison for discrete groups is this roadmap's target.
5. **G-CW complexes.** No roadmap or library owns `G`-CW complexes or the `G`-action on cellular
   chains. Mathlib's `Topology.CWComplex` is not equivariant, and AlgebraicTopology §4 has
   non-equivariant cellular chains. The algebraic statements of 5.2, 5.3 and 8.3 are therefore the
   headlines; the `G`-CW forms are instances that may stay statable only as README targets.
6. **Paywalled and waived sources.** Tate duality (7.3) and the periodicity theorem (8.1) have
   only paywalled sources (CE56, Brown82, both uncertified). The design should look for open
   expositions before relying on locators alone. Swan's p-period theorem (8.2) is waived and cited
   by its locator. Its only text read here is Hutchinson's restatement, so the design's proof
   sketch of 8.2 cannot be checked against Swan's own argument.
7. **Conventions.**
   - The library's "corestriction" is the cohomological transfer, while the homological map
     induced by an inclusion is also often called corestriction. The design fixes one vocabulary.
   - Mathlib's carriers put `k` and `G` in one universe.
   - The Tate cup is defined only for the tensor pairing `M ⊗ N`, so 2.4(a) composes with `μ`.
