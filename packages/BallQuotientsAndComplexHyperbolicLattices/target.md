Verdict: design
Name: BallQuotientsAndComplexHyperbolicLattices
Base: none
Owner: none

## Scope

The roadmap builds the complex hyperbolic n-ball for every n ≥ 1, the group PU(1,n), its lattices
(arithmetic or not, with or without torsion, cocompact or not), the analytic quotient Γ\𝔹ⁿ, and the
quasi-projective variety S_Γ with its Baily–Borel compactification S*_Γ, up to the definitions a
consumer needs to state the main theorems of Baldi–Ullmo on totally geodesic subvarieties of
non-arithmetic ball quotients (BaldiUllmo2023 line 59 and line 91). It owns, in this order:

1. **The ball and its group.** The Hermitian form of signature (1,n) on ℂⁿ⁺¹, U(1,n), G = PU(1,n),
   the projective model 𝔹ⁿ = {[z] : ⟨z,z⟩ > 0} ⊂ ℙⁿ and the bounded model {w ∈ ℂⁿ : |w| < 1}
   (BaldiUllmo2023 line 486 to line 506 for the form and the matrix description of G). The
   faithful, transitive, biholomorphic action, the compact stabiliser K of the origin, its
   identification with U(n), 𝔹ⁿ ≅ G/K, and the theorem that G is the whole biholomorphism group of
   the ball. The G-invariant Kähler form ω = −i∂∂̄ log(1 − |w|²), its uniqueness up to a positive
   constant among G-invariant Kähler forms, completeness of the metric, and the classification of
   complete totally geodesic complex submanifolds as G-translates of sub-balls 𝔹ᵐ ⊂ 𝔹ⁿ, 0 ≤ m ≤ n
   (BaldiUllmo2023 line 496 to line 506; Goldman1999, Ch. 3, uncertified).
2. **Lattices.** Discrete Γ ⊆ G of finite covolume (WitteMorris2015 line 1893, line 1940),
   cocompact lattices, commensurability, the equivalence between finite covolume in G and finite
   volume of Γ\𝔹ⁿ for ωⁿ. Finite generation of lattices (WitteMorris2015 line 2722 for the
   cocompact case, line 2809 and line 2821 for the general case) and Selberg's lemma for Γ: a
   torsion-free normal subgroup of finite index exists (WitteMorris2015 line 2910; Alperin1987,
   uncertified). Arithmetic lattices: Γ commensurable with p(𝐆(ℤ)) for a semisimple ℚ-group 𝐆 and a
   surjection p : 𝐆(ℝ) → G with compact kernel (WitteMorris2015 line 3732), the fact that such Γ
   are lattices, and the reduction of every statement about Γ to a torsion-free normal subgroup of
   finite index through the finite quotient. Non-arithmetic lattices exist for n = 2 and n = 3
   (Mostow1980 line 85 and line 3089; DeligneMostow1986 line 151); they are Checks, not
   constructions this roadmap owns.
3. **The analytic quotient.** Γ acts properly discontinuously with finite stabilisers; Γ\𝔹ⁿ is a
   normal complex space of dimension n (Cartan1957, uncertified, pp. 90–102) and a complex manifold
   with universal covering 𝔹ⁿ when Γ is torsion-free; for Γ' ◁ Γ torsion-free of finite index,
   Γ\𝔹ⁿ is the finite quotient of Γ'\𝔹ⁿ by Γ/Γ'.
4. **Algebraicity.** For every lattice Γ a normal projective variety S*_Γ, a finite set of cusps
   ∂ ⊂ S*_Γ, empty if and only if Γ is cocompact, and an isomorphism of complex spaces
   (S*_Γ ∖ ∂)^an ≅ Γ\𝔹ⁿ. Uniqueness: two quasi-projective models of Γ\𝔹ⁿ are isomorphic by a
   unique algebraic isomorphism compatible with the identifications. The ball quotient
   S_Γ = S*_Γ ∖ ∂ as a normal quasi-projective variety well defined up to unique isomorphism,
   smooth for torsion-free Γ, with the uniformising map π : 𝔹ⁿ → S_Γ^an and the uniqueness of the
   normal projective compactification by finitely many points.
