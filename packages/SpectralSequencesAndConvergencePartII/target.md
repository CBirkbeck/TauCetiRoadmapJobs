Verdict: part-ii
Name: SpectralSequencesAndConvergencePartII
Base: SpectralSequencesAndConvergence
Owner: none

## Scope

**Spectral sequences and convergence, Part II: the standard constructions in an abelian category,
and their products.** The base roadmap SpectralSequencesAndConvergence (a board design in review,
`packages/SpectralSequencesAndConvergence/design/README.md`) owns the common language: limit
pages, convergence structures in a set of total degrees (§3.2), morphisms of converging sequences
(§3.3), finite filtrations (§3.4), the comparison theorem (§3.5), the vanishing, two-row,
two-column, edge-morphism and five-term consequences (§3.6), the convergence of Mathlib's quadrant
spectral objects (§4.5), the classical indexing and the convergence of the spectral sequence of a
filtered complex (§§5.1–5.4), exact couples with their towers and their identification with
filtered complexes (§§6.1–6.3), and the complete convergence theorem (§7.5). It states no
particular construction beyond filtered complexes and exact couples, and it excludes products
(base README, *Scope and ownership*, last paragraph). This Part II starts there: it owns the
standard constructions that produce particular spectral sequences — double complexes,
Cartan–Eilenberg resolutions and hyper-derived functors, composite functors, Tor and Ext over
rings, the Bockstein exact couple — and pairings on pages.

**Contract with the base.** Every spectral sequence here is produced as a filtered complex, an
exact couple or a spectral object of the base and carries a convergence structure of base §3.2.
Every statement names the abutment, its filtration, the edge maps (base §3.6) and the naturality
(base §3.3). A later layer obtains its sequence from an earlier one wherever that route is known;
nothing is stated twice.

**Carriers.** Pages are Mathlib's `CategoryTheory.SpectralSequence` (cohomological instances),
convergence is the base's. Double complexes are Mathlib's `HomologicalComplex₂` with
`HomologicalComplex₂.total` (sign `d₁ + (−1)^p d₂`, symmetry `HomologicalComplex₂.totalFlipIso`;
the same convention of commuting differentials and a sign on the second one as
`grothendieck1957` line 1266–1268);
the product totalisation does not exist at the pin and is a definition of this roadmap. Derived
functors are Mathlib's `CategoryTheory.Functor.rightDerivedFunctorPlus` on
`DerivedCategory.Plus` and the classical `Functor.rightDerived`/`Functor.leftDerived`; Tor is
Mathlib's `CategoryTheory.Tor` (second variable derived) and `CategoryTheory.Tor'` (first
variable); Ext is Mathlib's `CategoryTheory.Abelian.Ext`. No second carrier is introduced.

**Already owned elsewhere (imported by name, never restated).**

- *DerivedModuleAlgebra* (main), §S.1 *The spectral sequence of a first-quadrant double complex*:
  for a first-quadrant double complex in an abelian category, the column-filtration sequence with
  `E₂ = H_I(H_II)`, its abutment filtration and stabilisation bound, the edge morphisms, the
  five-term and extended sequences, the exact-rows comparison, naturality, and the homological
  form. Layer 1 adds only what §S.1 lacks.
- *Tau Ceti* (pin): `HomologicalComplex₂.rowFiltrationSpectralSequence` and
  `HomologicalComplex₂.columnFiltrationSpectralSequence` with first pages and convergence for
  first-quadrant homological bicomplexes (`TauCeti/Algebra/Homology/SpectralSequence/Bicomplex.lean`);
  `HomologicalComplex₂.quasiIso_total_map_of_rows` and
  `HomologicalComplex₂.quasiIso_totalAugmentation_of_rows` (a map of first-quadrant bicomplexes
  that is a quasi-isomorphism on every row, and exact augmented rows, give quasi-isomorphisms of
  totals: the first-quadrant case of target 1.3 and of the acyclic assembly lemma 1.4); the Künneth
  map and short exact sequence `HomologicalComplex.homologyKunnethShortComplex_shortExact` with its
  splitting, over rings whose modules have projective dimension at most one; the universal
  coefficient sequence `TauCeti.ChainComplex.exact_extToHomology_kronecker`; `Tor` from length-one
  presentations (`TauCeti/CategoryTheory/Monoidal/Tor.lean`); K-flat complexes
  (`TauCeti/Algebra/Homology/Monoidal/KFlat`).
- *Mathlib* (pin): `Abelian.Ext` is computed both from projective resolutions of the first
  variable and from injective resolutions of the second (`CategoryTheory.ProjectiveResolution` and
  `CategoryTheory.InjectiveResolution` Ext files). The balancing of Ext is therefore a Check here,
  not a target; the balancing of Tor (`Tor ≅ Tor'`) is an open Mathlib TODO
  (`Mathlib/CategoryTheory/Monoidal/Tor.lean`) and is a target.