5. **Totally geodesic and algebraic subvarieties.** Totally geodesic subvarieties of S_Γ (closed
   subvarieties of positive dimension whose smooth locus is totally geodesic for the metric induced
   by ω, BaldiUllmo2023 line 49), the Γ-special subvarieties they come from (sub-balls with lattice
   stabiliser, BaldiUllmo2023 line 421 and line 468), and the algebraic subvarieties of 𝔹ⁿ × S_Γ as
   analytic components of intersections with algebraic subvarieties of ℙⁿ × S_Γ, so that the
   Ax–Schanuel statement BaldiUllmo2023 line 91 can be written down.

Boundaries. The arithmetic Baily–Borel compactification, Borel's extension theorem and the
uniqueness of the algebraic structure for arithmetic groups are planned by ShimuraVarieties
(§§2.5–2.7, 3.1–3.3) and are imported, not re-planned; this roadmap owns only the passage from an
arithmetic lattice in PU(1,n) to a Shimura datum and level to which those sections apply. Proper
actions on symmetric spaces are imported from ArithmeticLocallySymmetricSpaces ALS.0.5. Finite
analytic quotients are imported from ShimuraVarieties P.6. The n = 1 case (Fuchsian groups,
compactified quotient curves) is imported from FuchsianOrbifolds Layers 1–4 on main and only
reconciled with the ball picture. Real totally geodesic submanifolds, toroidal compactifications,
the Hodge-theoretic realisation of S_Γ in a period domain, the finiteness theorem for maximal
totally geodesic subvarieties and the Ax–Schanuel theorem itself (BaldiUllmo2023 line 59, line 91)
are not in scope; they are the consumer's work. Constructing Mostow's and Deligne–Mostow's
non-arithmetic lattices is not in scope.

## Final targets

T1 (the ball and PU(1,n)). For n ≥ 1 and the Hermitian form ⟨z,w⟩ = z₀w̄₀ − Σᵢ zᵢw̄ᵢ on ℂⁿ⁺¹:
U(1,n) is the group of ℂ-linear automorphisms preserving the form, G = PU(1,n) its quotient by the
unit scalars, 𝔹ⁿ = {[z] ∈ ℙⁿ : ⟨z,z⟩ > 0}, and [z] ↦ (z₁/z₀, …, zₙ/z₀) is a biholomorphism onto the
open unit ball of ℂⁿ. G acts faithfully, transitively and by biholomorphisms; the stabiliser of the
origin is the image of U(1) × U(n), is compact and is isomorphic to U(n); the orbit map
identifies 𝔹ⁿ with G/K as complex manifolds; every biholomorphism of 𝔹ⁿ lies in G. Locators:
BaldiUllmo2023 line 486 to line 496; Goldman1999 Ch. 3 (uncertified).

T2 (the invariant Kähler form). ω = −i∂∂̄ log(1 − |w|²) is a G-invariant Kähler form on 𝔹ⁿ whose
metric is complete, and every G-invariant Kähler form on 𝔹ⁿ is a positive constant multiple of ω,
because K ≅ U(n) acts irreducibly on the tangent space at the origin and the invariant Hermitian
forms there are the positive multiples of the standard one. Locators: Goldman1999 Ch. 3
(uncertified); for the ∂∂̄ calculus, ComplexKahlerGeometry K1–K2 and K6.0 on main.

T3 (complete totally geodesic complex submanifolds). A complete totally geodesic complex
submanifold of (𝔹ⁿ, ω) of dimension m is the G-translate of the standard sub-ball
𝔹ᵐ = 𝔹ⁿ ∩ {z_{m+1} = … = zₙ = 0}, and its stabiliser in G is the image of U(1,m) × U(n−m) with
PU(1,m) acting on it as its full biholomorphism group. Locators: BaldiUllmo2023 line 496 to
line 506; Goldman1999 Ch. 3 (uncertified). Total geodesicity is the vanishing of the second
fundamental form of RiemannianGeometry R5a.

T4 (lattices: definition, finite generation, Selberg). A lattice is a discrete subgroup Γ ⊆ G
with Γ\G of finite Haar measure (WitteMorris2015 line 1893 and line 1940); Γ is a lattice if and
only if it is discrete and Γ\𝔹ⁿ has finite volume for ωⁿ/n!. Every lattice is finitely generated
(WitteMorris2015 line 2722 cocompact, line 2809 and line 2821 general; Raghunathan1972 Ch. I–II,
uncertified) and contains a torsion-free normal subgroup of finite index (Selberg's lemma,
WitteMorris2015 line 2910; Alperin1987 pp. 269–273, uncertified), applied to Γ through the adjoint
representation of G.

T5 (the analytic quotient). A lattice Γ acts properly discontinuously on 𝔹ⁿ with finite
stabilisers (ArithmeticLocallySymmetricSpaces ALS.0.5 supplies the proper action of G modulo its
trivial split centre). Γ\𝔹ⁿ with the sheaf of Γ-invariant holomorphic functions is a normal complex
space of dimension n (Cartan1957, uncertified; ShimuraVarieties P.6 for the finite-group step), a
complex manifold with universal covering 𝔹ⁿ when Γ is torsion-free, and for a torsion-free normal
Γ' ◁ Γ of finite index it is the finite analytic quotient of Γ'\𝔹ⁿ by Γ/Γ'.

T6 (algebraicity). For every lattice Γ ⊆ PU(1,n) there exist a normal projective variety S*_Γ over
ℂ, a finite subset ∂ ⊂ S*_Γ, and an isomorphism of complex spaces (S*_Γ ∖ ∂)^an ≅ Γ\𝔹ⁿ; ∂ is empty
if and only if Γ is cocompact; S*_Γ ∖ ∂ is smooth when Γ is torsion-free. Routes by case: arithmetic
Γ, ShimuraVarieties §2.7 after the bridge of T8 (MilneSVI line 1686 and line 1722; BailyBorel1966
Theorem 10.11, uncertified); torsion-free Γ with n ≥ 2, Mok2012 line 476 (the compactification by
finitely many abelian divisors and its blow-down to isolated normal points) and line 546 (the
minimal compactification is projective), resting on SiuYau1982 (uncertified); n = 1,
FuchsianOrbifolds Layer 4; Γ with torsion, the finite quotient of T5 (ShimuraVarieties §3.4a for
quasi-projectivity of finite quotients).

T7 (uniqueness of the model and the ball quotient). If S₁, S₂ are quasi-projective varieties with
isomorphisms of complex spaces φᵢ : Sᵢ^an ≅ Γ\𝔹ⁿ, there is a unique algebraic isomorphism
f : S₁ → S₂ with φ₂ ∘ f^an = φ₁. For arithmetic torsion-free Γ this is Borel's theorem and its
corollary (MilneSVI line 1742 and line 1770; Borel1972 Theorem A, uncertified; ShimuraVarieties
§§3.1–3.3); in general it follows from the big Picard theorem of Deng2020 line 87 applied as in
BaldiUllmo2023 line 455 to line 465, and torsion is removed through the finite quotient. Hence
S_Γ := S*_Γ ∖ ∂, with φ : S_Γ^an ≅ Γ\𝔹ⁿ, is well defined up to unique isomorphism
(BaldiUllmo2023 line 431 and line 475), with uniformising map π : 𝔹ⁿ → S_Γ^an. For n ≥ 2 the normal
projective compactification of S_Γ by a finite set is unique up to unique isomorphism, and S*_Γ is
the Baily–Borel compactification.