- *ArithmeticGaloisDuality* (#858, merge order line 61), §D7.1, target *Derived composite spectral
  sequence*: for left exact functors `F : 𝒜 → ℬ`, `H : ℬ → 𝒞` with `𝒜, ℬ` having enough
  injectives and `F` sending injectives to `H`-acyclic objects, the natural first-quadrant sequence
  `E₂^{a,b} = R^aH(R^bF X) ⇒ R^{a+b}(H∘F)X` with finite filtrations and edge maps identified with
  the canonical maps, with its Checks. The filed text calls this "named in passing"; it is a stated
  target with a proof route there. Layer 3 imports it and adds only what it lacks.
- *AlgebraicTopology* (main), §5.1: the Künneth spectral sequence of singular homology of `X × Y`
  over any commutative ring, with its collapse to Tau Ceti's Künneth sequences: a topological
  instance of target 4.1 (Check).
- *SchemeAndStackFoundations* (main), §2.2 (`leray_spectral_sequence`, including the relative form
  for a composite, and `cech_to_cohomology`), §2.7 (`localToGlobal` for supports) and §2.15
  (`hochschildSerre_galois_covering`): geometric instances (Checks).
- *DGFloer* (main), Layer 1 item 2: the multiplicative Serre spectral sequence with `d_r` a
  derivation; a topological instance of Layer 5 (Check).

**Not in scope.** Everything the base owns; the Serre, Eilenberg–Moore, Adams, Atiyah–Hirzebruch,
coniveau and descent spectral sequences; any spectral sequence of one cohomology theory; the
spectral sequences of group extensions and group hyperhomology (CohomologyOfGroups, a consumer);
graded Tor over graded algebras (ArithmeticStatisticsPartVIII §5.16, an instance).

## Final targets

*Conventions.* `𝒜, ℬ, 𝒞` are abelian categories. Indexing is the base's: cohomological,
`E_r^{p,q}` with `d_r` of bidegree `(r, 1 − r)`, decreasing filtrations, the homological form a
mirror image through the base's bidegree assignments (base §2.1). "Converges" means a convergence
structure of base §3.2 (weak, ordinary or strong as stated), "edge maps" and "five-term sequence"
are those of base §3.6, and naturality is a morphism of converging sequences (base §3.3). Locators
`stacks-012K`, `stacks-05QI` and `stacks-more-algebra` are the Stacks chapters *Homological
Algebra*, *Derived Categories* and *More on Algebra*, and `grothendieck1957` is the Tôhoku paper,
all cited as `<id> line N`; Weibel, McCleary,
Cartan–Eilenberg and Massey are uncertified, cited by locator only, numbers to be confirmed by the
designer.

### Layer 1: double complexes

1.1 **The two spectral sequences.** For a double complex `K` in `𝒜` whose totalisation exists —
(a) finitely many nonzero `K^{p,q}` on each antidiagonal, in any `𝒜`; (b) the direct-sum
totalisation `Tot^⊕` when `𝒜` has countable coproducts; (c) the product totalisation `Tot^Π`
(to be defined) when `𝒜` has countable products — define the column filtration
`F_I^p = ⊕/∏_{i≥p} K^{i,•}` and the row filtration `F_II^p`, and the two spectral sequences `′E`,
`″E` as base §5.1 sequences of these filtered complexes. Identify `′E_1^{p,q} = H^q(K^{p,•})` with
`d_1` induced by the horizontal differential, `′E_2 = H_I^p(H_II^q(K))`, `″E_2 = H_II^p(H_I^q(K))`
(`stacks-012K` line 3241–3265, §12.25, tags 012X, 0130; totalisation and its existence,
`stacks-012K` line 2154–2164, Definition 12.18.3, tag 012Z; for finite antidiagonals, with both
sequences functorial in `K`, `grothendieck1957` line 1226–1235, (2.4.1)). Naturality in `K` through Tau Ceti's
`CochainComplex.filtrationFunctorMap`. In the first-quadrant case these are DerivedModuleAlgebra
§S.1's sequence and its transpose; that case is imported.

1.2 **Convergence.** (a) Finite antidiagonals: both sequences converge strongly with finite
filtrations in every degree (`stacks-012K` line 3284–3291, Lemma 12.25.3, tag 0132), through base
§§3.4, 5.3; the first- and third-quadrant cases are instances (base §4.5). (b) Half-plane cases:
each filtration converges by the base theorem matching its behaviour — on `Tot^⊕`, a filtration
that is exhaustive and bounded below in each total degree (base §5.4's hypotheses) converges
strongly by base §5.4 (exact sequential colimits); on `Tot^Π`, an exhaustive complete filtration
converges by base §7.5, with strong convergence under its half-plane criterion. State the right and upper half-plane cases
explicitly with their totalisation (Weibel §5.6, uncertified). The filed "under the half-plane
hypotheses that the convergence roadmap supplies" is exactly these two base theorems; no
convergence theory is restated.

1.3 **Quasi-isomorphisms of totals.** A morphism of double complexes that is a quasi-isomorphism
on every column (or every row) induces a quasi-isomorphism of totalisations under each boundedness
of 1.2 for which the matching filtration converges, by the base comparison theorem (§3.5). The
first-quadrant homological case is Tau Ceti's `HomologicalComplex₂.quasiIso_total_map_of_rows`.

1.4 **Acyclic assembly.** `Tot^Π(K)` is acyclic if `K` is upper half-plane with exact columns or
right half-plane with exact rows; `Tot^⊕(K)` is acyclic if `K` is upper half-plane with exact rows
or right half-plane with exact columns (Weibel §2.7, the acyclic assembly lemma, uncertified, for
modules; `stacks-012K` line 3293–3303, Lemma 12.25.4, tag 0133, for finite antidiagonals in any
`𝒜`; `stacks-012K` line 3347–3444, §12.26, tags 0E1Q, 09IZ, 09J0, 0E1R, for resolutions of
complexes of abelian groups by `Tot^⊕` and `Tot^Π`). *Generality:* Stacks proves the half-plane
statements only for abelian groups and warns that the general case is not written
(`stacks-012K` line 3348–3351). State them for `𝒜` with exact countable coproducts (for `Tot^⊕`)
or exact countable products (for `Tot^Π`), in Mathlib's classes as the base fixes them, if the
proof goes through; modules over a ring are the guaranteed instance.

1.5 **Balancing Tor.** For a commutative ring `R`, a natural isomorphism
`Tor_n(M, N) ≅ Tor'_n(M, N)` between Mathlib's two derived tensor functors on `ModuleCat R`, by the
double complex `P ⊗ Q` of projective resolutions and 1.3; more generally in a monoidal abelian
category with enough projectives in which tensoring with a projective object is exact in either
variable, if the design keeps that generality (Weibel §2.7, uncertified). Check: Mathlib's
`Abelian.Ext` computed from a projective resolution of `X` and from an injective resolution of `Y`
agree, and the double complex `Hom(P, I)` recovers the comparison.

### Layer 2: Cartan–Eilenberg resolutions and hyper-derived functors

2.1 **Cartan–Eilenberg resolutions.** For `𝒜` with enough injectives and a bounded-below cochain
complex `K`: define a Cartan–Eilenberg resolution (double complex `I`, augmentation `K → I^{•,0}`,
columns injective resolutions of `K^p`, and of its cycles, boundaries and cohomology) and prove its
existence (`stacks-05QI` line 3621–3654, Definition 13.21.1 and Lemma 13.21.2, tags 015H, 015I).
Every chain map `K → L` lifts to a map of Cartan–Eilenberg resolutions, unique up to homotopy of
double complexes, so two resolutions of `K` are homotopy equivalent and `Tot(I)` is an injective
resolution of `K` (Weibel §5.7 and Cartan–Eilenberg Ch. XVII §1, uncertified; Stacks asserts the functoriality
and defers its proof to the filtered derived category, `stacks-05QI` line 3690–3695, Remark
13.21.4, tag 015K; `grothendieck1957` line 1253–1277 describes the same resolution and an
injective resolution in the abelian category of complexes, asserts that each is unique up to
homotopy equivalence of double complexes, and refers the proofs to Cartan–Eilenberg). No open
source writes the uniqueness proof out; the design writes it from the definition. Dual: `𝒜`
with enough projectives, bounded-above complexes, projective Cartan–Eilenberg resolutions.

2.2 **Hyper-derived functors.** For a left exact (additive) `F : 𝒜 → ℬ`, `𝒜` with enough
injectives, `R^nF(K) := H^n(F.rightDerivedFunctorPlus K)` for `K` in `DerivedCategory.Plus 𝒜`;
identify it with `H^n(F(Tot I))` for every Cartan–Eilenberg resolution `I` of a representative
(`stacks-05QI` line 3662–3668, the remarks opening the proof of Lemma 13.21.3; independence of the
resolution, `grothendieck1957` line 1277–1291), and for `K = A[0]`
with the classical `F.rightDerived n A`, naturally.

2.3 **The two hypercohomology spectral sequences.** For `F` as in 2.2 and bounded-below `K`, the two
sequences of the double complex `F(I)` (Layer 1): `′E_1^{p,q} = R^qF(K^p)`, `d_1` induced by the
differential of `K`, and `″E_2^{p,q} = R^pF(H^q(K))`; both are bounded, converge strongly to
`R^{p+q}F(K)` with finite filtrations, and are natural in `K` (`stacks-05QI` line 3655–3689, Lemma
13.21.3, tag 015J; `grothendieck1957` line 1236–1252, (2.4.2), and line 1291–1299). The second
depends only on the class of `K` in `D⁺(𝒜)`; a quasi-isomorphism induces an isomorphism of
converging second sequences from `E₂` on. The second sequence may be computed from any
resolution of the kind in 2.1 whose terms are `F`-acyclic instead of injective
(`grothendieck1957` line 1295–1298); both degenerate cases (`K` a resolution of an object, and
`K` with `F`-acyclic terms, so that acyclic resolutions compute `R^nF`) are stated as corollaries
(`grothendieck1957` line 1348–1360, Remarque 3).

2.4 **The duals.** For a right exact `F` and `𝒜` with enough projectives, the hyper-left-derived
functors of bounded-above complexes and the two sequences `E^1_{p,q} = L_qF(K_p)`,
`E^2_{p,q} = L_pF(H_q(K))`; contravariant functors (for instance `Hom(−, M)`) through opposite
categories. Mathlib has no `D⁻` left derived functor at the pin; the design states the duals
through `𝒜ᵒᵖ` or defines them from projective Cartan–Eilenberg resolutions and says which
(`grothendieck1957` line 1304–1308 names the left-derived and contravariant variants without
developing them). The extension to unbounded `K` for `F` of finite injective dimension is
signalled without proof at `grothendieck1957` line 1299–1304 and is not a target.

### Layer 3: the composite-functor spectral sequence

3.1 **Composition on `D⁺`.** For left exact `F : 𝒜 → ℬ`, `G : ℬ → 𝒞` with `𝒜, ℬ` having enough
injectives, the canonical transformation `R(G∘F) → RG ∘ RF` of Mathlib's
`rightDerivedFunctorPlus` functors is an isomorphism if and only if `F` sends injective objects to
`G`-acyclic objects (`stacks-05QI` line 3696–3717, Lemma 13.22.1, tags 015L, 015M). State also the
equivalent form of the condition that is checked in practice: the functors `(R^qG)∘F`, `q > 0`,
are effaceable, that is, every object of `𝒜` embeds in one that `F` sends to a `G`-acyclic object
(`grothendieck1957` line 1338–1342, Remarque 1).

3.2 **The sequence for complexes, and its identification.** Under 3.1's condition, for `X` in
`D⁺(𝒜)`: the spectral sequence `E₂^{p,q} = R^pG(H^q(RF(X))) ⇒ R^{p+q}(G∘F)(X)`, bounded, strongly
convergent with finite filtrations (`stacks-05QI` line 3718–3730, Lemma 13.22.2, tag 015N), obtained
as the second hypercohomology sequence of `G` (2.3) applied to `RF(X)` and transported along 3.1.
For `X = A[0]` this is Grothendieck's theorem (`grothendieck1957` line 1330–1337, Théorème
2.4.1, constructed at line 1309–1329), and it may be computed from `F` applied to any resolution
of `A` by `F`-acyclic objects (`grothendieck1957` line 1343–1347, Remarque 2; line 1516–1518,
Proposition 2.5.4). Identify it, pages, filtration and edge maps, with ArithmeticGaloisDuality
§D7.1's sequence (imported, not restated).

3.3 **Edge maps, low degrees and naturality.** Identify the two edge maps with the canonical maps
`R^pG(F A) → R^p(G∘F)(A)` and `R^q(G∘F)(A) → G(R^qF A)`, and deduce from base §3.6 the five-term
exact sequence `0 → R¹G(FA) → R¹(G∘F)A → G(R¹FA) → R²G(FA) → R²(G∘F)A` and its extension when
`R^qF A = 0` for `0 < q < m`. Naturality in `A` and in natural transformations of `F` and `G`
compatible with the acyclicity condition. Optional, at the design's choice: for a commuting
square of left exact functors `G∘F ≅ F'∘G'` satisfying both acyclicity conditions, the two
composite sequences are the two
hypercohomology sequences of one complex (`grothendieck1957` line 1530–1570, Proposition 2.5.5 and
its Corollaire, proved there for functors with resolving functors in the sense of §2.5).

3.4 **The homological dual.** For right exact `F`, `G` with enough projectives and `F` sending
projectives to `G`-acyclic objects: `L(G∘F) ≅ LG ∘ LF` and `E²_{p,q} = L_pG(L_qF A) ⇒
L_{p+q}(G∘F)A` with the same edge-map, low-degree and naturality statements; mixed-variance
composites (a right exact covariant functor followed by a contravariant left exact one) through
opposite categories, as Layer 4 needs.

### Layer 4: Tor and Ext over rings

4.1 **Künneth spectral sequence.** For a commutative ring `R` and `K, L` in `D⁻(R)`
(cohomologically bounded above, that is, chain complexes bounded below): a spectral sequence with
`E₂^{p,q} = ⊕_{i+j=q} Tor^R_{−p}(H^i(K), H^j(L))` converging strongly to `H^{p+q}(K ⊗^L L)`, with
finitely many nonzero terms in each total degree, natural in `K` and `L` (`stacks-more-algebra`
line 7399–7412, Lemma 15.65.4, tag 0H7Z, proved there for `D^b(R)`; the extension to `D⁻(R)` is
the generality the consumers use and is part of this target). When `K` is a bounded-above complex
of flat modules, `Tot(K ⊗ L)` computes `K ⊗^L L` (Tau Ceti `KFlat`), which gives the filed
"one factor bounded below and flat" form as a corollary. Over a ring of global dimension at most
one the sequence has two columns and base §3.6 gives the short exact sequences
(`stacks-more-algebra` line 7413–7420, Example 15.65.5, tag 0H80); Check: they agree with Tau Ceti's
`HomologicalComplex.homologyKunnethShortComplex_shortExact`.

4.2 **Universal-coefficient spectral sequences.** (a) Tor form: `L = M[0]` in 4.1,
`E₂ = Tor^R_{−p}(H^q(K), M) ⇒ H^{p+q}(K ⊗^L M)` (`stacks-more-algebra` line 7121–7134, Example
15.63.1, tag 061Z). (b) Hom form, for any ring `R`: for a bounded-above (cohomological) complex `P`
of projective modules and a module `M`, `E₂^{p,q} = Ext^p_R(H^{−q}(P), M) ⇒ H^{p+q}(Hom_R(P, M))`,
as the second hypercohomology sequence (2.3–2.4) of `Hom_R(−, M)`; and for `K` in `D⁺(R)`,
`E₂ = Ext^i_R(M, H^j(K)) ⇒ Ext^{i+j}_R(M, K)` (`stacks-more-algebra` line 8115–8127, §15.69, tags
0AVG, 0AVH, 0AVI). Check: over a hereditary ring the two-column degeneration is Tau Ceti's
`TauCeti.ChainComplex.exact_extToHomology_kronecker`.

4.3 **Change of rings.** For a ring map `R → S`: (a) with `R`, `S` commutative (Mathlib's `Tor`
carrier), an `R`-module `M` and an `S`-module `N`, `E₂ = Tor^S_p(Tor^R_q(M, S), N) ⇒
Tor^R_{p+q}(M, N)` (`stacks-more-algebra` line 7135–7140, Example 15.63.2, tag 068F; Weibel §5.6,
the base-change theorem for Tor, uncertified), as 3.4 for `M ↦ M ⊗_R S` followed by `− ⊗_S N`;
(b) for any rings, `E₂ = Ext^p_S(N, Ext^q_R(S, M)) ⇒ Ext^{p+q}_R(N, M)` (3.2 for
`Hom_R(N, −) = Hom_S(N, Hom_R(S, −))`, `Hom_R(S, −)` preserving injectives as a right adjoint of
the exact restriction) and `E₂ = Ext^p_S(Tor^R_q(M, S), N) ⇒ Ext^{p+q}_R(M, N)` (the
mixed-variance case of 3.4, `− ⊗_R S` preserving projectives), with `Tor^R_q(M, S)` read in
`ModuleCat` when `R` is not commutative (Cartan–Eilenberg Ch. XVI, the change-of-rings
sections, uncertified). Edge maps and five-term sequences from 3.3.

4.4 **Graded and geometric instances (Checks, not restated).** ArithmeticStatisticsPartVIII §5.16
*Tor spectral sequences over graded algebras* (graded balance, universal coefficients,
hyperhomology, change of rings over nonnegatively graded, not necessarily commutative algebras)
is the graded instance of 1.5, 2.4, 4.2 and 3.4 in graded module categories; ArithmeticLocallySymmetricSpaces
ALS.1.7's coefficient-change sequence for `RΓ(X_K, V)` is an instance of 4.2(a).

### Layer 5: products

5.1 **Pairings of filtered complexes.** For a commutative ring `R`, decreasingly filtered cochain
complexes of `R`-modules `A`, `B`, `C` and a chain map `φ : Tot(A ⊗_R B) → C` with
`φ(F^pA ⊗ F^qB) ⊆ F^{p+q}C`: pairings `E_r(A) ⊗ E_r(B) → E_r(C)` for all `r`, through the Künneth
map of pages, such that `d_r` is a derivation with the Koszul sign of the total degree, the pairing
on page `r + 1` is the one induced on homology by page `r`, and, when the three sequences converge
(base §§5.3–5.4), the limit pairing is the one induced on associated graded objects by
`H(A) ⊗ H(B) → H(C)` (`may-primer` line 295–324). Natural in the data.

5.2 **Pairings of exact couples and of spectral objects.** Massey's conditions `μ_n` for a pairing
of exact couples of modules, their inheritance by derived couples, and the Leibniz rule on every
page (`may-primer` line 249–287, Proposition 4.1 and Corollary 4.2; Massey 1954, uncertified),
with 5.1 recovered through the exact couple of a filtered complex (base §6.3). The pairing of
spectral objects (spectral systems) with its Koszul rule is stated by Douady (`douady1959`
line 143–166, Definition and Théorème II A), whose proof is explicitly left to the reader: per the
filed generality rule, it is a target only if the design writes a complete proof route; otherwise
it is out of scope.

5.3 **Multiplicative double complexes.** A double complex with a bigraded multiplication compatible
with both differentials (Koszul signs) makes both filtrations of 1.1 multiplicative; both sequences
are multiplicative, with `E₂` products the induced products on iterated cohomology.

5.4 **Products on hypercohomology sequences.** For a pairing of bounded-below complexes and a lax
monoidal structure on `F`, the induced pairing of the hypercohomology sequences of 2.3 and of the
composite-functor sequence of 3.2, compatible with the abutment product — stated only in the
generality in which a written proof is found (Cartan–Eilenberg Ch. XI and XVII are the candidates,
uncertified; no open source was located). The design either names the source and its generality
or drops the target (see Risks).

### Layer 6: the Bockstein spectral sequence

6.1 **Construction.** For a commutative ring `A`, a nonzerodivisor `f ∈ A` and a cochain complex
`M` of `f`-torsion-free `A`-modules: the exact couple `H(M) →f H(M) → H(M/fM) → H(M)[1]` of
`0 → M →f M → M/fM → 0`, equivalently the base §5.1 sequence of the `f`-adic filtration
`F^s = f^sM` of `M[1/f]`, and its spectral sequence (base §§6.1–6.3). `E_1 = H(M/fM)`; `d_1` is
the Bockstein of `0 → M/f → M/f² → M/f → 0` (`stacks-more-algebra` line 12960–13006, §15.97, the
paragraph after Remark 15.97.5, and its footnote at line 13013–13014); `E_{r+1}` is `k⁻¹(f^r H^{n+1}(M)) /
j(H^n(M)[f^r])` (base §6.2) and `d_r` is the Bockstein of order `r`: lift a class of `E_r` to `H(M/f^r)` and apply the
connecting map of `0 → M/f → M/f^{r+1} → M/f^r → 0` (McCleary Ch. 10, uncertified).
The filed settings — torsion-free abelian groups, flat modules over a principal ideal domain with a
prime `p` — are the instances `A = ℤ` and `A` a PID, `f = p`.

6.2 **Limit page and convergence.** In a degree `n` where the `f`-power torsion of `H^n(M)` and of
`H^{n+1}(M)` is bounded, the sequence stabilises at a finite page in total degree `n` and
`E_∞^n ≅ (H^n(M)/H^n(M)[f^∞]) ⊗_A A/f`; equivalently it converges weakly (base §3.2) to
`H^n(M)[1/f]` filtered by the images of `f^sH^n(M)`, and converges when
`⋂_s f^s(H^n(M)/H^n(M)[f^∞]) = 0`. Check: `A = ℤ`, `f = p` and finitely generated cohomology give
the filed "limit page is the reduction modulo `p` of the cohomology modulo torsion"; the `E₂` page
of a space with finitely generated integral cohomology is Hatcher's Bockstein cohomology
(`hatcher-at` line 13324–13337, Proposition 3E.3); `E₂ = H(η_f M ⊗_A A/f)` (`stacks-more-algebra`
line 13007–13010, Lemma 15.97.6, tag 0F7T). Multiplicativity for a multiplicative `M` is 5.1
(`may-primer` line 288–294, Example 4.3).

### Checks

Proved where their inputs exist, otherwise stated as comparisons.

- *Leray*: SchemeAndStackFoundations §2.2 `leray_spectral_sequence` (main) is 3.2 for a direct
  image (which preserves injectives, having an exact left adjoint) followed by global sections;
  the comparison is provable from main. This is how the sequence was first obtained for
  topological spaces (`grothendieck1957` line 2421–2425, and Théorème 3.7.3 at line 2443–2456).
- *Čech to derived*: SchemeAndStackFoundations §2.2 `cech_to_cohomology` is a hypercohomology
  sequence of 2.3 for the Čech resolution, or equivalently 3.2 for the Čech complex functor of a
  covering followed by `H⁰` of complexes (`grothendieck1957` line 2493–2509, both routes);
  compared, not restated.
- *Local-to-global Ext*: `E₂ = H^p(X, ℰxt^q(F, G)) ⇒ Ext^{p+q}(F, G)` as 3.2 for
  `Γ ∘ ℋom(F, −)`; stated as a comparison (its sheaf-Hom inputs belong to the sheaf roadmaps).
- *Group extensions*: invariants under `N` followed by invariants under `G/N` satisfy 3.1's
  condition; the sequence, its edge maps and multiplicativity are stated and proved by
  CohomologyOfGroups (Layer 4 of that target), not here. The étale Hochschild–Serre sequence of
  SchemeAndStackFoundations §2.15 and the profinite ones of NoncommutativeAndEquivariantIwasawa
  §F.3 and ArithmeticGaloisDuality R02.2 are compared by their owners.
- *Topology*: AlgebraicTopology §5.1's Künneth sequence (4.1) and DGFloer Layer 1 item 2's
  multiplicative Serre sequence (5.1) are instances.
- *Counterexamples kept from the sources*: the acyclicity hypothesis of 3.1 cannot be dropped
  (ArithmeticGaloisDuality §D7.1's Check with `Hom(ℤ/2, −)` and `ℚ/ℤ`); for `M = (ℤ →p^r ℤ)` in
  degrees 0, 1, the Bockstein sequence has `d_1 = … = d_{r−1} = 0`, `d_r` an isomorphism and
  `E_{r+1} = 0`, matching `H^1 = ℤ/p^r`.

`Suggested.lean` should state the headlines expressible on the pinned carriers with only simple
local definitions: Tor balance (1.5), Cartan–Eilenberg existence (2.1), the composition criterion
(3.1), the change-of-rings and Künneth `E₂`/abutment identifications in a form that needs no
sorry'd data, and the Bockstein limit page (6.2).

## Suppliers

- **SpectralSequencesAndConvergence** (the base; board design, review round 6, not yet in
  `merge-order/ORDER.txt`, to be inserted after StableHomotopyKTheory, line 17): §2.1 bidegree
  assignments; §3.2 convergence structures; §3.3 morphisms; §3.4 finite filtrations; §3.5 the
  comparison theorem; §3.6 edge maps, two columns and rows, five-term sequences; §4.5 quadrant
  spectral objects; §§5.1–5.4 filtered complexes; §§6.1–6.3 exact couples and their towers; §7.5
  complete convergence. Indirectly StableHomotopyKTheory (#1227) §7.22 exact couples.
- **ArithmeticGaloisDuality** (#858, merge order line 61), §D7.1 *Derived composite spectral
  sequence* (Layer 3). This roadmap is therefore inserted after line 61.
- **DerivedModuleAlgebra** (main), §S.1 (Layer 1, first-quadrant case).
- **SchemeAndStackFoundations** (main), §§2.2, 2.7, 2.15 (Checks only).
- **Mathlib** (pin): `HomologicalComplex₂`, `HomologicalComplex₂.total`,
  `HomologicalComplex₂.totalFlipIso`; `CategoryTheory.SpectralSequence`,
  `CategoryTheory.Abelian.SpectralObject` and its `spectralSequence`, `IsFirstQuadrant`,
  `IsThirdQuadrant`; `HomotopyCategory.spectralObjectMappingCone`;
  `CategoryTheory.Triangulated.TStructure.spectralObject`; `DerivedCategory.Plus`,
  `CategoryTheory.Functor.rightDerivedFunctorPlus` and its unit, the injective derivability
  structure; `Functor.rightDerived`, `Functor.leftDerived`; `InjectiveResolution`,
  `ProjectiveResolution`; `CategoryTheory.Tor`, `CategoryTheory.Tor'`;
  `CategoryTheory.Abelian.Ext`; the Grothendieck-axiom classes the base fixes.
- **Tau Ceti** (pin): `TauCeti/Algebra/Homology/SpectralSequence/*` (filtered complexes,
  bicomplexes, comparison), `SpectralObject/*` (abutment, `EInfty`, maps), `TotalComplex.lean`,
  `Monoidal/Homology/Kunneth/*`, `Monoidal/KFlat/*`, `UniversalCoefficient/*`,
  `CategoryTheory/Monoidal/Tor.lean`, `CategoryTheory/Abelian/LeftDerived.lean`.

## Consumers

- **CohomologyOfGroups** (target #14491): its extension sequences as Layer 3, group
  hyperhomology as Layer 2, multiplicativity as Layer 5.
- Roadmaps later in the merge order that state these sequences for their own use and can import
  them in a revision: ArithmeticStatisticsPartVIII (#1179, line 146; §5.16 graded Tor sequences),
  InverseGaloisAndArithmeticFundamentalGroupsPartII (#2263, line 225; its declared gap
  "dga-graded-tor-spectral-sequences" asks for the change-of-rings and hyperhomology sequences),
  K3BlochGroups (#1430, line 139; group hyperhomology sequences stated for its own use), EtaleDualityAndPerverseSheaves
  (#1040, line 107; hypercohomology sequences), TorsionCohomologyInfrastructure (#1087, line 186),
  HilbertModularVarietiesAndShimuraCurvesPartII (#1745, line 357; base change for Ext along
  `A → A/x`).
- Earlier roadmaps that use the constructions and are recorded as comparisons, not consumers:
  CrystallineCohomology (#857, line 24), SchemeKTheoryOperations (line 37),
  NoncommutativeAndEquivariantIwasawa (#1307, line 30), ArithmeticLocallySymmetricSpaces (#871,
  line 58), and on main SchemeAndStackFoundations, AlgebraicTopology, DGFloer,
  TopologicalSheafCohomology §1.4 (Čech hypercohomology sequences).

## Sources

- `stacks-012K`: Stacks Project, *Homological Algebra*, §12.18 (total complexes, tag 012Z), §12.25
  (tags 012X, 0130–0133), §12.26 (tags 0E1P, 0E1Q, 09IZ, 09J0, 0E1R). Open repository; certified, in
  the cache.
- `stacks-05QI`: Stacks Project, *Derived Categories*, §13.21 (tags 015G–015K), §13.22 (tags
  015L–015N). Open repository; certified, in the cache.
- `stacks-more-algebra`: Stacks Project, *More on Algebra*, §15.63 (tags 061Y, 061Z, 068F, 0662),
  §15.65 (tags 0H7Z, 0H80), §15.69 (tags 0AVG–0AVI), §15.97 (tags 0F7S, 0F7T). Open repository;
  certified, in the cache.
- `may-primer`: J. P. May, *A primer on spectral sequences*, author's page, §4 *Products* (line
  238–324: Proposition 4.1, Corollary 4.2, Example 4.3, pairings of filtered complexes). Certified,
  in the cache.
- `douady1959`: A. Douady, *La suite spectrale d'Adams : structure multiplicative*, Séminaire Henri
  Cartan 11 (1958–1959), exposé 19, Numdam; §II A (spectral products of spectral systems, proof
  omitted). Open repository; certified, in the cache.
- `hatcher-at`: A. Hatcher, *Algebraic Topology*, author's page, §3.E, Proposition 3E.3. Certified,
  in the cache.
- `weibel1994`: C. A. Weibel, *An Introduction to Homological Algebra*, CUP 1994, DOI
  10.1017/CBO9781139644136: §2.7 (balancing, acyclic assembly), §§5.6–5.9 (double complexes,
  Künneth and base-change sequences, hyperhomology and Cartan–Eilenberg resolutions, Grothendieck
  sequences, exact couples). Paywalled; uncertified, numbers to be confirmed.
- `mccleary2001`: J. McCleary, *A User's Guide to Spectral Sequences*, 2nd ed., CUP 2001, DOI
  10.1017/CBO9780511626289: Ch. 2 (multiplicative structures), Ch. 10 (Bockstein spectral
  sequence). Paywalled; uncertified, chapter and theorem numbers to be confirmed.
- `cartan-eilenberg1956`: H. Cartan, S. Eilenberg, *Homological Algebra*, Princeton 1956: Ch. XI
  (products), Ch. XV–XVII (spectral sequences, applications including change of rings,
  hyperhomology). Paywalled; uncertified, section numbers to be confirmed.
- `massey1954`: W. S. Massey, *Products in exact couples*, Ann. of Math. 59 (1954), DOI
  10.2307/1969719. JSTOR; uncertified.
- `grothendieck1957`: A. Grothendieck, *Sur quelques points d'algèbre homologique*, Tôhoku Math. J.
  (2) 9 (1957), DOI 10.2748/tmj/1178244839. Ch. II §2.4 (titled *Suites spectrales et foncteurs
  spectraux*; the composite-functor statement is its Théorème 2.4.1, line 1330–1337), with the
  bicomplex and hyperhomology sequences (line 1226–1308) and Remarques 1–3 (line 1338–1360);
  §2.5, Propositions 2.5.3–2.5.5 (line 1441–1570); Ch. III §3.7 (Leray, line 2421–2456) and
  §3.8 (Čech, line 2493–2509). Open access on Project Euclid; read from the operator's copy of
  the published paper; certified, in the cache.

## Risks

- **Base still in review.** The base is a board design (review round 6, needs changes). Its
  section numbers (§§3.2–3.6, 4.5, 5.1–5.4, 6.1–6.3, 7.5) and its convergence dictionary may move;
  the design must re-read the base at its final head and cite by name and section. Round 6's
  blocking finding shifts the total degree in §7.4's convergence of an exact couple to its
  *limit* (the abutment in degree `n` is the limit in degree `n + 1`); the review keeps the
  colimit theorem and §7.5 unchanged. This roadmap uses only those (1.2 for `Tot^Π`, and 6.2,
  where the Bockstein couple converges to its colimit `H(M)[1/f]`). Any use of the limit form
  must follow the repaired degree.
- **Ownership of the composite-functor sequence.** ArithmeticGaloisDuality §D7.1 states it inside
  an arithmetic roadmap, and its proof route builds Cartan–Eilenberg resolutions that it does not
  state, while Layer 2 here owns them. Importing §D7.1 forces this roadmap after line 61. The
  cleaner single direction is to move §D7.1's statement here and place this roadmap before
  ArithmeticGaloisDuality (its other suppliers allow it), with §D7.1 revised to import Layers 2–3.
  That is a revision of #858, outside this job; the design records the choice.
- **Graded Tor.** ArithmeticStatisticsPartVIII §5.16 plans graded versions of 1.5, 2.4, 3.4 and
  4.2 on a graded carrier. It sits at line 146, later than this roadmap's place after line 61, so
  a revision there can import this roadmap. Until then two proofs of the graded instances exist.
- **Carrier gaps.** Mathlib has no product totalisation, no `D⁻` left derived functor, no
  composition theorem for derived functors and no identification of the classical
  `Functor.rightDerived` with `rightDerivedFunctorPlus` on objects (its own TODO). Tor needs a
  symmetric monoidal category, so Tor statements are for commutative rings; noncommutative Tor
  (right against left modules) has no carrier at the pin.
- **Generality of the half-plane statements.** The acyclic assembly lemma and half-plane
  convergence are written for modules (Weibel) and abelian groups (Stacks §12.26, which warns
  that the general abelian case is not written). The design must state the exactness axioms its
  proofs use and may have to stop at module categories.
- **Products.** May's and Massey's proofs are for modules and exact couples of modules; Douady's
  spectral-object pairing has no written proof; no open source writes products on
  hypercohomology or composite-functor sequences (tensor products of injective resolutions are
  not injective, so a naive Cartan–Eilenberg route fails). Target 5.4, and 5.2's spectral-object
  part, may have to be dropped.
- **Paywalled spine.** Weibel, McCleary, Cartan–Eilenberg and Massey are cited by locator only
  and their numbers are unconfirmed. The open spine is Stacks (Layers 1–4 and 6.1), Grothendieck
  (Layers 1–3 and the Leray and Čech Checks), May (Layer 5) and Hatcher (6.2). Grothendieck asserts
  the uniqueness of Cartan–Eilenberg resolutions up to homotopy but refers its proof to
  Cartan–Eilenberg (2.1). The Bockstein `d_r` as an order-`r` Bockstein and the limit-page formula have
  no open written source: the design proves them from the base's exact-couple towers (§6.2).
- **Indexing.** The Bockstein sequence as a filtered-complex sequence of `M[1/f]` is periodic in
  the filtration degree; the Künneth `E₂` uses `Tor_{−p}` in cohomological indexing; Mathlib's
  spectral-object pages are shifted by one against the classical numbering. Each identification
  must pin its page offset with a computed example, as the base does.
- **Suggested.lean.** Convergence structures live in the base, which has no `Suggested.lean` at the
  pin; headlines that need them must be stated without sorry'd data, or postponed to the README.