T8 (arithmetic lattices). With Γ arithmetic as in WitteMorris2015 line 3732: Γ is a lattice; the
pair (𝐆, 𝔹ⁿ) is a Shimura datum whose Hermitian component is 𝔹ⁿ, and a finite-index congruence
subgroup of Γ is the effective stabiliser group of a finite level, so that ShimuraVarieties
§§0.4, 2.7, 3.1–3.3 apply and give T6 and T7 for Γ. Checks: the Picard modular groups
PU(1,n; 𝒪_K) for an imaginary quadratic K (ShimuraData §3.8 and PELModuli §M5.5 give the unitary
datum of signature (p,q)); the non-arithmetic lattices of Mostow1980 line 3089 and
DeligneMostow1986 line 151 show the arithmetic hypothesis is not automatic for n = 2, 3.

T9 (totally geodesic subvarieties of S_Γ). A totally geodesic subvariety of S_Γ is a closed
irreducible subvariety W of positive dimension whose smooth locus is totally geodesic for the
metric induced by ω (BaldiUllmo2023 line 49). For a sub-ball X_H = g𝔹ᵐ ⊂ 𝔹ⁿ with stabiliser H and
Γ_H = Γ ∩ H a lattice in H, the image of X_H in S_Γ is a closed totally geodesic subvariety, the map
S_{Γ_H} → S_Γ is a finite algebraic morphism onto it (BaldiUllmo2023 line 468 and line 686), and
every totally geodesic subvariety of S_Γ arises this way, its preimage components being the
G-translates of sub-balls of T3.

T10 (algebraic subvarieties of 𝔹ⁿ × S_Γ). An algebraic subvariety of 𝔹ⁿ × S_Γ is an irreducible
component of the intersection of 𝔹ⁿ × S_Γ^an with (the analytification of) an algebraic subvariety
of ℙⁿ × S_Γ, through the Borel embedding 𝔹ⁿ ⊂ ℙⁿ of T1; such components are closed analytic
subvarieties, the graph Π of π is a closed analytic subvariety of 𝔹ⁿ × S_Γ^an of dimension n, and
the codimension identity codim U = codim W + codim Π is meaningful for every irreducible component
U of W ∩ Π. This makes BaldiUllmo2023 line 91 to line 97 a statement of the library.

## Suppliers

- Mathlib: `Matrix.unitaryGroup`, `Matrix.specialUnitaryGroup`, sesquilinear and Hermitian forms,
  `ProperlyDiscontinuousSMul`, `Complex.UnitDisc`, `UpperHalfPlane`, `ContractibleSpace`.
- Tau Ceti: `TauCeti/Analysis/Complex/Fuchsian/` (proper action, coarse quotient, compactification,
  descent) for n = 1; `TauCeti/MeasureTheory/Group/ProperlyDiscontinuous.lean` (fundamental
  domains); `TauCeti/Geometry/Manifold/Gluing.lean` (manifold atlases on quotients).
- RiemannianGeometry (main): R4 (hyperbolic model spaces, the quotient atlas and covering for a
  free properly discontinuous group of isometries, Killing–Hopf), R5a (second fundamental form and
  total geodesicity), R1 (curvature calculus).
- ComplexKahlerGeometry (main): K1–K2 (complex structures, ∂∂̄, Kähler forms), K3 (analytic germs
  and subvarieties, for T10), K6.0 (local Kähler identities).
- FuchsianOrbifolds (main): Layers 1–4 (elliptic points, cofinite groups, cusps, compactified
  quotient Riemann surfaces) for n = 1.
- ArithmeticLocallySymmetricSpaces (#871): ALS.0.1–ALS.0.5 (Cartan involutions, maximal compacts,
  the symmetric space, proper action).
- AdelicAlgebraicGroups (merge order): §§3–4 (arithmetic subgroups, reduction theory, finite
  covolume, neat levels) for T8.
- ShimuraVarieties (#933): P.2 (Hermitian components and bounded realisation), P.6 (finite analytic
  quotients), §0.4, §§2.5–2.7 (Baily–Borel), §§3.1–3.3 (Borel extension, algebraicity, unique
  algebraization), §3.4a (quasi-projective finite quotients).
- ShimuraData (#1038) §3.8 (compact dual) and PELModuli §M5.5 (unitary data of signature (p,q))
  for the Picard examples.
- ComplexComparisonPartII (merge order): §C−1.1 (complex analytic spaces, analytification), Layer C4
  (Chow, analytic images), and C1.4 (weighted L² ∂̄-estimate on complete Kähler manifolds) if the
  design plans Mok's route to T6.
- KleinianGroups (#432, another author): the real-hyperbolic n = 1 analogue (PSL₂(ℂ) on H³); a
  model for discreteness ⇒ proper discontinuity and for covolume, not a supplier of statements.

## Consumers

- A future roadmap on special subvarieties of non-arithmetic ball quotients and Ax–Schanuel
  (BaldiUllmo2023 line 59, line 91 and line 455): it needs T6–T10 verbatim.
- ShimuraCompactifications (#1053): the Baily–Borel compactification S*_Γ of T6–T7 is the target of
  its toroidal compactifications in the rank-one case; Mok2012 line 476 is the non-arithmetic
  toroidal model.
- ComplexKahlerGeometry (#1234, and later parts): ball quotients as the standard examples of
  negatively curved Kähler manifolds and of Hodge-theoretic hyperbolicity (Deng2020 line 136).
- PELModuli and ShimuraVarieties examples: Picard modular surfaces as arithmetic ball quotients.
- Any roadmap on rank-one Hermitian locally symmetric spaces, hyperbolicity of moduli, or
  Margulis's commensurability criterion (BaldiUllmo2023 line 320).

## Sources

Recorded in `packages/BallQuotientsAndComplexHyperbolicLattices/sources.toml`.

- BaldiUllmo2023 (arXiv 2005.03524v4, open repository, certified): Theorem 1.2.1 line 59,
  Theorem 1.2.2 line 91, §2.3 line 315, §2.5 line 363, Definitions 3.1.3–3.1.8 line 398 to
  line 432, Theorem 3.1.12 line 455, Definitions 3.1.13–3.1.14 line 468 and line 475, §3.2 line 478,
  Corollary 3.4.6 line 686.
- Deng2020 (arXiv 2001.04426v5, open repository, certified): Theorem A line 87, Theorem B line 126,
  Corollary C line 136.
- Mok2012 (HKU author page, preprint IMR2009-4, certified; published in Progress in Mathematics
  296): Theorem 1 line 476, Main Theorem line 546; the Siu–Yau input is summarised at line 26 to
  line 32.
- MilneSVI (author page, certified): Theorem 3.12 line 1686, Remark 3.13 line 1722, Theorem 3.14
  line 1742, Lemma 3.15 line 1746, Corollary 3.16 line 1770.
- WitteMorris2015 (arXiv math/0106063v6, open repository, certified): Definition 4.1.9 line 1893,
  Definition 4.1.16 line 1940, Corollary 4.7.5 line 2722, Theorem 4.7.10 line 2809, Remark 4.7.11
  line 2821, Theorem 4.8.2 line 2910, Definition 5.1.19 line 3732, Theorem 5.2.1 line 3822.
- DeligneMostow1986 (Numdam, open repository, certified): line 126 to line 153 (the two main
  theorems and the lists of non-arithmetic lattices in PU(1,2), PU(1,3)), Theorem (3.11) line 809,
  Theorem (12.11) line 2817.
- Mostow1980 (MSP open back issue of Pacific J. Math., certified): Theorem A line 85, Theorem 17.3
  line 3089.
- Borel1972 (Project Euclid, uncertified: the automated fetch was served a bot-protection page;
  cited by locator, Theorem A): Borel extension and algebraicity in the arithmetic case.
- Alperin1987 (e-periodica, uncertified: the automated fetch was served a verification page; cited
  by locator pp. 269–273).
- BailyBorel1966 (paywalled, uncertified): Theorem 10.11, §10.4.
- SiuYau1982 (paywalled, uncertified): pp. 363–380, main theorem and §3.
- Cartan1957 (paywalled, uncertified): pp. 90–102.
- Goldman1999 (paywalled, uncertified): Ch. 3.
- Raghunathan1972 (paywalled, uncertified): Ch. I–II.

## Risks

1. **Algebraicity for non-arithmetic Γ, n ≥ 2 (T6).** The only general proofs are Siu–Yau's
   (paywalled) and Mok's. Mok's route needs the structure of the ends of Γ\𝔹ⁿ (Garland–Raghunathan
   rank-one reduction theory, lattices in Heisenberg groups, BaldiUllmo2023 line 649 cites it), a
   toroidal compactification by abelian varieties for arbitrary lattices (Mok2012 line 476), the
   weighted L² ∂̄-estimate (ComplexComparisonPartII C1.4 is the candidate supplier) and a
   Kodaira-type embedding (Mok2012 line 546). No roadmap owns any of these. The target form says
   this case "may be cited"; the planning principles allow no bypassed theory, so a design must
   plan the route, or a human must waive the citation explicitly. The design should name this as
   its first decision.
2. **Uniqueness for non-arithmetic Γ (T7).** Deng2020 Theorem A is proved through complex
   polarised variations of Hodge structure and period maps, far above the library. The alternative
   is a direct big Picard extension theorem for Γ\𝔹ⁿ ⊂ S*_Γ (hyperbolic embedding, in the style of
   ShimuraVarieties §3.1 which plans it for arithmetic groups using Siegel-set metric estimates);
   the non-arithmetic version needs Garland–Raghunathan Siegel sets again. The design must choose.
3. **The full automorphism group of the ball (T1).** "G is the whole biholomorphism group" needs
   H. Cartan's theorem that an automorphism of a bounded circular domain fixing the origin is
   linear, or the several-variable Schwarz lemma; Mathlib has only the one-variable Schwarz lemma
   and the automorphisms of the disc.
4. **Finite generation of non-cocompact lattices (T4).** The elementary proof covers cocompact
   lattices; the general rank-one case uses Siegel sets (Garland–Raghunathan, paywalled Annals
   paper) or Raghunathan1972 (paywalled). For arithmetic Γ it comes from AdelicAlgebraicGroups.
5. **Paywalled foundations.** Cartan1957 (quotients of analytic spaces), Goldman1999 (geometry of
   the ball), SiuYau1982 and BailyBorel1966 are cited by locator only; Borel1972 and Alperin1987
   are open texts the service could not read because of bot protection. The mathematics of
   Cartan1957 is also planned in ShimuraVarieties P.6 and of Selberg's lemma in WitteMorris2015
   line 2910, so no statement depends on an unread text alone.
6. **Supplier maturity.** ShimuraVarieties (#933), ArithmeticLocallySymmetricSpaces (#871),
   ShimuraData (#1038) and ComplexComparisonPartII are open pull requests; their section numbers
   may move. KleinianGroups (#432) belongs to another author and is not in the merge order.
7. **Totally geodesic subvarieties are algebraic (T9).** Baldi–Ullmo prove it through o-minimal
   definability of the uniformising map on a Siegel fundamental set (BaldiUllmo2023 line 680 and
   line 686); an alternative is Borel hyperbolicity of S_Γ (Deng2020 line 87) applied to the finite
   map from S_{Γ_H}. Either way this is the hardest statement after T6 and the design may scale it
   to the sub-ball-to-closed-subvariety direction with the algebraicity of the map as a separate
   section.
