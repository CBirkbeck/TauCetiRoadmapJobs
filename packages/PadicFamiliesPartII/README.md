# Roadmap: p-adic families, part II — PEL classicality, Hilbert–Siegel families and the singular Sen obstruction

**Summary.** PadicFamilies builds ordinary and finite-slope families in one cohomological degree, and HigherHidaAndColemanTheory extends them to supported coherent cohomology in every degree: integral higher Hida complexes for Siegel varieties, higher Coleman theory for quasi-split abelian-type data, and the one-variable singular Klingen complex. This roadmap continues in five directions those two roadmaps do not reach. It proves small-slope classicality on PEL Shimura varieties of type A and C by analytic continuation along degree bands and Kassaei path sums (Bijakowski–Pilloni–Stroh). It proves the spherical-level control and the vanishing Euler characteristic of the singular-weight genus-two theory (Pilloni). It constructs partial-ordinary Hida complexes on Hilbert–Siegel varieties with derived control, the weight-two doubling injection, the multi-place small-slope continuation and the one-Klingen-place rational comparison (Boxer–Calegari–Gee–Pilloni 2021). It constructs the completed-cohomology higher Eichler–Shimura spectral sequence and its genus-two four-piece filtration, identifies the nilpotent part of the arithmetic Sen operator at the singular weight with a coherent Cousin differential, and deduces classicality of de Rham ordinary eigenforms under a balance hypothesis. Finally it extracts four finite projective genus-two Hida modules with classical and higher-Coleman specialization, integral duality, tame group-ring projectivity and fixed central character (Boxer–Calegari–Gee–Pilloni 2025). The end theorems are the PEL classicality theorem of §2.8, the Euler characteristic theorem of §3.5, Hilbert–Siegel derived control (§4.7), the doubling injection (§5.8), the one-place comparison (§6.7), the four-piece filtration (§7.6), de Rham classicality at the singular weight (§8.6) and the four projective modules (§§9.2–9.7).

## Scope and ownership

PadicFamilies stops with the eigenvariety machine for compact operators on complexes (§§2a.15–2a.16), locally finite derived ordinary projectors (§0a.25) and degree-zero families. HigherHidaAndColemanTheory stops with the general supported theory: the weight dictionary (§1.1), supported ordinary localization (§2.3), integral Siegel strata and regular control (§3.7), the universal Iwasawa complexes, derived control, duality and genus-two integral amplitudes (§§4.5–4.9), the finite-slope Bruhat Cousin spectral sequence and its interior subquotients (§§5.1, 5.5–5.8), analytic family complexes and finite perfect slope blocks (§§6.2–6.3), the automorphic BGG spectral sequence (§6.6), the ordinary/finite-slope family comparison and sharp Siegel bounds (§§8.3, 8.5), the four Siegel weights (§9.1), the singular Klingen complex, its isolated spherical refinement, analytic family, small-slope extension and two-term control (§§9.4–9.8). This roadmap imports all of these and owns:

- the PEL degree coordinates, normalized correspondences, degree-band continuation, Kassaei path sums and classicality theorem of Layers 1–2, on PEL data of type A or C at a prime satisfying BPS Hypothesis 1.1.1, on every component of complex dimension greater than one;
- the integral spherical operator at singular weight, rank-zero nilpotence, the spherical ordinary amplitude, the away-from-p Hecke normalization and the Euler characteristic theorem of Layer 3;
- the Hilbert–Siegel partial-ordinary theory of Layers 4–6: mixed loci, universal coefficients, commuting operators, the family complex and its derived control, weight-two doubling, mixed analytic families, multi-place continuation and the one-place comparison;
- the completed-cohomology Eichler–Shimura theory of Layer 7 and the singular Sen theory of Layer 8;
- the four projective genus-two modules of Layer 9.

The following are imported and not restated. The Klingen extension threshold k+2r−3, the relative BGG sequence with its p^(k+1) scaling and the all-degree and degree-zero BGG ranges are HigherHidaAndColemanTheory §§9.6–9.7; the spherical-to-Klingen comparison on an isolated Satake root is HigherHidaAndColemanTheory §9.5. Components of dimension one (modular curves and Shimura curves) are covered by the geometric classicality theorem of HigherHidaAndColemanTheory §5.10 and its modular check §9.2, whose degree-zero threshold agrees with Layer 2's at d=a=1. Fargues's degree, its additivity, duality, extreme values and increase along isogenies are HodgeTateAndCanonicalSubgroups §§0.6–0.8. Normalized higher-level models and the Koecher principle are ShimuraCompactifications §§C5.19–C5.22; rigid proper GAGA is AdicSpacesPartIII §R3.7. Finite slope decompositions of compact operators on Banach complexes are LocallyAnalyticDistributions §4.16. The Sylow projectivity criterion for finite group rings is DeformationAndDerivedPatchingAlgebra §5.9 and residual detection of perfect amplitude is §7.3. The derived completed tower, its support triangle and derived locally analytic recovery are CompletedCohomologyPartII §§2.2, 6.7 and 7.1. Coherent cohomology of discrete series and nondegenerate limits of discrete series of GSp₄, and the large-weight temperedness theorem for Res_(F/ℚ)GSp₄, are AutomorphicFormsOnReductiveGroups §§6.4–6.6. Sen operators of finite-dimensional C_p-representations and de Rham ⇒ Hodge–Tate are PadicHodgeTheory §§3.3 and 4.4. The GSp₄ spin and dual-spin Hecke polynomials are SmoothRepresentationsOfLocalGroups §SR.4.5 and IntegralHeckeAndGaloisDeterminants §3a.2.

The Hilbert–Siegel coefficient sheaves of Layer 6 are the mixed Klingen/Iwahori instance of HigherHidaAndColemanTheory §6.2: they differ in using partial strict neighbourhoods of the mixed rank locus and the integral modified lattice of Layer 4, which the general construction does not see. The spherical theory of Layer 3 is at hyperspecial level; the Klingen theory it is compared with is HigherHidaAndColemanTheory §9.8.

The scope does not include potential modularity, Taylor–Wiles patching, the stronger Hilbert vanishing theorem of BCGP21 §5.9, or the torsion conjectures of Pilloni Remark 1.4: these are consumers of the theorems here or separate statements. Section 3.5 proves vanishing of a virtual rank; it does not assert that either cohomology module of the Klingen family is torsion.

## Conventions

Cohomological grading is used throughout: Hⁱ(C[r])=Hⁱ⁺ʳ(C). Derived fibres are derived tensor products until concentration or flatness is proved. A finite slope block is a finite nonzero-eigenvalue window of a compact or locally finite operator. Valuations are normalized by v_p(p)=1. Perfect amplitude [a,b] means a finite projective representative in degrees a,…,b; cohomology of a perfect complex need not be flat.

A boundary divisor is written D, so ω^κ(−D) is the subcanonical coefficient. Cuspidal and canonical supports have different integral amplitude bounds and are never interchanged. Neatness, fan refinement, polarization elements and finite-character components are retained in every geometric correspondence, and every correspondence is formed on a common refinement of the toroidal data of its two ends (ShimuraCompactifications §§C3.1, C3.3).

For Siegel coherent weights the dictionary of HigherHidaAndColemanTheory §1.1 is used: κ_w(ν)=−w₀,M w(ν+ρ)−ρ and ν_w(κ)=−w⁻¹w₀,M(κ+ρ)−ρ. The Iwasawa complexes of HigherHidaAndColemanTheory §4.5 specialize at −ν. Layer 9 transports the coefficient ring along the involution [t]↦[t⁻¹], so that it specializes at +λ, and retains the torus twist E(−λ). A finite-order character enters through its level action, never through a Weyl-group formula on analytic characters. At p=2 the finite part of the torus is never split off by averaging.

Integral sharp amplitudes are used only in genus one and two. The arithmetic Sen operator is normalized so that ℚ_p(1) has Hodge–Tate weight −1 and Sen eigenvalue +1 (PadicHodgeTheory §3.2).

Each layer states its own standing hypotheses. The PEL layers allow the unramified type A and C data of BPS Hypothesis 1.1.1. The Hilbert–Siegel layers take F totally real and p>2 split completely in F; the integral descent to the common-similitude group further assumes p∤|Δ| for the finite unit and deck quotient Δ of Layer 4. Layer 9 allows every prime p. A hypothesis of one layer does not propagate to the others.

**Checks.**

- For the modular curve (type C, d=a=1) the PEL normalization exponent is n=1, and the small-slope region of §2.1 at weight k is s<k−1, which is the degree-zero threshold of HigherHidaAndColemanTheory §9.2 for the operator p⁻¹U_naive; a missing trace scalar would give s<k.
- At p=3, the scalar renormalization p^(−a)U with a=2 sends an eigenvalue of slope 3 to slope 1; renormalizing by a=−1 sends slope 1 to slope 2.
- With D=∅, canonical and subcanonical coefficients agree. On X₀(11), whose boundary is two cusps, H⁰(ω²(−D)) is the one-dimensional space of weight-two cusp forms while H⁰(ω²) is two-dimensional, the extra class being Eisenstein; the two supports differ.
- The Sen normalization on ℚ_p(1) gives Sen eigenvalue +1; on ℚ_p(−1) it gives −1, and a convention with the opposite sign would reverse every Sen value of Layer 8.

## Exact supplier contracts

### From Mathlib

- `LinearMap.prod` and `LinearMap.coprod` (Mathlib/LinearAlgebra/Prod.lean:95 and :199, over a semiring with additive commutative monoid modules) build the companion operator of §5.6 from its two coordinate maps.
- `Module.End.genEigenspace` (Mathlib/LinearAlgebra/Eigenspace/Basic.lean:71) gives the generalized eigenspaces of §§5.9 and 8.2.
- `LinearMap.eventually_isCompl_ker_pow_range_pow` (Mathlib/RingTheory/Artinian/Module.lean:308) is the Fitting decomposition of an endomorphism of a module that is both Artinian and Noetherian. It splits finite-length Hecke modules in §5.9; it is not a derived ordinary projector.
- `HenselianLocalRing` (Mathlib/RingTheory/Henselian.lean:108) lifts simple residual roots in §5.9.
- `Module.Projective` (Mathlib/Algebra/Module/Projective.lean:70) is the projectivity of Layer 9; it carries no finiteness, which is stated separately.

### From Tau Ceti

No Tau Ceti declaration is consumed beyond the carriers re-exported through Mathlib. Shimura varieties, toroidal models, coherent and completed cohomology and Sen operators are supplied by the roadmaps below.

### From TauCetiRoadmap.AdicSpacesPartIII

- §R3.7: proper GAGA for coherent cohomology over an affinoid base, used in §2.8 and §6.7.
- §R3.2: Kiehl's gluing of coherent sheaves on admissible covers.

What AdicSpacesPartIII must provide (gap:bounded-section-gluing): §R3.2 — For a smooth rigid space over a complete discretely valued field of characteristic zero with a locally free coherent sheaf and an integral model, Bartenwerfer's extension of bounded sections across the complement of a quasi-compact open (BPS Proposition 4.1.2), and gluing of compatible integral sections modulo p^(A_N), A_N→∞, on finite admissible covers by strict neighbourhoods into a bounded section.

### From TauCetiRoadmap.AutomorphicBundles

- §B1.10: Hecke pullback of the canonical torsor along isogenies.
- §B3.2 and §B3.4: canonical and subcanonical extensions and the boundary sequence.
- §B3.10: integral canonical and subcanonical coefficients on good-prime PEL models.
- §B4.16: the Siegel coefficient Ω(k,r)=Sym^kω⊗det(ω)^r.
- §B5.1: the trace of a finite locally free morphism.
- §B5.10: geometric Hecke operators on sections.
- §B5.15: the expansion principle for locally free automorphic coefficients.
- §§B3.BGG.1–B3.BGG.3: the Siegel dual BGG complex in characteristic zero.

What AutomorphicBundles must provide (gap:higher-coherent-hecke): §B5.10 — Extend the geometric Hecke operators to cohomological correspondences on RΓ of canonical and subcanonical extensions in every degree, including the correspondences at p at Iwahori, Klingen and mixed parahoric level, with composition matching convolution, independence of common fan refinements, and integral normalization through the fundamental-class trace.

What AutomorphicBundles must provide (gap:hilbert-siegel-kodaira-spencer): §B2.8 — On toroidal models of Res_(F/ℚ)GSp₄ over ℤ_(p), the O_F-linear Kodaira–Spencer identification of the canonical sheaf with ⊗_v det(ω_v)³ compatible with prime-to-p quasi-isogenies and their polarization factor, and the normalized integral p-correspondence identities of BCGP21 Propositions 5.5.2–5.5.3 and 5.6.1.

What AutomorphicBundles must provide (gap:coherent-automorphic-realization): §B4.9 — For Res_(F/ℚ)GSp₄, F totally real (F=ℚ included), at neat level, identify interior coherent cohomology of the canonical and subcanonical extensions of ω^κ in every degree, Hecke-equivariantly and after localization at a non-Eisenstein maximal ideal, with the sum over discrete automorphic representations of m(π)·H^q(𝔭_h,K_h;π_∞⊗V_κ)⊗π_f^K in the sense of AutomorphicFormsOnReductiveGroups §6.2.

What AutomorphicBundles must provide (gap:igusa-boundary-eisenstein): §B3.4 — For the ordinary genus-two Igusa tower, the normalization of its boundary into ordinary GL₂ boundary towers and the factorization of the prime-to-p Hecke action on boundary coherent and completed cohomology through the Levi Hecke algebra, so that every boundary Hecke polynomial is reducible.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

- §6.2: coherent relative cochains and automorphic classes.
- §6.4: the two components of GSp₄(ℝ) and coherent multiplicities.
- §6.5: coherent cohomology of discrete series and nondegenerate limits; a holomorphic limit contributes in degree zero and a generic limit in degree one.
- §6.6: the large-weight temperedness theorem for Res_(F/ℚ)GSp₄ and the singular family λ=(a,0;c).

### From TauCetiRoadmap.AutomorphicGaloisRepresentationsPartII

- §AG2.P (GSp₄ construction and normalization) and AG2.6 (GSp₄ crystalline Hodge comparison; ordinary GSp₄ triangular shape): Galois representations of classical GSp₄ eigenforms.

What AutomorphicGaloisRepresentationsPartII must provide (gap:completed-eichler-shimura): Layer AG2.7 — For GSp₄/ℚ, attach a four-dimensional Galois representation to every prime-to-p Hecke eigensystem of localized ordinary completed cohomology with absolutely irreducible residual representation, prove the Eichler–Shimura relation on the completed tower, and under the Zariski-closure alternatives of BCGP25 §4.11 the multiplicity decomposition V[m]≅ρ_m⊗W (BCGP25 Propositions 4.11.1–4.11.2 and Lemma 4.12.3).

### From TauCetiRoadmap.CompletedCohomologyPartII

- §F.4: derived locally analytic vectors RLA.
- §2.2: the derived completed tower and its compact-support variant.
- §6.7: derived locally analytic recovery of classical cohomology at fixed tame level.
- §7.1: the derived completed support triangle.

What CompletedCohomologyPartII must provide (gap:analytic-localization): §F.4 — For M in the BGG category O(𝔤,𝔟)_(λ-alg), the canonical completion M⊗_(U(𝔤))Û(𝔤), its continuous dual and the λ-twisted analytic localization on the adic flag variety, with the comparison of RHom_𝔤(M,RLA(V)) and the localization, non-Liouville exactness, dual-Verma fibres and the rank-one localization triangle (BCGP25 Theorem 2.2.39, §3.4, Theorems 3.5.11 and 3.6.9).

### From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

- §5.9: Sylow projectivity and norm comparisons for finite group rings, with no division by the group order.
- §7.3: minimal finite free representatives and residual detection of perfect amplitude over a local ring.
- §9.2: codimension and concentration of perfect complexes.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

- §11.1: transfer between GSp₄ and GL₄ for general-type representations. Consumed: over a number field F (totally real here), for a discrete general-type π of GSp₄(𝔸_F), every π′ whose local components lie in the L-packets of the π_v at every place is automorphic and occurs with multiplicity one. In particular two members with the same finite part, whose archimedean components differ by holomorphic versus generic discrete series or limits of discrete series at any set of real places, have the same multiplicity, one (BCGP21 Theorem 3.10.1(2); Pilloni Proposition 15.2.4.1); this includes the stable packets of weight (2,2) used in BCGP25 Theorem 4.12.4.

### From TauCetiRoadmap.HigherHidaAndColemanTheory

- §1.1 and §1.2: the weight dictionary and slope conditions.
- §2.3: supported ordinary localization.
- §3.6 and §3.7: the integral ordinary Cousin spectral sequence and regular global control.
- §§4.5–4.9: the perfect Iwasawa complexes M_w^ε over Λ=ℤ_p[[T(ℤ_p)]], derived control, finite Hecke images, Iwasawa Serre duality and integral amplitude in genera one and two.
- §5.1, §§5.5–5.6, §5.8 and §5.10: Bruhat geometry, the finite-slope Bruhat Cousin spectral sequence, cuspidal vanishing by length, interior Cousin subquotients and geometric classicality.
- §6.2, §6.3 and §6.6: analytic family complexes, finite perfect slope blocks and the automorphic BGG spectral sequence.
- §8.3 and §8.5: ordinary comparison in weight families and sharp Siegel bounds.
- §9.1 and §§9.4–9.8: the four Siegel weights, the singular Klingen complex M_Kli over Λ₁=ℤ_p[[ℤ_p×]], the isolated spherical refinement, the Klingen analytic family with its BGG ranges, small-slope extension with threshold k+2r−3, and two-term control.

### From TauCetiRoadmap.HodgeTateAndCanonicalSubgroups

- §§0.6–0.8: Fargues's degree, additivity, duality, extreme values and increase along generic isomorphisms with equality exactly for isomorphisms.
- §3.10: canonical subgroups of Hilbert–Blumenthal abelian schemes.
- §5.5 and §5.7: the modified Hodge bundle with p^(1/(p−1))ω⊂ω^mod⊂ω.

What HodgeTateAndCanonicalSubgroups must provide (gap:hilbert-siegel-partial-igusa): §5.1 — On the Hilbert–Siegel mixed-level ordinary loci, the partial Igusa towers trivializing T_p(H_(∞,v)^D) at every v∈S_p and T_p((G_v^m/H_(∞,v))^D) at the Iwahori places, with affine étale transitions outside the fully ordinary locus, and the Hilbert–Siegel canonical-subgroup frame torsor with modified lattice p^(1/(p−1))ω⊂ω^mod⊂ω and radius-change estimates compatible with determinant and boundary.

### From TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

- §2.1: finite Hecke images of bounded complexes.
- §2.3: operator localization and ordinary parts.
- §3a.2: the GSp₄ dual-spin Hecke polynomial with full multiplier.
- §3b.1: Galois-type and non-Eisenstein maximal ideals.

### From TauCetiRoadmap.LieHighestWeight

- Layer 3: enveloping algebra, PBW and Verma modules.

What LieHighestWeight must provide (gap:bgg-category-o): Layer 3 — For a split reductive Lie algebra 𝔤 over a field of characteristic zero with Borel 𝔟 and λ a character of 𝔟, the BGG category O(𝔤,𝔟)_(λ-alg) of finitely generated 𝔤-modules that are 𝔟-locally finite with weights in λ plus algebraic characters, its Verma and parabolic Verma objects and their 𝔲_P-homology.

### From TauCetiRoadmap.LocallyAnalyticDistributions

- §4.16: Banach complexes, slope decompositions and finite perfect slope models.

### From TauCetiRoadmap.OverconvergentAutomorphicForms

- §0.4: analytic induction and bounded families of analytic coefficients.

### From TauCetiRoadmap.PadicFamilies

- §0a.25: the ordinary direct factor of a locally finite derived endomorphism.
- §§2a.15–2a.16: the spectral variety of a compact endomorphism of a complex.

### From TauCetiRoadmap.PadicHodgeTheory

- §3.2: the sign dictionary, Hodge–Tate weight of ℚ_p(1).
- §3.3: de Rham implies Hodge–Tate for finite-dimensional representations.
- §4.4: the Sen module and Sen operator; Hodge–Tate means semisimple Sen operator with integral eigenvalues.

### From TauCetiRoadmap.PadicMeasuresIwasawaAlgebras

- §1.6: characters of measure algebras.
- §1.7: comparison with the completed group algebra.
- §6.1: character group rings and the involution g↦g⁻¹.

### From TauCetiRoadmap.PELModuli

- §M0.20: Morita equivalence and self-dual lattices at good primes.
- §M1.9: the characteristic-zero adelic problem at arbitrary level.
- §M1.13: level change and the Hecke action away from p.
- §M2.8 and §M2.9: representability, smoothness and the universal family at neat level.
- §M4.5 and §M4.6: normal integral models at higher p-level.
- §M5.2: Siegel moduli.

What PELModuli must provide (gap:pel-iwahori-correspondences): §M1.13 — For PEL data of type A or C satisfying BPS Hypothesis 1.1.1, describe the characteristic-zero Iwahori-level problem by flags of O_B-stable totally isotropic finite flat subgroups of A[p], and construct at each place above p the correspondence of complements with its quotient isogeny, the polarization transported by a totally positive element of valuation one at that place, the induced tame structure, and finite étale projections.

What PELModuli must provide (gap:hilbert-siegel-mixed-models): §M4.5 — For Res_(F/ℚ)GSp₄ with F totally real and p>2 split completely in F, integral models at mixed Klingen and Iwahori level at the places above p as moduli of chains of O_F-stable isotropic finite flat subgroups, their p-rank stratification place by place, the open loci where the distinguished height-one subgroup is multiplicative, and the comparison with the normalized models of §§M4.5–M4.6.

### From TauCetiRoadmap.PerfectoidShimuraVarieties

- §3.1: the flag variety with its right action.
- §3.5 and §3.6: the Hodge–Tate period map of Hodge-type towers and automorphic-bundle pullback.

What PerfectoidShimuraVarieties must provide (gap:vb-sen-period): §3.6 — The solid analytic automorphic vector-bundle functor VB_red from equivariant sheaves on the flag variety, its compatibility with Chevalley–Eilenberg complexes and localization, and the identification of the arithmetic Sen operator on completed cohomology with the horizontal action (BCGP25 Theorems 4.5.20 and 4.7.1).

### From TauCetiRoadmap.SchemeAndStackFoundations

- §2.19: the right adjoint of pushforward and the upper shriek functor.
- §2.21: dualizing complexes, proper duality and the trace of a proper morphism.

What SchemeAndStackFoundations must provide (gap:lci-fundamental-class): §2.21 — For a proper morphism f:X→Y of Noetherian schemes of the same pure dimension with X Cohen–Macaulay and Y regular, the fundamental class identifying f^!O_Y with the relative dualizing sheaf in degree zero and the induced trace Rf_*O_X→O_Y extending the finite locally free trace, compatible with composition and flat base change.

### From TauCetiRoadmap.ShimuraCompactifications

- §§C3.1–C3.3 and §C3.9: refinement maps, level maps, toroidal Hecke correspondences and independence of the cone system.
- §§C4.16–C4.17: the compactified Klingen correspondence and acyclicity of its first projection.
- §C5.16: the integral minimal compactification.
- §§C5.19–C5.22: normalized models at higher p-level, their charts, formally canonical coefficients and the Koecher principle away from dimension one.
- §§C5.25–C5.26: the Hilbert–Siegel minimal boundary and formal Koecher principle.

What ShimuraCompactifications must provide (gap:partial-hasse-invariants): §C6.44 — On the special fibres of the Hilbert–Siegel models, the partial Hasse invariants Ha_v (v∈S_p) on toroidal and minimal compactifications, their regularity as a sequence on every supported stratum also after replacing any of them by an arbitrary power, and affineness of the rank strata of the minimal compactification.

What ShimuraCompactifications must provide (gap:hilbert-siegel-minimal-acyclicity): §C5.16 — For the Siegel and Hilbert–Siegel toroidal-to-minimal maps at the p-levels used here, vanishing of higher direct images of subcanonical coefficients (also modulo p^n, and for the analytic Banach coefficients after a Hodge–Tate trivialization), the two-affine cover of the rank-at-least-one minimal special fibre in genus two, and the 2^|I| cube of affinoid charts of the mixed locus with acyclic finite intersections.

What ShimuraCompactifications must provide (gap:tame-boundary-stabilizers): §C3.2 — For normal neat tame levels K₁⊂K₂ with finite quotient Δ, the toroidal map as a Δ-quotient whose geometric stabilizers on boundary strata have order prime to p, with the trace and pullback identifications on canonical and subcanonical coefficients.

### From TauCetiRoadmap.ShimuraData

- §3.8, §3.10 and §3.13: the compact dual, Kostant representatives and the opposition involution.
- §5.5: the Siegel Borel, dominance and half-sums.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

- §SR.1.4: Iwahori decompositions and the positive Klingen Hecke algebra of GSp₄(ℚ_ℓ).
- §SR.4.5: GSp₄ Satake parameters and the spin polynomial with similitude.

## How to read the build

Layers 1 and 2 are the PEL theory: the degree coordinates and normalized correspondences, then continuation of a finite-slope eigenform from the multiplicative locus across every integral degree wall, and algebraization. Layer 3 is the spherical genus-two theory at singular weight that feeds the Euler characteristic of the Klingen family. Layers 4, 5 and 6 are the Hilbert–Siegel theory: Layer 4 builds the partial-ordinary family and proves derived control, Layer 5 proves the weight-two doubling injection on the special fibre, and Layer 6 builds the mixed analytic families and proves continuation and the one-place comparison; Layer 6 uses Layer 3's Euler characteristic as its witness input. Layer 7 binds completed cohomology to higher coherent cohomology through analytic localization and constructs the higher Eichler–Shimura spectral sequence; Layer 8 specializes it to the singular genus-two weight and proves the Sen–Cousin comparison and classicality. Layer 9 extracts the four projective modules from the Iwasawa complexes of HigherHidaAndColemanTheory and is independent of Layers 1–8. The PEL, Hilbert–Siegel, completed and integral branches share only the supplier inputs.

The headline theorems require Shimura varieties at parahoric level, toroidal compactifications, coherent cohomology of automorphic bundles, overconvergent sections, completed cohomology and Sen operators on it; none of these carriers exists at the pinned Mathlib and Tau Ceti, so `Suggested.lean` states none of them and names each with what it lacks.

## Layer 1: PEL degrees and normalized correspondences

Standing hypotheses for Layers 1 and 2. Let (B,⋆,U,⟨,⟩) be a PEL datum of type A or C with totally real field F₀ and, in type A, CM field F, satisfying BPS Hypothesis 1.1.1 at the prime p: p is unramified in F₀ and, in type A, every place of F₀ above p splits in F; B⊗ℚ_p is a product of matrix algebras over unramified extensions of ℚ_p; O_B is maximal at p; the pairing is perfect at p; and p splits completely in the reflex field E. Write π₁,…,π_h for the places of F₀ above p and d_i for the residue degree of π_i. In type A the signature (a_i,b_i) is the same at every embedding above π_i (BPS Lemma 1.1.4); in type C write a_i for the corresponding rank. Fix a finite extension K of ℚ_p large enough to split the datum, a neat tame level, compatible projective toroidal fans and, for each i, a totally positive element x_i of F₀ of valuation one at π_i and zero at the other places above p. X_Iw^rig is the rigid generic fibre of the Iwahori-level model at p (BPS §§1.1–1.5).

### 1.1 Morita degree coordinates

For a point x of X_Iw^rig with flag H_• of O_B-stable totally isotropic finite flat subgroups of A[p], define δ_i(x) as Fargues's degree of the Morita component at π_i of the member H_(i,a_i) of the flag, computed over the ring of integers of a complete algebraically closed extension with v_p(p)=1. In type A take the component attached to π_i⁺; the polarization identifies the π_i⁻ component with its dual. Prove that δ_i takes values in [0,d_i a_i], is unchanged under extension of complete valued fields, and is additive in short exact sequences of finite flat group schemes with O_B-action (BPS §§1.1–1.2 and §3.1). The degree measures how close x is to the multiplicative Iwahori locus δ_i=d_i a_i.

A proof route is as follows: apply the Morita equivalence at p to reduce O_B-stable subgroups to subgroups with an action of the unramified ring of integers of degree d_i, and apply the degree theory of finite flat group schemes to that component.

*Needs:* PELModuli §M0.20; PELModuli §M1.9; gap:pel-iwahori-correspondences; HodgeTateAndCanonicalSubgroups §0.6; HodgeTateAndCanonicalSubgroups §0.7.

The basic properties of this construction are:

- δ_i(x) lies in [0,d_i a_i] for every x and every i.
- δ_i is unchanged under extension of the complete valued base field.
- For a short exact sequence 0→H′→H→H″→0 of finite flat O_B-stable groups, the Morita degree of H is the sum of those of H′ and H″.
- δ_i depends only on the place π_i: the U_j of §1.2 with j≠i leave it unchanged.

**Checks.**

- An étale Morita component has δ_i=0, and a multiplicative component of height d_i a_i has δ_i=d_i a_i; a coordinate that ignored the polarization pairing would assign the two π_i^± components of a multiplicative group the values d_i a_i and 0 and depend on the choice of sign.
- For a matrix algebra M_m over the unramified ring, the full O_B-stable group has m times the degree of its Morita component; δ_i is the component degree, so the multiplicative endpoint is d_i a_i and not m·d_i a_i.
- For the modular curve (type C, d=a=1) and an elliptic curve with Hasse valuation 1/2 at p=3, the canonical subgroup has degree 1/2 and each of the other three subgroups of order 3 has degree 1/6, so δ takes the value 1/2 or 1/6 at the four Iwahori points above it (HodgeTateAndCanonicalSubgroups §3.6).

### 1.2 The normalized PEL operators

For the complement correspondence at π_i, with projections p₁,p₂ and quotient isogeny π_i, define U_i=p^(−n_i)·Tr_(p₁)∘π_i^*∘p₂^* on sections of ω^κ over admissible opens of X_Iw^rig, where n_i=d_i a_i b_i in type A and n_i=d_i a_i(a_i+1)/2 in type C. The coefficient pullback uses the isogeny together with the polarization descended along x_i, and the definition includes the tame-level transport and the passage to a common refinement of the two fans. Prove that U_i and U_j commute for i≠j and that U_i leaves δ_j unchanged for j≠i (BPS §2 and §2.2; the commutation formula for U_iU_j with descended polarization (x_ix_j)λ).

A proof route is as follows: build the quotient isogenies on the Iwahori correspondence, use finiteness and étaleness of the generic projections to define the trace, and identify iterated quotients by complements at distinct places to prove commutation.

*Needs:* §1.1; gap:pel-iwahori-correspondences; AutomorphicBundles §B1.10; AutomorphicBundles §B5.1; ShimuraCompactifications §C3.1; ShimuraCompactifications §C3.3.

The basic properties of this construction are:

- Evaluated at a point, U_i f is p^(−n_i) times the sum over admissible complements L of the coefficient pullback of f at the quotient by L.
- U_iU_j=U_jU_i for i≠j.
- The operator is independent of the common fan refinement used to define it.

**Checks.**

- Type C with d=a=1 (the modular curve) has n=1, and type C with d=1, a=2 (the Siegel threefold) has n=3; type A with d=a=b=1 has n=1.
- Changing x_i by a totally positive unit u changes the descended polarization by u; the operators for x_i and ux_i agree only after composing with the induced action of u on the coefficient and polarization data, and are otherwise different maps.
- Without the factor p^(−n_i), the Siegel operator would multiply every eigenvalue by p³ and shift every slope by 3; the ordinary locus would then carry slope 3 instead of slope 0.

### 1.3 Degree monotonicity and the equality case

Prove that if y lies in U_i({x}) then δ_i(y)≥δ_i(x) and δ_j(y)=δ_j(x) for j≠i. Prove that equality δ_i(y)=δ_i(x) forces the Morita component of H_(i,a_i) to be a truncated Barsotti–Tate group of level one, the p-torsion to be the direct sum of it and a complementary totally isotropic truncated Barsotti–Tate group of level one, and δ_i(x) to be an integer (BPS Propositions 3.1.1–3.1.3).

A proof route is as follows: the canonical isogeny between the two Barsotti–Tate objects restricts to a generic isomorphism from H_(i,a_i) at x to its image at y, so the degree increases; in the equality case the generic isomorphism is an isomorphism, the product of the subgroup and the complement maps isomorphically onto the p-torsion, and the degree of a truncated Barsotti–Tate group of level one is an integer.

*Needs:* §1.2; HodgeTateAndCanonicalSubgroups §0.7; HodgeTateAndCanonicalSubgroups §0.8.

**Checks.**

- In the modular-curve example of §1.1 (p=3, Hasse valuation 1/2), a point with δ=1/6 has U-images with δ equal to 1/2 (quotient by the canonical subgroup) or 5/6 (quotient by one of the two other non-distinguished subgroups); both exceed 1/6.
- At the multiplicative endpoint δ_i=d_i a_i every image has the same degree, and the endpoint is an integer as the equality case requires.
- A point with δ_i(x)=1/2 cannot have an image of equal degree, since 1/2 is not an integer.

### 1.4 Uniform progress on closed degree bands

Prove that for an integer 0≤n≤d_i a_i−1 and rationals 0<η≤ν<1 there is one N, uniform on the domain, such that U_i^N maps δ_i⁻¹([d_i a_i−n−ν,d_i a_i]) into δ_i⁻¹([d_i a_i−n−η,d_i a_i]), with the other coordinates unchanged (BPS Proposition 3.2.1 and Corollary 3.2.2).

A proof route is as follows: the band V=δ_i⁻¹([d_i a_i−n−ν,d_i a_i−n−η]) is quasi-compact and contains no integral degree, so the function δ_i∘p₂−δ_i∘p₁ on its preimage in the correspondence is the valuation of an analytic function, attains a minimum ε, and ε>0 by §1.3; take N greater than (ν−η)/ε. Half-open conditions on the other coordinates are exhausted by closed rational boxes rather than treated as quasi-compact.

*Needs:* §1.3.

**Checks.**

- At n=0 the target band reaches within η of the multiplicative endpoint; at η=ν the statement holds with N=0.
- A band [r−ν, r−η] containing an integer r′ would allow points of equal degree under U_i by §1.3, and no positive minimal increment exists there; the hypothesis 0<η≤ν<1 excludes it.
- A half-open band such as δ_i⁻¹(]d_i a_i−1,d_i a_i]) is not quasi-compact, and N is asserted only on each closed rational sub-band.

### Examples

For the Siegel threefold (type C, d=1, a=2) the operator U has normalization p⁻³, the degree runs over [0,2], and the walls crossed by continuation are the integers 1 and 2. For the modular curve at p=3 the four Iwahori points over an elliptic curve of Hasse valuation 1/2 have degrees 1/2,1/6,1/6,1/6, and U moves the degree-1/6 points to degrees 1/2 or 5/6.

### Dependencies

PELModuli §M0.20; PELModuli §M1.9; gap:pel-iwahori-correspondences; HodgeTateAndCanonicalSubgroups §§0.6–0.8; HodgeTateAndCanonicalSubgroups §3.6; AutomorphicBundles §B1.10; AutomorphicBundles §B5.1; ShimuraCompactifications §C3.1; ShimuraCompactifications §C3.3.

## Layer 2: PEL analytic continuation and classicality

The standing hypotheses of Layer 1 apply. Let f be an overconvergent section of ω^κ, κ a dominant weight, defined on a strict neighbourhood of the multiplicative ordinary tube, which is an eigenvector of every U_i with eigenvalue α_i≠0, and write s_i=v_p(α_i).

### 2.1 The strict small-slope region

For each place put c_i=min_j k_(i,j,a_i) in type C and c_i=min_j(k_(i,j,a_i)+l_(i,j,b_i)) in type A, the minimum of the terminal entries of κ over the d_i embeddings above π_i. The admitted region at π_i is s_i≥0 and s_i+n_i<c_i; equivalently there is a rational ε∈(0,1) with n_i+s_i−(1−ε)c_i<0. Prove that the region forces c_i>0, is open in the weight, and is preserved by increasing c_i or decreasing s_i (BPS Hypothesis 4.5.1 and Lemma 4.4.5).

The condition s_i≥0 is part of the region. BPS Lemma 4.4.5 bounds the bad operator by p^(n_i−ν c_i) for complements of degree at least ν, and replacing ν by its lower bound 1−ε is legitimate only when c_i≥0; with s_i≥0 the strict inequality gives c_i>n_i≥0. Weights with c_i<0 and negative slopes satisfying s_i+n_i<c_i are outside this roadmap's theorem.

A proof route is as follows: the dominance ordering bounds every weight entry below by the terminal ones; choose ε from the strict inequality.

*Needs:* §1.2.

The basic properties of this construction are:

- For rationals c,s and a natural number n, the region is the strict inequality s+n<c together with s≥0; its boundary s+n=c is excluded.
- Increasing c or decreasing s within s≥0 preserves the region.
- If the region holds then c>0.
- The region holds iff some rational ε∈(0,1) gives n+s−(1−ε)c<0.

**Checks.**

- n=3, c=4, s=0 lies in the region, and any ε<1/4 works: 3−4(1−ε)<0 exactly when ε<1/4.
- n=3, c=3, s=0 is the boundary and is excluded; with ε>0 the exponent 3−3(1−ε)=3ε is positive.
- n=3, c=4, s=1/2 lies in the region, with ε<1/8.
- n=1, s=−3, c=−1 satisfies s+n<c, but c<0 and s<0; it is excluded by s≥0, and for it the bound p^(n−νc) grows with ν, so no contraction follows.

### 2.2 Continuation near the multiplicative locus

Prove that f extends uniquely to the locus where δ_i>d_i a_i−1 for every i, using only α_i≠0 and no slope bound (BPS Proposition 4.2.1 and Remark 4.2.2).

A proof route is as follows: for a closed rational sub-band, §1.4 gives N with U^N mapping it into the original domain; define the extension there by α^(−N)U^N f, and compare different N by the eigenrelation. Extend one place at a time; commutation keeps the other eigenrelations.

*Needs:* §1.4.

**Checks.**

- Changing N after the image has entered the original domain gives the same section, because α^(−N−1)U^(N+1)f=α^(−N)U^N(α⁻¹Uf)=α^(−N)U^N f there.
- If α_i=0 the formula α_i^(−N)U_i^N f is undefined, and the zero eigenvalue cannot be allowed.
- At the Siegel threefold (d=1,a=2) the continuation reaches δ>1, not yet the wall δ=1.

### 2.3 The bad-complement filtration

Fix ε as in §2.1, γ<ε and a rational 0<β<ε. On the quasi-compact domain U_γ where δ_i≤d_i a_i−1+γ and the other coordinates lie in closed rational intervals, let N(x,β) count the points y of U_i({x}) with δ_i(y)≤d_i a_i−1+β; equivalently the complements L whose Morita component has degree at least 1−β. Put V_k={x : N(x,β)≥k}. Prove that (V_k) is a decreasing sequence of quasi-compact opens with V₀=U_γ and V_k empty for k large. Let B_k parametrize ordered k-tuples of distinct complements, with finite étale forgetful projection p_k to X_Iw^rig, and B_(k,β) the quasi-compact open where all k complements have degree at least 1−β; then V_k=p_k(B_(k,β)). On V_k∖V_(k+1) the correspondence splits as U_i=U_i^good⊔U_i^bad with both pieces finite étale over the base, the bad piece formed by the k complements of large degree. For β<β′<ε the corresponding V′_k is a strict neighbourhood of V_k (BPS Definitions 4.3.2–4.3.5, Lemma 4.3.6, Propositions 4.3.7 and 4.3.10, Lemma 4.4.3).

The restriction of p_k to B_(k,β) is not asserted finite over V_k, and B_k→(X_Iw^rig)^k is not asserted finite étale: each quotient coordinate q_j:B_k→X_Iw^rig is used separately, by intersecting the quasi-compact preimages q_j⁻¹(·) and then taking the image under the finite étale p_k (BPS Lemma 4.4.3 is corrected in this way).

A proof route is as follows: express the degree conditions by the absolute values of sections δ_L of line bundles on B_k^rig, use separatedness for finite intersections and the finite étale p_k for images, and restrict to a constant-count stratum before applying the finite étale splitting criterion.

*Needs:* §1.1; §1.2.

The basic properties of this construction are:

- N(x,β) counts complements of Morita degree at least 1−β, and V_k is the locus N≥k.
- V_(k+1)⊆V_k, V₀ is the whole domain, and V_k is empty beyond the number of complements.
- On V_k∖V_(k+1) the good images lie where δ_i>d_i a_i−1+β and the bad images where δ_i≤d_i a_i−1+β.
- Each coordinate q_j pulls back degree conditions to quasi-compact opens of B_k.

**Checks.**

- If no complement is bad, V₁ is empty and U_i is entirely good on the domain.
- A point with exactly one bad complement lies in V₁∖V₂.
- The strata V_k∖V_(k+1) partition the domain but do not form an admissible cover; gluing uses the strict neighbourhoods V′_k.
- In positive dimension and k≥2, B_k has the dimension of X_Iw^rig while (X_Iw^rig)^k has k times that dimension, so B_k→(X_Iw^rig)^k cannot be finite étale onto an open.

### 2.4 First-good path decomposition

For N≥1, partition the length-N correspondence paths by their first good step: T_j consists of j bad steps followed by one good step, for 0≤j<N, and R_N of N bad steps. In the correspondence-composition order of BPS, U_i^N=Σ_(j=0)^(N−1) U_i^(N−1−j)∘T_j+R_N, where the left factor supplies the remaining arbitrary steps. The labels form a finite ordered tree compatible with the bad-count strata and their strict neighbourhoods (BPS Theorem 4.4.1 and Lemmas 4.4.2–4.4.4).

A proof route is as follows: induct on N, replacing each all-bad remainder by its next good and bad parts, using Proposition 4.3.10 to keep every composed correspondence defined and the coordinate maps of §2.3 for quasi-compactness. After contravariant pullback the T_j become the section operators of §2.6.

*Needs:* §2.3; §2.2.

**Checks.**

- At N=2 the four words GG, GB, BG, BB each occur exactly once: GG and GB in U∘T₀, BG in T₁, BB in R₂.
- The term T_j is followed by N−j−1 arbitrary steps; omitting the factor U^(N−1−j) loses every word with a good step before the end.
- At N=1 the decomposition is U=T₀+R₁=U^good+U^bad.

### 2.5 Contraction of bad paths

Prove that on a stratum whose bad complements have degree at least 1−ε the normalized bad map has norm at most p^(n_i−(1−ε)c_i), so that α_i⁻¹U_i^bad has norm at most q_i=p^(n_i+s_i−(1−ε)c_i), and q_i<1 in the region of §2.1 (BPS Lemma 4.4.5; Lemmas 4.5.3 and 4.5.5).

A proof route is as follows: apply the coefficient bound to each weight component, use c_i>0 before inserting the degree lower bound, and use the nonarchimedean trace bound and the normalization p^(−n_i).

*Needs:* §2.1; §2.4.

**Checks.**

- In genus two, n=3, c=4, s=0 and ε<1/4 give q=p^(4ε−1)<1.
- With c=3, s=0 the exponent is 3ε≥0 for ε≥0, so q≥1 and no contraction holds.
- At the multiplicative endpoint there are no bad complements, the bad map is zero and the bound is vacuous.

### 2.6 Kassaei path sums

Define f_N=Σ_(j=0)^(N−1) α_i^(−j−1)·(T_j)^*f, the sum over j-bad-then-good paths applied to f. Prove that the f_N are uniformly bounded, that their discrepancies on overlaps of the strict neighbourhoods are at most M·q_i^N, and that for integers A_N→∞ below the resulting valuation bound, reduced by the fixed loss n_i+s_i, the reductions of f_N modulo p^(A_N) glue on the admissible cover and are compatible from N+1 to N (BPS Definition 4.5.2, Lemmas 4.5.3 and 4.5.5, Propositions 4.5.6–4.5.7).

A proof route is as follows: use §2.4 and the eigenrelation to write the remainder through R_N, bound it by §2.5, glue modulo p^(A_N) on the cover by the V′_k, and pass to the inverse limit of bounded integral sections before inverting p.

*Needs:* §2.5; gap:bounded-section-gluing.

The basic properties of this construction are:

- f_N is a finite sum of path operators applied to f with coefficients α^(−j−1).
- The sections f_N are bounded independently of N.
- Differences on admissible overlaps have norm at most M·q_i^N.
- Refining the neighbourhoods preserves the reductions at all common precisions.

**Checks.**

- When the bad part vanishes, f₁=α_i⁻¹U_i f and every f_N with N≥1 equals f₁.
- The N=1 term is α_i⁻¹(U_i^good)^*f.
- A fixed precision A does not suffice: the extension is the inverse limit over A_N→∞, and with A fixed the glued sections determine f only modulo p^A.

### 2.7 Bounded continuation across all walls

Prove that f extends to a bounded section of ω^κ on every closed degree box, hence, exhausting half-open conditions by closed rational boxes, gluing by uniqueness and iterating over integral walls and places, to a section of ω^κ on all of X_Iw^rig satisfying the same U_i-eigenrelations (BPS Propositions 4.1.2, 4.5.7 and 4.5.8).

A proof route is as follows: §2.6 gives a compatible system of bounded integral sections; Bartenwerfer's theorem and gluing modulo increasing precision produce the bounded section; continuations on overlapping closed boxes agree by the same contraction argument. Half-open degree strips are not asserted quasi-compact.

*Needs:* §2.6; §2.2; gap:bounded-section-gluing; AdicSpacesPartIII §R3.2.

**Checks.**

- Two continuations on overlapping closed boxes agree, so the exhaustion changes neither the section nor its eigenrelations.
- For the Siegel threefold, continuation proceeds from δ>1 across the wall δ=1 and then to δ≥0; at each wall the bad stratum is the locus of complements of degree near 1.
- On the half-open strip δ_i∈]d_i a_i−1,d_i a_i] no uniform contraction constant is asserted; each closed sub-box has its own.

### 2.8 PEL small-slope classicality

Assume every connected component of the Shimura variety has complex dimension greater than one. Let f be an overconvergent U_i-eigensection of dominant weight κ with s_i≥0 and s_i+n_i<c_i for every i. Prove that f is the analytification of an algebraic section of ω^κ at Iwahori level over K, and that a cuspidal f gives a cuspidal algebraic form (BPS Theorem 5.3.1, with Propositions 5.2.1 and 5.2.4 and Corollaries 5.2.2–5.2.3).

A proof route is as follows: §2.7 extends f to X_Iw^rig. On the normal toroidal compactification of the Iwahori model the coefficient is formally canonical modulo every power of the uniformizer, so the Koecher principle extends integral sections across the boundary modulo every p^n; pass to the formal inverse limit, to the rigid generic fibre, and apply proper GAGA. Normality is that of the normalized model, not of a replacement with different sections.

*Needs:* §2.7; ShimuraCompactifications §C5.19; ShimuraCompactifications §C5.20; ShimuraCompactifications §C5.21; ShimuraCompactifications §C5.22; AutomorphicBundles §B3.10; AdicSpacesPartIII §R3.7.

**Checks.**

- For the Siegel threefold with κ=(k₁,k₂), c=k₂ and n=3, so the theorem applies to slopes s<k₂−3: at k₂=4 the condition is s<1, and at k₂=3 no slope s≥0 is allowed. This region lies inside the sharp holomorphic region s<k₂−2 of HigherHidaAndColemanTheory §9.3 for the same operator p⁻³U_naive; a region exceeding it would contradict that bound's sharpness.
- The algebraic section analytifies to f and is unique: two algebraic sections with the same analytification agree by GAGA.
- At a component of dimension one the Koecher principle fails at the cusps, which is why the hypothesis is imposed; the modular-curve threshold s<k−1 is the theorem of HigherHidaAndColemanTheory §§5.10 and 9.2.

### Examples

For the Siegel threefold at p, an overconvergent U-eigenform of weight (6,5) and slope 1 satisfies 1+3<5 and is classical. An eigenform of weight (6,4) and slope 1 has 1+3=4 and lies on the excluded boundary; the theorem says nothing about it.

### Dependencies

Layer 1; gap:bounded-section-gluing; AdicSpacesPartIII §R3.2; AdicSpacesPartIII §R3.7; ShimuraCompactifications §§C5.19–C5.22; AutomorphicBundles §B3.10.

## Layer 3: Singular Siegel weight at spherical level

Standing hypotheses for Layer 3. X is the genus-two Siegel threefold over ℤ_p at hyperspecial level at p and neat tame level prime to p, with compatible toroidal and minimal compactifications and boundary D; X₁ is its special fibre and X₁^≥1 the open locus of p-rank at least one. The coefficient is Ω(k,r)=Sym^kω⊗det(ω)^r with k≥0 (AutomorphicBundles §B4.16); each statement gives its bound on r. The Klingen complex M_Kli over Λ₁=ℤ_p[[ℤ_p×]], its ordinary projector f for U=U₁U₂ and its two-term control are those of HigherHidaAndColemanTheory §§9.4 and 9.8.

### 3.1 The integral spherical operator

For k≥0 and r≥2 define T₁=p^(−2−r)T₁′ and T₂=p⁻¹T₂′ as cohomological correspondences on RΓ(X,Ω(k,r)(−D)), where T₁′ is the coefficient pullback followed by the fundamental-class trace along the correspondence of Lagrangian subgroups of A[p], and T₂′ uses the dual factor; put T=T₁T₂. Prove that both divisions are integral, that T preserves the subcanonical complex and is independent of the fan refinement, that it commutes with the Hecke action away from p, and that on the generic fibre T=p^(3−r)(T_(p,1)+(1+p+p²+p³)T_(p,0)) in terms of the classical spherical operators (Pilloni, §§7.1–7.3, pp. 37–42). The integral correspondences need not be finite flat on the rank-zero or boundary strata, which is why the fundamental class replaces the finite flat trace.

A proof route is as follows: build T₁′ from the fundamental-class trace and the coefficient map, prove divisibility by p^(2+r) and by p on the smooth dense locus and extend by normality, and descend over common fan refinements preserving the boundary ideal.

*Needs:* HigherHidaAndColemanTheory §9.4; gap:higher-coherent-hecke; gap:lci-fundamental-class; SchemeAndStackFoundations §2.19; SchemeAndStackFoundations §2.21; ShimuraCompactifications §C3.3.

The basic properties of this construction are:

- T is the product of the two integrally normalized factors T₁ and T₂.
- On the generic fibre T=p^(3−r)(T_(p,1)+(1+p+p²+p³)T_(p,0)).
- T preserves the subcanonical complex and does not depend on the fan refinement.
- T commutes with the spherical Hecke operators at primes ℓ∤Np.

**Checks.**

- At r=3 the generic scalar p^(3−r) is one.
- The double coset of diag(1,p,p,p²) has degree p(1+p+p²+p³), and that of diag(1,1,p,p) has degree 1+p+p²+p³; at p=2 these are 30 and 15.
- An unnormalized finite flat trace on the whole integral correspondence is not defined at points where the correspondence is not flat, so it cannot replace the fundamental class in T₁′.

### 3.2 Rank-zero nilpotence

Prove that there is a constant C(p), independent of the tame level, such that for k≥C(p) and r≥p²+p the cohomological correspondence T₁ restricted to the p-rank-zero stratum of X₁ is zero, and deduce, using the commutation of T with the Hasse invariants, nilpotence of suitable powers of T on the thickenings of that stratum (Pilloni, Proposition 7.4.2.2 and Lemma 7.4.2.6, pp. 49–50).

A proof route is as follows: on p-rank zero every subgroup of order p³ in the correspondence contains the Frobenius kernel, so the isogeny factors through Frobenius and the coefficient map gains a factor of p; Artin–Rees on the fundamental-class lattice and a finite cover make C independent of level.

*Needs:* §3.1; HodgeTateAndCanonicalSubgroups §0.14.

**Checks.**

- The bound is independent of the tame level: the constant is chosen before the level.
- On a thickening of the rank-zero stratum the conclusion is nilpotence of a power of T, not vanishing of T itself.
- For r=p²+p−1 the hypothesis fails, and the statement makes no assertion.

### 3.3 Spherical ordinary amplitude

Prove that for k>p+1 and r≥2 the operator T acts locally finitely on RΓ(X₁^≥1,Ω(k,r)(−D)); that for k≥C(p) and r≥2 its ordinary part eRΓ(X₁^≥1,Ω(k,r)(−D)) is a perfect complex of 𝔽_p-vector spaces of amplitude [0,1]; that for r≥3 and k≥C(p) the restriction eRΓ(X₁,Ω(k,r)(−D))→eRΓ(X₁^≥1,Ω(k,r)(−D)) is a quasi-isomorphism; and that for r=2 and k≥C(p) it is an isomorphism on H⁰ and injective on H¹ (Pilloni, Lemma 8.2.1 and Proposition 8.2.1, pp. 52–54).

The amplitude statement is for the special-fibre open X₁^≥1; the global special fibre has the same amplitude only for r≥3, and no integral global amplitude follows.

A proof route is as follows: resolve Ω(k,r)(−D) on X₁ by the colimit of Hasse-invariant multiplications and its quotient by powers of the Hasse invariant; the pieces are supported on the rank-two and rank-one loci, which are affine in the minimal compactification, and are acyclic relative to it. Remove the rank-zero contribution by §3.2 and use the support sequence; the codimension-two rank-zero stratum gives H⁰ unconditionally.

*Needs:* §3.2; HigherHidaAndColemanTheory §2.3; IntegralHeckeAndGaloisDeterminants §2.3; gap:hilbert-siegel-minimal-acyclicity; ShimuraCompactifications §C5.16.

**Checks.**

- At p=2 local finiteness needs k>3, so k=3 is outside the statement.
- At r=2, H² of the global special fibre is not discarded: the comparison gives only an isomorphism on H⁰ and an injection on H¹.
- The rank-zero stratum has codimension two in the smooth X₁, so H⁰(X₁^≥1,Ω(k,r)(−D))=H⁰(X₁,Ω(k,r)(−D)) for every k and r, before any ordinary projection.

### 3.4 Away-from-p Hecke normalization

For ℓ∤Np prove that the three spherical Hecke operators T_(ℓ,0), T_(ℓ,1), T_(ℓ,2) act on M_Kli, commute with the ordinary projector and with derived character specialization, and that in Pilloni's normalization T_(ℓ,2) is ℓ⁻³ times the raw trace and T_(ℓ,0), T_(ℓ,1) are ℓ⁻⁶ times theirs, with T_(ℓ,0) invertible. Prove that the degree-four Hecke polynomial and multiplier in this normalization match the dual-spin polynomial of IntegralHeckeAndGaloisDeterminants §3a.2 after the conversion of indices and twists given there (Pilloni, §15.1, p. 106; §15.2, pp. 107–108).

A proof route is as follows: the ℓ-isogeny correspondences are étale and commute with the height-one tower; correspondence commutation precedes the ordinary projector, and specialization is base change of the perfect complex.

*Needs:* HigherHidaAndColemanTheory §9.4; IntegralHeckeAndGaloisDeterminants §2.1; IntegralHeckeAndGaloisDeterminants §3a.2; SmoothRepresentationsOfLocalGroups §SR.4.5; gap:higher-coherent-hecke.

**Checks.**

- At ℓ=3 the two scalars are 1/27 and 1/729.
- Without the factor ℓ⁻⁶ the eigenvalue of T_(ℓ,0), and with it the multiplier ℓ³Θ(T_(ℓ,0)) of §3.5, is multiplied by ℓ⁶; for ℓ=3 and p=5 this multiplies the residual multiplier by 3⁶=729≡4 mod 5, so the comparison with det ρ̄ fails.
- The T₁ and T₂ indices of the dual-spin polynomial are swapped relative to SmoothRepresentationsOfLocalGroups §SR.4.5; using one convention's polynomial with the other's operators gives the wrong coefficient of X³.

### 3.5 Euler characteristic zero on the Klingen family

Let 𝔪 be a maximal ideal of the away-from-Np Hecke algebra acting on M_Kli whose residual Galois representation ρ̄ is absolutely irreducible and unramified outside Np, with det(1−Xρ̄(Frob_ℓ)) the normalized degree-four Hecke polynomial of §3.4 and multiplier ℓ³Θ(T_(ℓ,0)). Prove that the Euler characteristic of the perfect complex (M_Kli)_𝔪 over each character component of Λ₁ is zero, at p=2 over the full local algebra (Pilloni, Theorem 15.2.1 and §15.2.5, pp. 107–109; Proposition 15.2.4.1).

This is vanishing of the alternating rank; it does not assert that either cohomology module of (M_Kli)_𝔪 is torsion (Pilloni, Remark 15.2.1, conjectures a support bound).

A proof route is as follows: on each component choose a classical weight k large enough, in the sign convention where the parameter λ₁=−k−1 is negative. At that weight the two-term control of HigherHidaAndColemanTheory §9.8 and the spherical comparison of §3.3 identify the fibre with ordinary coherent cohomology in degrees zero and one, the isolated spherical refinement of HigherHidaAndColemanTheory §9.5 matches the ordinary Satake root, and after localization at 𝔪 coherent cohomology is automorphic. At the same finite representation the holomorphic and the generic limit of discrete series contribute in degrees zero and one with equal multiplicity, so the virtual rank of the fibre is zero; derived base change propagates this to every weight of the component. Odd p has p−1 components and each needs its own witness.

*Needs:* §3.3; §3.4; HigherHidaAndColemanTheory §9.5; HigherHidaAndColemanTheory §9.8; AutomorphicFormsOnReductiveGroups §6.5; AutomorphicFormsOnReductiveGroups §6.6; gap:coherent-automorphic-realization; EndoscopicTransferAndUnitaryTraceComparison §11.1; IntegralHeckeAndGaloisDeterminants §3b.1; DeformationAndDerivedPatchingAlgebra §7.3.

**Checks.**

- A two-term perfect complex Λ₁→Λ₁ given by multiplication by a nonzero non-unit has Euler characteristic zero and torsion H¹, while the zero map has Euler characteristic zero and free H⁰ and H¹; vanishing of the alternating rank distinguishes neither from the other.
- For odd p, Λ₁ has p−1 components indexed by characters of μ_(p−1); a witness weight determines only its own component's virtual rank.
- With λ₁=k+1 positive the parameter lies in the other chamber and the limit-of-discrete-series computation does not apply; the witness uses λ₁=−k−1<0 (the sign of Pilloni §15.2.2 is corrected in this way).

### Examples

At weight Ω(k,2) with k≥C(p), the ordinary part of RΓ(X₁^≥1,Ω(k,2)(−D)) has amplitude [0,1], and the localized Klingen family at a non-Eisenstein 𝔪 has H⁰ and H¹ of equal generic rank on each component.

### Dependencies

HigherHidaAndColemanTheory §2.3; HigherHidaAndColemanTheory §§9.4–9.5; HigherHidaAndColemanTheory §9.8; gap:higher-coherent-hecke; gap:lci-fundamental-class; gap:hilbert-siegel-minimal-acyclicity; gap:coherent-automorphic-realization; EndoscopicTransferAndUnitaryTraceComparison §11.1; SchemeAndStackFoundations §§2.19, 2.21; ShimuraCompactifications §C3.3; ShimuraCompactifications §C5.16; HodgeTateAndCanonicalSubgroups §0.14; IntegralHeckeAndGaloisDeterminants §§2.1, 2.3, 3a.2, 3b.1; SmoothRepresentationsOfLocalGroups §SR.4.5; AutomorphicFormsOnReductiveGroups §§6.5–6.6; DeformationAndDerivedPatchingAlgebra §7.3; AutomorphicBundles §B4.16.

## Layer 4: Hilbert–Siegel partial-ordinary Hida complexes

Standing hypotheses for Layers 4, 5 and 6. F is a totally real field, p>2 splits completely in F, S_p is the set of places above p, written S_p=I⊔Iᶜ, and G₁=Res_(F/ℚ)GSp₄. At v∈I take Klingen level at p and at v∈Iᶜ Iwahori level; fix a neat tame level, compatible toroidal and minimal compactifications and totally positive polarization elements x_v. For integers k_v≥l_v with k_v≡l_v mod 2 put ω^κ=⊗_v Sym^(k_v−l_v)(ω_v)⊗det(ω_v)^(l_v). For the integral descent to the subgroup G with rational similitude assume p∤|Δ| for the finite unit and deck quotient Δ of §4.2; statements for G₁ do not need it.

### 4.1 The mixed ordinary locus and the partial Igusa tower

For I⊆S_p let X^(≥1,I) be the spherical locus of p-rank at least one at v∈I and ordinary at v∈Iᶜ. At mixed Klingen/Iwahori level select the open subscheme where the distinguished height-one subgroup H_v is multiplicative for v∈I and the specified ordinary flag is chosen for v∈Iᶜ; it is strictly smaller than the inverse image of the rank locus. Over it, the partial Igusa tower trivializes T_p(H_(∞,v)^D) at every v and T_p((G_v^m/H_(∞,v))^D) at v∈Iᶜ; its transition maps are affine étale and are not finite outside the fully ordinary locus (BCGP21, §4.1, pp. 73–74; §4.3.4, pp. 96–97).

A proof route is as follows: use the maximal multiplicative height-one p-divisible subgroup over the rank strata, form the affine étale tower and its torsor of Tate-module trivializations, and keep the selected flag open and the boundary log structure.

*Needs:* gap:hilbert-siegel-mixed-models; gap:hilbert-siegel-partial-igusa; HodgeTateAndCanonicalSubgroups §3.10.

The basic properties of this construction are:

- The selected component of the mixed-level rank locus is open, and is preserved by complete extension of coefficients.
- The Igusa group of the tower is ∏_(v∈I)ℤ_p× × ∏_(v∈Iᶜ)(ℤ_p×)².
- The pulled-back toroidal boundary defines the subcanonical ideal on the tower.

**Checks.**

- For I=S_p there is one character coordinate per place; for I=∅ there are two per place and the locus is the ordinary locus with its flag.
- A point of p-rank at least one whose distinguished Klingen subgroup is not multiplicative lies in the inverse image of the rank locus but not in the selected component.
- On the p-rank-one locus the height-one multiplicative subgroup is unique, so the levels of the height-one tower are isomorphisms there, while on the ordinary locus a multiplicative line of μ_(p^m)² lifts to p lines at level m+1 (the fibres of ℙ¹(ℤ/p^(m+1))→ℙ¹(ℤ/p^m) have p points); a finite étale tower of constant degree is incompatible with both.

### 4.2 Universal coefficients

Write T_I=T_fin×T₀ for the Igusa group, with T₀ pro-p of rank |I|+2|Iᶜ| and Λ_I=ℤ_p[[T₀]]. Define the universal sheaf Ω^(κ_I) as the T_I-diagonal invariants of the pushforward of the Igusa structure sheaf completed-tensored with the universal continuous Λ_I-module, twisted by ⊗_v det(ω_v)². Its specialization at a classical weight κ with l_v=2 for v∈I and k_v≡l_v≡2 mod p−1 evaluates x_v^(k_v−2) at every place and y_v^(l_v−2) at v∈Iᶜ, and the highest-weight map ω^κ→Ω^(κ_I)⊗_κ ℤ_p is a projection. For the descent from G₁ to G, modify the positive-unit action by d(x)=[√x₀], using that squaring is invertible on the pro-p part for p>2, and when p∤|Δ| take the deck invariants as a direct factor (BCGP21, §§4.3–4.4, pp. 95–99).

When p divides |Δ| the deck invariants are not a direct factor and the integral descent needs derived invariants; neatness of the tame level does not exclude p-torsion in Δ (BCGP21, Proposition 4.4.3 and Lemma 3.8.5 are restricted in this way).

A proof route is as follows: descend the equivariant universal module along the tower, insert the determinant-square twist before comparing with algebraic characters, and apply the corrected unit action.

*Needs:* §4.1; gap:hilbert-siegel-partial-igusa; PadicMeasuresIwasawaAlgebras §1.6; PadicMeasuresIwasawaAlgebras §1.7.

The basic properties of this construction are:

- The universal sheaf is the diagonal-equivariant sheaf with determinant-square twist.
- At κ the universal character evaluates to x^(k−2)y^(l−2) on the stated coordinates.
- The highest-weight functional maps ω^κ onto the specialized sheaf.
- The corrected unit action is the tautological one multiplied by d(x).

**Checks.**

- At (k_v,l_v)=(2,2) for every v the pro-p character is trivial.
- For two split places with |I|=1 the weight space has dimension 1+2=3.
- For k_v>l_v the algebraic coefficient has rank k_v−l_v+1 and maps onto the rank-one highest-weight quotient with nonzero kernel; identifying them would lose the kernel, which is ordinary-nilpotent only after the projector of §4.5.

### 4.3 Commuting U operators

On the universal coefficient complex define U_(v,1) at Iwahori places with normalization p⁻³, and U_(v,2) as the product of the two quotient and dual factors with raw trace divisors p² and p, the determinant coefficient contributing p^(−l_v) at weight κ. Put U^I=∏_(v∈I)U_(v,2)∏_(v∈Iᶜ)U_(v,1)U_(v,2). Prove that all these operators commute as maps of the enhanced complex, that the universal action specializes to the weight-normalized geometric trace, and that common fan refinements intertwine them. The Klingen U_(v,1) and the Iwahori U_(v,1) are different operators (BCGP21, §4.5, pp. 100–104; Lemma 4.5.15, p. 104).

A proof route is as follows: construct coefficient pullback on each local primary quotient, check the two-factor normalization on integral highest-weight lattices, and descend commutation of correspondences through the faithful injection of the Hasse Čech and Cousin terms into the interior localization; commutation on cohomology alone does not suffice.

*Needs:* §4.2; gap:higher-coherent-hecke; gap:lci-fundamental-class; ShimuraCompactifications §C3.3; SmoothRepresentationsOfLocalGroups §SR.1.4.

The basic properties of this construction are:

- U^I is the mixed product of the displayed local factors.
- The local factors commute on the enhanced coefficient complex.
- The universal action specializes to the weight-normalized geometric trace.
- Common fan refinement intertwines all local factors.

**Checks.**

- For I=∅ the operator is ∏_v U_(v,1)U_(v,2); for I=S_p it is ∏_v U_(v,2).
- At (k_v,l_v)=(2,2) the normalization of U_(v,2) is p⁻³·p⁻²=p⁻⁵.
- Substituting the Iwahori first operator for the Klingen one changes the doubling relation of Layer 5 by the term Z of §5.1.

### 4.4 Fixed-weight special-fibre amplitude

Let X_(G₁,1)^I be the spherical special-fibre open of p-rank at least one at v∈I and ordinary at v∈Iᶜ. Prove that there is C(p,F), independent of the tame level, such that l_v≥2 everywhere, k_v−l_v≥C for v∈I and l_v≥C for v∈Iᶜ imply local finiteness of T^I=∏_(v∈I)T_v∏_(v∈Iᶜ)T_(v,1) on its cuspidal cohomology and that the ordinary part is a perfect complex of 𝔽_p-vector spaces of amplitude [0,|I|]. Prove that restriction from the global spherical special fibre to this open is an isomorphism on H⁰ and injective on H¹, and a quasi-isomorphism if l_v≥3 for every v∈I. For the generalized partial strata of BCGP21 Theorem 4.2.12 prove their perfectness and support-dependent endpoint comparisons, without a uniform numerical amplitude (BCGP21, Theorems 4.2.1 and 4.2.12, pp. 77–82; §4.2.30, Lemma 4.2.31, Proposition 4.2.33 and Remark 4.2.34, pp. 92–94).

A proof route is as follows: the partial Hasse invariants and their companion sections give an |I|+1-term supported resolution; use relative acyclicity for the minimal compactification and affineness of its rank strata, remove rank-zero pieces by local nilpotence as in §3.2, and trace the support triangle. The cuspidal amplitude is not asserted for canonical coefficients.

*Needs:* §4.3; §3.2; gap:partial-hasse-invariants; gap:hilbert-siegel-minimal-acyclicity; ShimuraCompactifications §C5.25.

**Checks.**

- For F=ℚ and I={p} this is §3.3's amplitude [0,1] on X₁^≥1.
- For I=∅ the open is the ordinary locus, which is affine in the minimal compactification, and the amplitude is [0,0].
- With l_v=2 at some v∈I, global H² of the special fibre is not discarded: only the H⁰ and H¹ endpoints are compared.

### 4.5 The partial-ordinary family complex

Define M_I=e(U^I)RΓ(𝔛_I,Ω^(κ_I)(−D)), the ordinary part of the derived global sections of the universal coefficient on the formal mixed-level infinite height-one tower, as an object of the derived category of Λ_I-modules. The limit and completion are those of the equivariant integral sheaf, not an underived limit of cohomology. At a classical character δ_κ use the derived tensor product with Λ_I/ker δ_κ and keep its Tor terms (BCGP21, §4.6 and Theorem 4.6.1(1), pp. 105–108).

A proof route is as follows: take the enhanced inverse system on the affine étale tower, apply the locally finite derived ordinary projector, and compare with the finite-level Hasse resolutions.

*Needs:* §4.2; §4.3; HigherHidaAndColemanTheory §2.3; PadicFamilies §0a.25.

The basic properties of this construction are:

- M_I is the U^I-ordinary derived formal global section complex.
- There is a derived character-specialization map to formal fixed-weight cohomology.
- Hecke operators away from the level and all commuting U factors act on M_I.
- Pullback and trace along compatible tame levels intertwine the coefficient action.

**Checks.**

- For I=∅ the amplitude asserted in §4.7 is [0,0].
- For F=ℚ and I={p}, M_I is the base change of the Klingen complex M_Kli of HigherHidaAndColemanTheory §9.4 from ℤ_p[[ℤ_p×]] to the trivial finite-character component ℤ_p[[1+pℤ_p]], with the determinant and character conventions matched.
- Before flatness is known, H^j(M_I)⊗_(Λ_I)Λ_I/ker δ_κ is not the derived fibre: for M=[Λ→Λ] given by multiplication by the generator of ker δ_κ in a one-variable Λ, H⁰(M)=0 and H¹(M)⊗Λ/ker δ_κ is free of rank one over ℤ_p, while the derived fibre has H⁰ and H¹ both free of rank one.

### 4.6 Trace congruence and Hasse dévissage

For J⊆S_p and the ordinary comparison between spherical and mixed level, the relevant special-stratum cover is finite étale of degree (p+1)^|Jᶜ|. Prove that for n large, Tr∘∏_(w∈Jᶜ)U_(w,2)^n∘i is congruent to p^|Jᶜ|(∏_(w∈Jᶜ)T̃_w)^n modulo p^(min_w(k_w−l_w)), and that under the large-weight bounds this gives the ordinary comparison on the Hasse resolution (BCGP21, Proposition 4.6.9, Lemmas 4.6.16–4.6.17 and Proposition 4.6.19, pp. 109–114).

The dévissage is by one Hasse exponent at a time: after any powers of the other partial Hasse invariants have been imposed, the next one is a nonzerodivisor, and the corresponding twist is applied. A simultaneous-powers exact sequence in two independent parameters is false: in k[x,y], the quotient k[x,y]/(xⁿ,yⁿ) has length n², and the recursion that the simultaneous sequence would give does not reproduce it (BCGP21 Proposition 4.6.19 is corrected in this way).

A proof route is as follows: use the finite étale cover and the explicit normalized quotient correspondence, track the factor p^|Jᶜ| (a sufficient bound is k_w−l_w>p^|Jᶜ|), and induct on the Hasse exponents using regularity after arbitrary powers.

*Needs:* §4.4; §4.5; gap:partial-hasse-invariants; gap:hilbert-siegel-minimal-acyclicity.

**Checks.**

- With one auxiliary place the cover has degree p+1 and the comparison keeps its leading factor p.
- For two independent Hasse parameters the induction runs through k[x,y]/(x^a,y^b) by increasing a with b fixed, each step a short exact sequence with kernel isomorphic to k[x,y]/(x,y^b) up to twist, giving length ab.
- At k_w=l_w the congruence modulus is p⁰ and the statement is empty; large k_w−l_w is necessary.

### 4.7 Derived ordinary control

Prove that M_I is perfect over Λ_I of amplitude [0,|I|]; that for every classical κ with l_v=2 on I and k_v≡l_v≡2 mod p−1, its derived δ_κ-fibre is e(U^I)RΓ of the formal mixed-level variety with coefficient ω^κ(−D); and that there is a constant C, depending only on p, such that for k_v−l_v≥C at every place and l_v≥C on Iᶜ the map from ordinary spherical cohomology to the fibre is an isomorphism on H⁰ and injective on H¹ (BCGP21, Theorem 4.6.1, pp. 105–106; Lemmas 4.6.22–4.6.27, pp. 114–117). No classical quasi-isomorphism for arbitrary |I| is asserted.

A proof route is as follows: show that U^I, as a product, is divisible by p on the highest-weight kernel; apply §4.6 and residual detection of amplitude to obtain perfectness and control at one witness weight large at every place; transport to every character by derived control.

*Needs:* §4.5; §4.6; DeformationAndDerivedPatchingAlgebra §7.3; DeformationAndDerivedPatchingAlgebra §9.2.

**Checks.**

- For F=ℚ and I={p} the amplitude is [0,1], matching HigherHidaAndColemanTheory §9.8.
- Every residue fibre of a perfect complex of amplitude [0,|I|] has cohomology only in degrees 0,…,|I|; a residue fibre with H^(|I|+1)≠0 would contradict the statement.
- The classical specialization keeps Tor terms: the fibre is a derived tensor product even though M_I is perfect.

### Examples

For F real quadratic with p split and I one of the two places, Λ_I has dimension 1+2=3, M_I has amplitude [0,1], and at weight ((k,2),(k′,l′)) with k≡k′≡l′≡2 mod p−1 its derived fibre is the ordinary cohomology of ω^κ(−D) on the mixed Klingen/Iwahori formal model.

### Dependencies

Layer 3; gap:hilbert-siegel-mixed-models; gap:hilbert-siegel-partial-igusa; gap:higher-coherent-hecke; gap:lci-fundamental-class; gap:partial-hasse-invariants; gap:hilbert-siegel-minimal-acyclicity; HodgeTateAndCanonicalSubgroups §3.10; PadicMeasuresIwasawaAlgebras §§1.6–1.7; ShimuraCompactifications §C3.3; ShimuraCompactifications §C5.25; SmoothRepresentationsOfLocalGroups §SR.1.4; HigherHidaAndColemanTheory §2.3; HigherHidaAndColemanTheory §9.4; HigherHidaAndColemanTheory §9.8; PadicFamilies §0a.25; DeformationAndDerivedPatchingAlgebra §§7.3, 9.2.

## Layer 5: Hilbert–Siegel weight-two doubling

The standing hypotheses of Layer 4 apply, with w∈I a Klingen place. The normalized correspondences are constructed integrally; the Frobenius, rank-divisor, quadratic and doubling statements are on the special fibre in characteristic p, written with subscript 1. The companion calculation of §5.6 holds over any commutative ring.

### 5.1 Klingen and Iwahori first operators

At w∈I write U_Kli=p^(−min(3,l_w+1)) times the raw first trace, U_Iw=p⁻³ times its étale part and Z=p^(−l_w−1) times its multiplicative–étale part. Prove that U_Kli=U_Iw+p^(l_w−2)Z for l_w≥2 and U_Kli=p^(2−l_w)U_Iw+Z for l_w≤2; in particular U_Kli=U_Iw+Z at l_w=2 (BCGP21, §§5.2–5.4, pp. 119–124). Identify these geometric operators with the corresponding elements of the positive Klingen and Iwahori Hecke algebras of GSp₄(ℚ_p) at the split place w.

A proof route is as follows: split the first correspondence by its position relative to the distinguished multiplicative line, track coefficient pullback and trace divisibility on each piece, and compare the two scalar regimes at l_w=2.

*Needs:* §4.3; SmoothRepresentationsOfLocalGroups §SR.1.4.

**Checks.**

- At l_w=2 both regimes give U_Kli=U_Iw+Z.
- At l_w=3 the first formula gives U_Kli=U_Iw+pZ; at l_w=1 the second gives U_Kli=pU_Iw+Z.
- At l_w=2 the three normalizations are p⁻³, p⁻³ and p⁻³: the scalar p^(l_w−2) and p^(2−l_w) are both 1, and any other exponent breaks the agreement of the two regimes there.

### 5.2 Partial Frobenius on the rank-one divisor

On the interior Y₁^I of the mixed multiplicative-flag special fibre, with nonordinary rank-one divisor D_w=Y₁^(I,=w1), define F_w:Y₁^I→Y₁^I as the quotient by ker(Frob) on G_w and by A[v] at v≠w, with polarization descended from p²x_wλ and tame marking p⁻¹πη for the quotient isogeny π. Prove that F_w is finite flat of degree p³ on Y₁^I and p² on D_w, that F_w^*ω_w≃ω_w^p, and that F_w^*ω_v≃ω_v for v≠w through the identification A[v^∞]/A[v]≃A[v^∞] (BCGP21, Definition 5.6.2 and Proposition 5.6.3, p. 126). The finite flat statements are interior statements and are not extended to the toroidal boundary.

A proof route is as follows: compute the kernel at each place and the induced map on the determinant Hodge bundles, and check flatness and degrees on the ambient locus and on its rank-one divisor.

*Needs:* §4.1; gap:hilbert-siegel-mixed-models.

The basic properties of this construction are:

- F_w is the polarized partial-primary quotient with its level transport.
- Its degree is p³ on Y₁^I and p² on D_w.
- F_w^*ω_w≃ω_w^p.
- For v≠w, F_w^*ω_v≃ω_v through the quotient identification, not through the differential of an undivided p-isogeny.

**Checks.**

- For F=ℚ, F_w is the partial Frobenius of the Siegel threefold on its rank-one interior with the stated polarization convention.
- The degree on D_w is p², not the ambient p³; at p=3 these are 9 and 27.
- The tame marking includes the transport p⁻¹π; the identity marking does not define a point of the same moduli problem after the quotient.

### 5.3 Kodaira–Spencer scaling and the first trace

Prove that the O_F-linear Kodaira–Spencer identification of the canonical sheaf with ⊗_v det(ω_v)³ is compatible with prime-to-p quasi-isogenies over ℤ_(p) up to the polarization factor, and that for the first p-correspondence, after forming its normalized cohomological trace integrally, the factor Norm(x_w)³/p³ is an integral unit. After reduction to D_w and the coefficient identifications of §5.2, prove that Ha_w·U_Iw restricts to the normalized partial-Frobenius trace γ₁ (BCGP21, Propositions 5.5.1–5.5.3, pp. 123–124; Proposition 5.6.1, p. 125; Propositions 5.6.4–5.6.7, pp. 127–128). The differential of an inseparable isogeny is not substituted into the prime-to-p statement.

A proof route is as follows: use the de Rham pairing and the prime-to-p compatibility with its polarization factor, form the integral trace before reducing, track the norm-cube and p³ factors, and identify γ₁ through §5.2 and finite flat duality.

*Needs:* §5.2; §5.1; gap:hilbert-siegel-kodaira-spencer; gap:lci-fundamental-class; SchemeAndStackFoundations §2.21.

**Checks.**

- With x_w of valuation one at w, Norm(x_w)³ has valuation 3 at w, so Norm(x_w)³/p³ is a unit at w; with x_w of valuation two it would have valuation 3.
- The prime-to-p compatibility and the p-correspondence identity are separate steps; the prime-to-p statement alone gives nothing at p.
- Ha_w vanishes on D_w to first order, so Ha_w·U_Iw restricted to D_w can be nonzero only through the multiplicative part, which is what γ₁ records.

### 5.4 The second operator on the rank-one divisor

Prove that on the interior formal locus Y^I the first projection of the U_(w,2) correspondence is finite flat of degree p⁴; that on D_w its second projection is an isomorphism and its first projection identifies with F_w²; that the isogeny differential divided by p is a determinant unit δ; and that with this unit retained U_(w,2)=γ₂γ₁ on D_w (BCGP21, Lemma 5.7.2 and Proposition 5.7.3, p. 129; Proposition 5.7.4, p. 130; Proposition 5.7.9, pp. 131–132).

A proof route is as follows: classify the admissible totally isotropic subgroups of order p⁴ by their p-torsion and étale rank, identify the quotient on D_w, compute both determinant pullbacks and compose the two normalized Frobenius traces.

*Needs:* §5.3; §4.3; gap:lci-fundamental-class.

**Checks.**

- The ambient degree p⁴ equals the degree of F_w² on D_w, since F_w has degree p² there.
- Dropping the unit δ changes γ₂γ₁ by a unit and breaks the identity with U_(w,2) as maps of sheaves.
- At p=3 the ambient degree is 81.

### 5.5 Quadratic relation

Prove that on the scalar-weight-two ordinary locus U_Iw·Z=U_(w,2), and, combined with §5.1 at l_w=2, that U_Iw²−U_Kli·U_Iw+U_(w,2)=0 as maps from global sections to sections on the w-ordinary locus, with the analogous relation for Z. The operators on the three domains are related by restriction and are not identified as endomorphisms of one space (BCGP21, Lemma 5.8.1, p. 133; Lemma 4.5.17).

A proof route is as follows: compare the composite correspondences on the interior (the underlying correspondences satisfy pU_(w,2)=U_Iw·Z, and the normalizations p⁻⁵, p⁻³, p⁻³ absorb the factor p), then extend across the boundary by the coefficient and trace calculations.

*Needs:* §5.1; §5.4; SmoothRepresentationsOfLocalGroups §SR.1.4.

**Checks.**

- Substituting Z=U_Kli−U_Iw into U_Iw·Z=U_(w,2) gives U_Iw²−U_Kli·U_Iw+U_(w,2)=0, with positive constant term.
- The exponents satisfy 5+1=3+3, which is the normalization bookkeeping of the identity.
- On an eigenform with U_Kli=α+β and U_(w,2)=αβ, the roots of X²−(α+β)X+αβ are α and β; the relation allows U_Iw to take either.

### 5.6 The companion operator

For linear endomorphisms T and U of a module M over a commutative ring R, let C_(T,U) be the endomorphism (x,y)↦(Tx+Uy,−x) of M⊕M, built from `LinearMap.prod` and `LinearMap.coprod`. Prove that C²−diag(T)∘C+diag(U)=0, and that when U is invertible C is invertible with C⁻¹(x,y)=(−y,U⁻¹x+U⁻¹Ty). Neither identity needs T and U to commute. In the geometric doubling, T=U_Kli and U=U_(w,2) act on global sections, while the doubling map of §5.8 has target the sections on the w-ordinary locus (BCGP21, the matrix before Theorem 5.8.6, p. 134).

A proof route is as follows: expand both coordinates.

*Needs:* §5.5; `LinearMap.prod`; `LinearMap.coprod`.

The basic properties of this construction are:

- C_(T,U)(x,y)=(Tx+Uy,−x).
- C²−diag(T)∘C+diag(U)=0 for all T and U.
- If U is invertible, (x,y)↦(−y,U⁻¹x+U⁻¹Ty) is a two-sided inverse of C.
- If Tf=(α+β)f and Uf=αβf with α≠0, then (f,−α⁻¹f) is an eigenvector of C with eigenvalue α.

**Checks.**

- Over ℤ with T=5 and U=6, C sends (2,3) to (28,−2), and C² sends it to (28·5+6·(−2),−28)=(128,−28); then C²−5C+6 sends (2,3) to (128−140+12,−28+10+18)=(0,0).
- T=U=0 sends (x,y) to (0,−x), and its square is zero.
- Replacing −x by x in the second coordinate gives C²−diag(T)C−diag(U)=0, the polynomial X²−TX−U; for T=5, U=6 its roots are 6 and −1 instead of 2 and 3.

### 5.7 No everywhere-regular simultaneous eigenvector

Prove that in scalar weight two an eigenform regular on the whole mixed rank open X_(G₁,1)^I with U_Kli=α+β, U_Iw=α and U_(w,2)=αβ, αβ≠0, is zero, and that consequently a finite generalized eigenspace in the kernel of the doubling map is zero (BCGP21, Proposition 5.4.3 and Corollary 5.4.5, pp. 122–123; Theorem 5.8.4, p. 134). The stronger vanishing theorem of BCGP21 §5.9 is not needed.

A proof route is as follows: if the restriction to D_w vanishes, divide by Ha_w; the resulting weight is 3−p≤0 and the multiplicative–étale Z-action has no nonzero eigenvalue there. Otherwise restriction to D_w makes γ₁ vanish through Ha_w·U_Iw (§5.3), contradicting γ₂γ₁=U_(w,2)≠0 (§5.4). A nonzero generalized kernel contains a genuine eigenvector after coefficient extension.

*Needs:* §5.5; §5.3; §5.4.

**Checks.**

- The two cases (restriction to D_w zero or nonzero) exhaust the possibilities.
- At p=3 the weight after dividing by Ha_w is 0, and at p=5 it is −2; the argument needs 3−p≤0, which holds for every p≥3.
- With α=0 the hypothesis αβ≠0 fails and U_(w,2) vanishes on the eigenform; the theorem says nothing in that case.

### 5.8 The doubling injection

Prove that the doubling map Δ(f,g)=f+Zg from e(U_(w,2))H⁰(X_(G₁,1)^I,ω^(2,2)(−D))^⊕2 to e(U_Iw U_(w,2))H⁰(X_(G₁,1)^(I,=w2),ω^(2,2)(−D)), the sections on the w-ordinary locus, is injective and intertwines C_(U_Kli,U_(w,2)) with U_Iw (BCGP21, Theorem 5.8.6, pp. 134–135).

Source and target are different spaces, so the formal identity ker(f+Zg)={(−Zg,g)} for one common module does not apply.

A proof route is as follows: equivariance follows from U_Iw·Z=U_(w,2) and U_Kli=U_Iw+Z; the kernel is stable under the finite ordinary Hecke algebra and the companion action, so a nonzero kernel contains a simultaneous eigenvector (f,−β⁻¹f), whose image f satisfies U_Iw f=αf on the w-ordinary locus; §5.7 makes it zero.

*Needs:* §5.6; §5.7.

**Checks.**

- Equivariance: U_Iw(f+Zg)=U_Iw f+U_(w,2)g and the first coordinate of C(f,g) is U_Kli f+U_(w,2)g; the difference Z f is the image of the second coordinate −f under Z, so Δ∘C=U_Iw∘Δ.
- On a single module with Z an endomorphism, (−Zg,g) is a nonzero kernel element for every g≠0; the injectivity is a statement about the restriction map from global to w-ordinary sections, not about a formal 2×2 matrix.
- The ordinary projectors in source and target are for different operators, e(U_(w,2)) and e(U_Iw U_(w,2)).

### 5.9 Two unit-root refinements

On a finite Artinian Hecke block over a field of characteristic p where U_Kli−(α+β) and U_(w,2)−αβ are nilpotent with α≠β in 𝔽̄_p×, prove that the Hecke algebra E of the block is local Artinian, that it contains lifts α̃,β̃ with (U_Iw−α̃)(U_Iw−β̃)=0 on the doubled block, that the maps f↦(f,−ξ̃⁻¹f) for ξ∈{α,β} give an isomorphism of the block's double with itself, and that the composite with doubling is (f₁,f₂)↦(1−β̃U_Iw⁻¹)f₁+(1−α̃U_Iw⁻¹)f₂; each component is injective into the corresponding generalized U_Iw-eigenspace (BCGP21, Remark 5.8.7, pp. 135–136).

A proof route is as follows: lift the simple residual roots by Hensel's lemma in the complete local algebra E, build the coprime polynomial idempotents without assuming semisimplicity, and substitute the companion eigenvectors and §5.5.

*Needs:* §5.8; `HenselianLocalRing`; `Module.End.genEigenspace`; `LinearMap.eventually_isCompl_ker_pow_range_pow`.

**Checks.**

- For T=5 and U=6 the roots are 2 and 3; the refinement attached to α=2 has doubling image (1−3U_Iw⁻¹)f, using the opposite root.
- Integral projectors need α−β to be a unit; over ℤ_p with α=1 and β=1+p the difference is p, the idempotent (U−β)/(α−β) has denominator p and is not integral.
- On a block where U_Iw acts by a nontrivial Jordan block with eigenvalue α, the refinement map is still injective; generalized eigenspaces replace eigenspaces.

### Examples

At a block with residual roots α=2, β=3 in 𝔽₇, the doubling of the block injects into the w-ordinary sections, and its two refinements are the images of f↦(1−3U_Iw⁻¹)f and f↦(1−2U_Iw⁻¹)f.

### Dependencies

Layer 4; gap:hilbert-siegel-mixed-models; gap:hilbert-siegel-kodaira-spencer; gap:lci-fundamental-class; SchemeAndStackFoundations §2.21; SmoothRepresentationsOfLocalGroups §SR.1.4; `LinearMap.prod`; `LinearMap.coprod`; `HenselianLocalRing`; `Module.End.genEigenspace`; `LinearMap.eventually_isCompl_ker_pow_range_pow`.

## Layer 6: Hilbert–Siegel higher Coleman families and the one-place comparison

The standing hypotheses of Layer 4 apply; the base is ℂ_p or a finite extension of ℚ_p. These families are the mixed Klingen/Iwahori instance of HigherHidaAndColemanTheory §6.2, built on partial strict neighbourhoods of the mixed rank locus.

### 6.1 The analytic family complex

For a weight affinoid A in the relevant component of the weight space of Λ_I and radii (n,ε,w), descend the analytic highest-weight coefficient sheaf from the Hodge–Tate modified frame torsor, whose lattice satisfies p^(1/(p−1))ω⊂ω^mod⊂ω. Define C_cusp(n,ε,w,κ_A) as the derived sections of this coefficient tensored with det(ω^mod)²(−D) on the strict neighbourhood of the mixed locus at the given radii; the input analytic character is κ−(2,2). Define H† as the filtered colimit over admissible radii; no surjectivity at a fixed radius is asserted (BCGP21, §6.1, pp. 138–145; §6.3, pp. 147–152).

A proof route is as follows: import the canonical-subgroup frame torsor and analytic induction, descend with the determinant-square twist, and use the mixed-level compactification and support conditions for the derived sections and transition maps.

*Needs:* §4.1; §4.2; HigherHidaAndColemanTheory §6.2; OverconvergentAutomorphicForms §0.4; gap:hilbert-siegel-partial-igusa; HodgeTateAndCanonicalSubgroups §5.5.

The basic properties of this construction are:

- C_cusp(n,ε,w,κ_A) is the radius-dependent derived complex of the analytic coefficient.
- Shrinking radii gives compatible transition maps and a filtered system.
- The highest-weight algebraic map uses κ_A=κ−(2,2).
- The coefficient includes the transported ideal of D.

**Checks.**

- At scalar weight (2,2), κ_A is the trivial analytic character.
- The modified lattice need not equal ω integrally: at a point of Hasse valuation h>0 its index in ω is governed by h and the bound p^(1/(p−1)), so the two differ already on the strict neighbourhood.
- At a common smaller radius the two transition paths give the same coefficient map.

### 6.2 Mixed Coleman amplitude

Prove that for admissible n≥max_v n(ε_v) the cuspidal analytic complex is concentrated in degrees [0,|I|], using the cube of 2^|I| affinoid charts indexed by [2,3]^I on the minimal compactification, every finite intersection of which is acyclic for the pushed-forward coefficient; relative toroidal-to-minimal acyclicity is part of the statement (BCGP21, Theorem 6.2.6, pp. 145–146).

A proof route is as follows: identify the cube cover and its intersections, apply relative acyclicity before computing the Čech complex, and use that the cubical Čech complex has length |I|; the number of charts alone does not bound the amplitude.

*Needs:* §6.1; gap:hilbert-siegel-minimal-acyclicity; ShimuraCompactifications §C5.16.

**Checks.**

- For |I|=1 the cube has two charts and the Čech complex has two terms, giving amplitude [0,1].
- For |I|=2 there are four charts but the cubical complex has length two; an ordinary Čech complex of four opens would have length three.
- For I=∅ the mixed locus is the ordinary locus, affine in the minimal compactification, and the amplitude is [0,0].

### 6.3 Compact mixed U action

Prove that U_(v,2) improves the analytic radii at v∈I, that at v∈Iᶜ the composite U_(v,1)U_(v,2) improves them while U_(v,2) alone does not, the relevant kernel types being (p,p²,p³) at Iᶜ and (p,p,p²) at I with raw trace factors p⁻⁶ and p⁻³, and hence that U^I acts compactly on a bounded complex of projective Banach modules and its finite slope blocks are perfect over A (BCGP21, §6.3, Propositions 6.3.4–6.3.14, pp. 147–152).

A proof route is as follows: classify the quotient kernels and the canonical subgroup after the isogeny, track the radius gain and the normalization, and apply the finite slope perfect-complex theorem to the completely continuous chain map.

*Needs:* §6.2; §4.3; HigherHidaAndColemanTheory §6.3; LocallyAnalyticDistributions §4.16; gap:hilbert-siegel-partial-igusa.

**Checks.**

- At an Iwahori place the compactness argument uses U_(v,1)U_(v,2); U_(v,2) alone preserves the radius in the direction of the second step and is not compact.
- The individual U_(v,1) and U_(v,2) act compactly on the part of bounded U^I-slope, not on the whole complex, so slopes of the individual operators are defined only there.
- The raw trace factors p⁻⁶ and p⁻³ multiply to p⁻⁹ for a product of one Iᶜ factor and one I factor.

### 6.4 Relative BGG comparison

On germs of analytic radii use the product over v of the relative GL₂ BGG sequences of HigherHidaAndColemanTheory §9.6. Prove that the reflection θ_v at v has order k_v−l_v+1 and satisfies θ_v∘U_source=p^(k_v−l_v+1)U_target∘θ_v; that the lower cohomological slope is −3, sharpened to 0 in H⁰; and hence that the algebraic-to-analytic map is an isomorphism on H⁰ and injective on H¹ on the ordinary part, with H¹ an isomorphism when every gap k_v−l_v is at least 3. Higher-degree comparisons keep the degree-dependent gap bounds of the product BGG spectral sequence (BCGP21, §6.4, pp. 153–154).

The direction of the conjugation is fixed by differentiating f(pz) k_v−l_v+1 times, which produces the factor p^(k_v−l_v+1) on the target side; the printed relation in BCGP21 §6.4 is reversed.

A proof route is as follows: use germ-level exactness and the multi-index filtration, verify the derivative scaling on a local coordinate, apply the lower slope bound to each reflected term and run the spectral sequence.

*Needs:* §6.1; HigherHidaAndColemanTheory §6.6; HigherHidaAndColemanTheory §9.6.

**Checks.**

- At gap k_v−l_v=3 a reflected term has U-slopes at least −3+4=1, so it contributes nothing to the ordinary part; at gap 2 the bound is −3+3=0 and slope 0 is not excluded.
- For f(z)=z^m, the (k−l+1)-st derivative of f(pz) is p^(k−l+1) times that of f evaluated at pz, which fixes the side of the factor.
- In H⁰ the lower bound 0 gives exclusion for every positive gap: at gap 1 the reflected H⁰ term has slopes at least 2.

### 6.5 Multi-place small-slope continuation

On a joint finite nonzero slope block, prove that restriction of classical coherent cohomology to H† is a quasi-isomorphism when v_p(U_(v,2))<k_v+l_v−3 for v∈I and v_p(U_(v,1))<l_v−3 for v∈Iᶜ, the slopes taken on the bounded-U^I-slope part where the individual operators act compactly (BCGP21, Theorem 6.5.8 and Remark 6.5.9, p. 156; Lemmas 6.5.12–6.5.28, pp. 157–164).

A proof route is as follows: the degree of the untruncated finite flat subgroups increases along the correspondences, with equality only at integral walls (truncated Hasse coordinates lose information for kernels of order p²); on closed degree bands quasi-compactness gives uniform progress; on each finite block the polynomial Q(X)=−(P(X)−P(0))/(X·P(0)), for P annihilating the block with P(0)≠0, inverts U, and compatible torsion sections are built at cofinal precision; a continuous bounded block projection completes the argument, one place at a time, preserving the other degree coordinates and eigenrelations. The Klingen one-place case is HigherHidaAndColemanTheory §9.7.

*Needs:* §6.3; §6.4; HigherHidaAndColemanTheory §9.7; HodgeTateAndCanonicalSubgroups §0.8; LocallyAnalyticDistributions §4.16.

**Checks.**

- For P=X²+2X+1 and U=−1, R(X)=−(P(X)−P(0))/P(0)=−X²−2X gives R(−1)=1, and Q=R/X=−X−2 gives U·Q(U)=(−1)(−1)=1; dropping the coefficient 2 gives R(−1)=0.
- The inequalities are strict: at v∈Iᶜ with l_v=4 slope 0 is admitted and slope 1 is not.
- At (k_v,l_v)=(2,2) for v∈I the bound is 1, so ordinary classes are admitted at the Klingen places; at an Iwahori place with l_v=2 the bound −1 admits nothing, which is why §6.7 asks l_v≥4 there.

### 6.6 Ordinary Euler characteristic in families

Prove that the alternating rank of the U^I-ordinary finite perfect block is locally constant on the classical weight region l_v=2 for v∈I and k_v≡l_v≡2 mod p−1, and that after localization at a non-Eisenstein maximal ideal, for |I|≤1, the analytic and formal complexes have equal Euler characteristic (BCGP21, Theorem 6.3.16, pp. 152–153; Proposition 6.6.2 and Remark 6.6.3, pp. 165–167).

Only the alternating rank is locally constant; individual cohomology dimensions can jump.

A proof route is as follows: finite perfect block base change gives a locally constant virtual rank; at a witness weight with every gap large, small-slope continuation (§6.5), the comparison of product and individual unit slopes, and the localized automorphic computation identify both sides with ordinary classical cohomology; return to all weights in the component. Individual unit slopes follow from a unit product once each U_(v,1), U_(v,2) is integral on the ordinary lattice.

*Needs:* §6.3; §6.5; §4.7; §3.5; AutomorphicFormsOnReductiveGroups §6.6; gap:coherent-automorphic-realization; EndoscopicTransferAndUnitaryTraceComparison §11.1; IntegralHeckeAndGaloisDeterminants §3b.1.

**Checks.**

- A perfect two-term complex A→A over a one-dimensional affinoid A given by multiplication by a uniformizing function t has Euler characteristic 0 everywhere, while its fibre at t=0 has H⁰ and H¹ both of dimension one and its other fibres have none.
- If the product of two integral operators is a unit, each is a unit; if one of them is not known to be integral (for instance has eigenvalue p⁻¹), the product being a unit says nothing about the other factor's slope.
- The Euler characteristic of the ordinary part at weight (2,2) equals that at any other weight of the same component, here all weights with k_v≡l_v≡2 mod p−1 and l_v=2 on I.

### 6.7 The one-place ordinary comparison

Assume |I|≤1 and localize at a non-Eisenstein maximal ideal. Prove that the restriction map r: e(U^I)H†_cusp(κ)→M_I⊗^L_(Λ_I,κ)ℂ_p is a quasi-isomorphism for every classical weight κ with l_v=2 on I, and that if moreover l_v≥4 for v∈Iᶜ the canonical map e(U^I)RΓ(X_(K_p(I)K^p),ω^κ(−D))[1/p]→M_I⊗^L_(Λ_I,κ)ℚ_p is a quasi-isomorphism (BCGP21, Proposition 6.6.1 and Theorems 6.6.4–6.6.5, pp. 164–167). The comparison is rational; it is not an integral quasi-isomorphism at every tame level.

The non-Eisenstein localization supplies the Katz–Mazur inequality at noncohomological weights used in the proof (BCGP21, Remark 6.6.3); without it that inequality is not proved there.

A proof route is as follows: r is injective on H⁰ and surjective on H¹ by the two-affine-cover density argument and a continuous ordinary projector. Both sides have amplitude [0,1] and equal Euler characteristic (§6.6). With a=dim coker H⁰(r) and b=dim ker H¹(r), both nonnegative, χ(source)−χ(target)=−a−b, so a=b=0. For the classical statement compose with §6.5 at l_v≥4 and proper GAGA. The two-defect argument does not extend to |I|≥2, where the complexes have more than two terms.

*Needs:* §6.6; §6.2; §6.5; §4.7; AdicSpacesPartIII §R3.7.

**Checks.**

- For r:A→B between finite two-term complexes with H⁰(r) injective and H¹(r) surjective, χ(A)−χ(B)=−dim coker H⁰(r)−dim ker H¹(r); with dim H⁰(A)=1, dim H⁰(B)=2, dim H¹(A)=3, dim H¹(B)=2 the left side is (1−3)−(2−2)=−2 and the right side is −1−1=−2.
- The opposite direction B→A is not supplied; using it would reverse the signs and the argument would give no conclusion.
- At an Iwahori place with l_v=3 the classical statement is not asserted, since §6.5's bound l_v−3=0 admits no slope-zero class.

### Examples

For F real quadratic, I one place and weight ((2,2),(4,4)) the one-place theorem identifies the ordinary cohomology of ω^κ(−D) at mixed level with the derived fibre of M_I after inverting p, in degrees zero and one.

### Dependencies

Layers 3 and 4; HigherHidaAndColemanTheory §§6.2–6.3; HigherHidaAndColemanTheory §6.6; HigherHidaAndColemanTheory §§9.6–9.7; OverconvergentAutomorphicForms §0.4; LocallyAnalyticDistributions §4.16; HodgeTateAndCanonicalSubgroups §0.8; HodgeTateAndCanonicalSubgroups §5.5; gap:hilbert-siegel-partial-igusa; gap:hilbert-siegel-minimal-acyclicity; gap:coherent-automorphic-realization; EndoscopicTransferAndUnitaryTraceComparison §11.1; ShimuraCompactifications §C5.16; AutomorphicFormsOnReductiveGroups §6.6; IntegralHeckeAndGaloisDeterminants §3b.1; AdicSpacesPartIII §R3.7.

## Layer 7: Completed cohomology and higher Eichler–Shimura

Standing hypotheses for Layers 7 and 8. (G,X) is a Shimura datum of Hodge type with G_(ℚ_p) quasi-split; choose B⊂P, a torus T, a coefficient field E containing the reflex and splitting fields, a neat tame level K^p and compatible toroidal compactifications. Completed cohomology is the derived completed tower of CompletedCohomologyPartII §2.2, and its locally analytic vectors are the derived locally ℚ_p-analytic vectors RLA of §F.4, never the locally analytic vectors of individual completed cohomology groups. Higher Coleman complexes HC_(w,λ), the weights κ_w(λ)=−w₀,M w(λ+ρ)−ρ, support orders, finite slope windows and the normalized torus action are those of HigherHidaAndColemanTheory §§1.1, 5.1 and 5.5. Coefficients lie in the BGG category O(𝔤,𝔟)_(λ-alg), whose objects have weights differing from λ by algebraic characters of T.

### 7.1 The coherent completed-cohomology functor

For M in O(𝔤,𝔟)_(λ-alg) define CC_λ(M)=RHom_𝔤(M,RLA(RΓ̃(E))), and the cuspidal variant with the compact-support completed tower. M is the algebraic BGG object; its analytic realization uses the completion M⊗_(U(𝔤))Û(𝔤), its continuous dual and the λ-twist. Prove that CC_λ is a contravariant triangulated functor on the bounded derived category of O(𝔤,𝔟)_(λ-alg), carries the Galois action of the tower and the prime-to-p Hecke action, and has a natural map from the cuspidal to the full variant (BCGP25, Definition 3.4.5 and Proposition 3.4.3, p. 53; §4.7 and Theorem 4.7.1, p. 99). No extension to arbitrary topological coefficient modules is asserted.

A proof route is as follows: apply derived Lie-algebra Hom to the derived locally analytic tower, and transport the Hecke and Galois actions through the functors.

*Needs:* CompletedCohomologyPartII §F.4; CompletedCohomologyPartII §2.2; CompletedCohomologyPartII §6.7; gap:bgg-category-o; gap:analytic-localization; LieHighestWeight Layer 3.

The basic properties of this construction are:

- A map M→N gives CC_λ(N)→CC_λ(M), compatibly with identities and composition.
- The compact-support tower gives the cuspidal variant and its map to the full functor.
- Galois and prime-to-p Hecke actions commute with functorial maps.
- A short exact sequence 0→M₁→M₂→M₃→0 gives a distinguished triangle CC_λ(M₃)→CC_λ(M₂)→CC_λ(M₁)→CC_λ(M₃)[1].

**Checks.**

- For finite-dimensional algebraic M=W∨, CC_λ(M) is the colimit over p-levels of classical cohomology with coefficient W, by CompletedCohomologyPartII §6.7.
- The zero object gives the zero complex.
- The connecting morphism of the triangle is induced by the Yoneda class of the extension; for a split sequence it is zero.

### 7.2 Completed-to-coherent localization

Prove that for M in O(𝔤,𝔟)_(λ-alg) there is a natural equivalence CC_λ(M)⊗_E ℂ_p≃RΓ(VB_red(Loc(M))) with the analytic localization Loc(M) on the flag variety pushed through the solid automorphic vector-bundle functor, with the cuspidal variant from the compact-support tower, and that the arithmetic Sen operator corresponds to the horizontal μ-action on the localized equivariant sheaf (BCGP25, Theorem 4.7.1, p. 99; Theorem 4.5.20, pp. 86–87).

A proof route is as follows: use the canonical completion and continuous-dual localization of the coefficient, invoking non-Liouville hypotheses only where exactness needs them; apply VB_red with its Chevalley–Eilenberg compatibility and identify horizontal μ with arithmetic Sen through the period map.

*Needs:* §7.1; HigherHidaAndColemanTheory §5.1; PerfectoidShimuraVarieties §3.1; PerfectoidShimuraVarieties §3.5; gap:vb-sen-period; gap:analytic-localization.

**Checks.**

- The comparison is functorial in M and preserves Hecke and Galois actions; at M=0 both sides vanish.
- On ℚ_p(1) the arithmetic Sen operator is +1, so the horizontal action on the corresponding twist of the structure sheaf is +1; a sign error would reverse every Sen value of §7.6.
- For finite-dimensional M the localization is the automorphic vector bundle of the dual representation, and the comparison is the Hodge–Tate comparison of PerfectoidShimuraVarieties §3.6.

### 7.3 The higher Eichler–Shimura spectral sequence

For non-Liouville λ and M in O(𝔤,𝔟)_(λ-alg), prove that there is a finite spectral sequence E₁^(p,q)=⊕_(ℓ(w)=p) H^(p+q)(HC_(w,λ)(E⊗^L_(𝔲_(P_w))M)) ⇒ H^(p+q)(CC_λ(M)⊗ℂ_p), indexed by Kostant representatives w, on whose terms the horizontal wμ-action gives the arithmetic Sen action (BCGP25, Theorem 4.7.2, pp. 99–100). The Lie-algebra homology of the coefficient is derived, and its higher terms are kept.

A proof route is as follows: filter the localized sheaf by Bruhat supports, identify each graded piece with the higher Coleman coefficient functor, and apply derived global sections and §7.2.

*Needs:* §7.2; HigherHidaAndColemanTheory §5.5; HigherHidaAndColemanTheory §3.6; ShimuraData §3.10; gap:bgg-category-o.

**Checks.**

- For the modular curve (d=1) the spectral sequence has two columns, w=1 and the long element, and is the Bruhat Cousin sequence of HigherHidaAndColemanTheory §9.2 after localization.
- The abutment is indexed by total degree p+q: a class from w of length p in coherent degree p+q contributes to total degree p+q, not to q.
- Replacing E⊗^L_(𝔲_P)M by its degree-zero part loses the higher Kostant terms: for the trivial coefficient of SL₂ the 𝔲-homology has two nonzero degrees.

### 7.4 Ordinary Eichler–Shimura degrees

For non-Liouville λ and the Verma coefficient M(𝔤)_λ, prove that if the Shimura variety is proper or Siegel, the finite-slope completed functor and its cuspidal variant have nonnegative normalized slopes; that on the ordinary part there is a spectral sequence E₁^(p,q)=⊕_(ℓ(w)=p) H^(2p+q−d)(HC^ord_(w,λ)(M(𝔪_w)_(λ+w⁻¹w₀,Mρ+ρ))) ⇒ H^(p+q)(CC_λ(M(𝔤)_λ)^ord⊗ℂ_p), with its cuspidal analogue; that for proper varieties the ordinary abutment is concentrated in degree d; and separately that for proper varieties and antidominant λ the unspecialized spectral sequence gives middle-degree concentration and its higher Coleman filtration (BCGP25, Corollary 4.7.3, Theorem 4.7.5 and Corollary 4.7.6, p. 100).

A proof route is as follows: specialize §7.3 to the Verma module, whose derived 𝔲-homology is computed by the Verma comparison; insert the Bruhat and duality shift; for proper varieties use the support-dependent amplitude bounds to force one total degree.

*Needs:* §7.3; HigherHidaAndColemanTheory §5.6; HigherHidaAndColemanTheory §8.5; gap:bgg-category-o.

**Checks.**

- For d=3 the ordinary E₁ term in column p and row q sits in coherent degree 2p+q−3; the term with p=3, q=0 sits in coherent degree 3.
- Middle-degree concentration is asserted only for proper varieties; the Siegel threefold is not proper and needs §7.5 after localization.
- The ordinary statement needs no antidominance; the unspecialized statement does.

### 7.5 Genus-two non-Eisenstein boundary vanishing

For the ordinary genus-two completed tower, prove that the map from compact-support to full coherent completed cohomology becomes an isomorphism after localization at a prime-to-p maximal ideal whose residual four-dimensional representation is absolutely irreducible (BCGP25, Theorem 4.9.4, Corollary 4.9.5 and Lemma 4.9.6, pp. 104–105).

A proof route is as follows: use the derived completed support triangle; the Igusa boundary normalizes into ordinary GL₂ boundary towers whose Hecke polynomials are reducible, so the boundary term vanishes at an absolutely irreducible ideal.

*Needs:* §7.1; CompletedCohomologyPartII §7.1; gap:igusa-boundary-eisenstein; IntegralHeckeAndGaloisDeterminants §3b.1.

**Checks.**

- If every boundary Hecke polynomial factors as a product of two polynomials of degree two coming from the Levi, then by Chebotarev and Brauer–Nesbitt a residual representation with these characteristic polynomials has a reducible semisimplification; an absolutely irreducible ρ̄ cannot occur, so the localization kills the boundary.
- Without localization the boundary term is nonzero: the ordinary Siegel Eisenstein series give classes in it.
- The statement concerns the full completed comparison, not only the ordinary boundary H⁰.

### 7.6 The genus-two four-piece filtration

Specialize to GSp₄/ℚ with ρ=(−1,−2;0), d=3 and the four Kostant representatives i_w of lengths i=0,1,2,3. Let λ=(λ₁,λ₂;w) be non-Liouville, with λ₁+λ₂≡w mod 2 when λ is integral, and localize at a prime-to-p maximal ideal with absolutely irreducible residual representation ρ̄. Prove that V=RHom_𝔟(λ,RLA(RΓ̃))^ord_ρ̄=CC_λ(M(𝔤)_λ)^ord_ρ̄ is concentrated in degree 3, and that V⊗ℂ_p has a filtration Fil^i, i=0,…,3, equivariant for G_(ℚ_p), the Hecke algebra and T(ℚ_p), with Gr^i the degree-i ordinary higher Coleman cohomology of weight −w₀,M(i_w·λ+2ρ_M) twisted by ℂ_p(−i_w⁻¹w₀,Mρ−ρ), on which the Sen operator acts by the scalars (−λ₁−λ₂−w)/2, (−2+λ₁−λ₂−w)/2, (−4+λ₂−λ₁−w)/2, (−6+λ₁+λ₂−w)/2 for i=3,2,1,0 (BCGP25, Theorem 4.9.9, pp. 105–106).

A proof route is as follows: apply §7.4 and §7.5, use the sharp genus-two supported amplitudes to force total degree 3, and compute the twists from the root datum with ℚ_p(1) of Sen weight +1.

*Needs:* §7.4; §7.5; HigherHidaAndColemanTheory §9.1; HigherHidaAndColemanTheory §8.5; ShimuraData §5.5.

**Checks.**

- At λ=(1,1;2) the four Sen values for i=3,2,1,0 are −2,−2,−3,−3.
- At λ=(1,1;−2) they are 0,0,−1,−1; reversing the sign of w changes the values, which detects the central twist.
- At λ=(3,1;0) they are −2,0,−3,−1, pairwise distinct: away from the singular parameters no two graded pieces share a Sen value, and no repeated block occurs.

### Examples

At the singular parameter λ=(1,1;w), w even, two Sen values coincide in degrees 3 and 2 (value −1−w/2) and two in degrees 1 and 0 (value −2−w/2); Layer 8 studies the resulting repeated blocks.

### Dependencies

CompletedCohomologyPartII §F.4; CompletedCohomologyPartII §2.2; CompletedCohomologyPartII §6.7; CompletedCohomologyPartII §7.1; gap:bgg-category-o; gap:analytic-localization; gap:vb-sen-period; gap:igusa-boundary-eisenstein; LieHighestWeight Layer 3; PerfectoidShimuraVarieties §§3.1, 3.5; HigherHidaAndColemanTheory §§1.1, 3.6, 5.1, 5.5, 5.6, 8.5, 9.1; ShimuraData §3.10; ShimuraData §5.5; IntegralHeckeAndGaloisDeterminants §3b.1.

## Layer 8: The singular Sen operator and classicality

The standing hypotheses of Layer 7 apply, specialized to GSp₄/ℚ with ρ=(−1,−2;0), d=3, the four Kostant representatives i_w of lengths i=0,1,2,3, and the singular parameter λ=(1,1;w) with w even, localized at a prime-to-p maximal ideal with absolutely irreducible residual four-dimensional Galois representation. The Sen operator Θ is normalized as in Conventions. Multiplicity statements concern finite-dimensional eigenspaces after that localization. V is the degree-3 module of §7.6.

### 8.1 The singular two-term Cousin complex

Prove that the ordinary part of RΓ(Sh^tor,ω^(1,1;−w)) is the compactly supported cohomology of the union of the two Bruhat strata of lengths 3 and 2, and that it is computed by the complex in degrees 2 and 3 given by the supported groups H²_(2_w)(ω^(†,(1,1;−w))) → H³_(3_w)(ω^(†,(1,1;−w))), whose differential is the Cousin map induced by the class of the extension of the two strata, and whose identification with the graded pieces of §7.6 carries the twist ℂ_p(2,0;0) in degree two and the common B-twist ℂ_p(1,1;w); the other Bruhat pieces are excluded by their ordinary slopes (BCGP25, §4.10, Proposition 4.10.3 and Proposition 4.10.6, pp. 106–108).

A proof route is as follows: use the supported Cousin filtration and the sharp genus-two bounds; identify the differential as the boundary map of the two-stratum triangle; check the weight-transport twists rather than identifying both terms as untwisted modules.

*Needs:* §7.6; HigherHidaAndColemanTheory §5.5; HigherHidaAndColemanTheory §5.8.

**Checks.**

- The two terms sit in degrees 2 and 3, of lengths 2 and 3; a two-term complex in degrees 0 and 1 would describe the other repeated block.
- The degree-two coefficient keeps ℂ_p(2,0;0): its Sen weight differs from the degree-three coefficient's, and only after the twist do both carry the Sen value −1−w/2.
- If the Cousin map is zero, H² of the ordinary classical complex is the whole supported H²_(2_w); if it is injective, H² vanishes.

### 8.2 The repeated Sen block

Put a=−1−w/2. Prove that the generalized eigenspace V_a of Θ on V⊗ℂ_p is killed by (Θ−a)² and sits in an exact sequence 0→Gr³V→V_a→Gr²V→0, so that Θ−a, which vanishes on both ends, induces a map N_a:Gr²V→Gr³V; and that the other generalized eigenspace has eigenvalue −2−w/2 and is an extension of Gr⁰V by Gr¹V. The four coherent weights in descending degree are (1,1),(1,1),(2,2),(2,2) (BCGP25, §4.10.8, pp. 107–108; Remark 4.10.7, whose degree-zero weight is read as (2,2;−w)).

A proof route is as follows: compute the four Sen values at the singular parameter from §7.6, split V⊗ℂ_p by the coprime factors (X−a)² and (X−a+1)², and factor Θ−a through quotient-to-subobject.

*Needs:* §7.6; `Module.End.genEigenspace`.

The basic properties of this construction are:

- V_a is the generalized a-eigenspace of Θ with its two-step filtration.
- (Θ−a)²=0 on V_a.
- N_a is the unique map Gr²V→Gr³V inducing Θ−a on V_a.
- Hecke-compatible Galois maps preserve V_a and N_a.

**Checks.**

- At w=2 the four Sen values are −2,−2,−3,−3, and a=−2; with w replaced by −w they are 0,0,−1,−1.
- If Θ acts semisimply on V_a then N_a=0.
- The 2×2 Jordan block with diagonal a has N_a≠0 although its graded pieces carry the same scalar a; scalar Sen values on the graded pieces do not determine N_a.

### 8.3 The rank-one singular localization comparison

On the union of the two adjacent Bruhat strata for the Klingen root β, prove that the extension obtained by derived invariants of the horizontal μ−μ₀ agrees with the higher Coleman extension up to the B-character λ−η and a nonzero scalar, where η=(0,−1;1) and μ₀=−1−w/2, including nonvanishing of the gluing comparison on both strata and on their overlap (BCGP25, Theorem 3.6.9 and Proposition 3.6.15, pp. 62–67).

At the closed orbit the operator x∂_x+1 is injective on power-series germs in characteristic zero. On the overlap the operator (x+1)∂_x+1 kills the analytic germ 1/(1+x), so injectivity on ambient analytic germs is false, and the nonvanishing at the overlap is proved on the actual constrained fibre (or by a different nonzero intertwiner), not on ambient germs; BCGP25 Proposition 3.6.15 is completed in this way. Once nonvanishing holds, the scalar-endomorphism property identifies the gluing up to E×.

A proof route is as follows: use the localization triangle for the completed Verma coefficient and the two-step Chevalley–Eilenberg complex for EX_β⊕EH_β, identify the constrained fibre at the overlap, and prove that the kernel germ does not lie in it.

*Needs:* §7.2; §8.2; gap:analytic-localization.

**Checks.**

- (x+1)∂_x applied to 1/(1+x) gives −1/(1+x), so ((x+1)∂_x+1)(1/(1+x))=0.
- x∂_x+1 sends Σa_n xⁿ to Σ(n+1)a_n xⁿ, which is injective on power series over a field of characteristic zero; in characteristic p it kills x^(p−1).
- The comparison is asserted up to a nonzero scalar; a comparison up to an arbitrary scalar, possibly zero, would not determine the extension class.

### 8.4 The Sen–Cousin comparison

Prove that under the identification of the graded pieces of §8.2 with the terms of §8.1, N_a and the Cousin differential agree up to a nonzero scalar (BCGP25, Theorem 4.10.12, pp. 108–109). This compares extension classes; equality of the scalar Sen values on the graded pieces does not imply it.

A proof route is as follows: represent the repeated block by the cone of Θ−a, compare its two exact triangles using §8.3 and the vector-bundle functor, and transport to ordinary global cohomology and the supported Cousin boundary map, keeping the B-twists.

*Needs:* §8.3; §8.1; §8.2; gap:vb-sen-period; PadicHodgeTheory §4.4.

**Checks.**

- The scalar ambiguity does not affect kernel, image or vanishing: N_a=0 exactly when the Cousin map is zero.
- A nontrivial Jordan block and the semisimple block with the same graded scalars give N_a≠0 and N_a=0 respectively, and the theorem distinguishes them through the Cousin map.
- At w=2 both graded pieces of V_a carry Sen value −2, so a comparison of scalar characters alone holds trivially and proves nothing.

### 8.5 Balanced eigenpackets

Let f be an ordinary overconvergent eigenform of weight (2,2;−w) whose Galois representation ρ_f is irreducible, and assume that the Zariski closure of ρ_f(G_ℚ) contains Sp₄, or contains SL₂×SL₂ with ρ_f becoming reducible on an index-two subgroup. Let 𝔪_f be its maximal ideal. Prove that V[𝔪_f]≅ρ_f⊗W with n=dim W>0, so dim V[𝔪_f]=4n. Assume in addition that dim_(ℂ_p)(Gr^iV_(ℂ_p))[𝔪_f]=n for i=0,1,2,3. Prove that under this balance the two-step sequence of §8.2 stays exact after passing to 𝔪_f-torsion (BCGP25, Propositions 4.11.1–4.11.2, pp. 109–112; Lemma 4.12.3 and Theorem 4.12.4(3), p. 113; Remark 4.12.5, p. 114).

The balance is a hypothesis: the image alternatives give the total dimension 4n and not the four graded dimensions. Multiplicity one for each graded eigenspace implies the balance with n=1, since the total is a positive multiple of four.

A proof route is as follows: the Eichler–Shimura relation and the multiplicity theorem identify V[𝔪_f]≅ρ_f⊗W; the filtration of V[𝔪_f] injects on each graded piece into (Gr^iV_(ℂ_p))[𝔪_f]; equality of the sum of these upper bounds with 4n forces equality at every step and exactness on the repeated block.

*Needs:* §7.6; §8.2; gap:completed-eichler-shimura; AutomorphicGaloisRepresentationsPartII §AG2.P.

**Checks.**

- If the graded dimensions are (1,1,1,1) and dim V[𝔪_f]=4, every injection Gr^i(V[𝔪_f])→(Gr^iV)[𝔪_f] is an isomorphism.
- If the graded dimensions were (2,1,1,0) with total 4, the image alternatives would still give dim V[𝔪_f]=4, but the sequence on the repeated block could fail to be exact after taking 𝔪_f-torsion; the balance excludes this.
- Taking 𝔪-torsion is left exact and not exact: for the sequence 0→A/𝔪→A/𝔪²→A/𝔪→0 over a discrete valuation ring A, the 𝔪-torsion gives 0→A/𝔪→𝔪/𝔪²→A/𝔪, whose last map is zero.

### 8.6 De Rham ordinary classicality at the singular weight

In the setting of §8.5, assume the balance and that ρ_f restricted to G_(ℚ_p) is de Rham. Prove that f is classical (BCGP25, Theorem 4.12.4, pp. 113–114).

A proof route is as follows: Θ on V[𝔪_f]=ρ_f⊗W is the Sen operator of ρ_f, which is semisimple since ρ_f is de Rham, hence Hodge–Tate; so N_a vanishes on the 𝔪_f-part, and by §8.4 the Cousin map vanishes there. The kernel of the Cousin map is the classical H², so the classical degree-two eigenspace has dimension n; by the stable-packet multiplicity this gives dim H⁰(Sh^tor,ω^(2,2;−w))[𝔪_f]=n, so the classical degree-zero eigenspace equals the ordinary overconvergent one, which contains f. Semisimplicity is applied to the finite-dimensional eigenspace, not to the whole completed space.

*Needs:* §8.4; §8.5; PadicHodgeTheory §3.3; PadicHodgeTheory §4.4; EndoscopicTransferAndUnitaryTraceComparison §11.1; gap:coherent-automorphic-realization.

**Checks.**

- A Hodge–Tate representation has semisimple Sen operator with integral eigenvalues; ℚ_p(1)⊕ℚ_p has Sen eigenvalues +1 and 0 and N=0.
- A two-dimensional representation with Sen operator a nontrivial Jordan block is not Hodge–Tate, hence not de Rham; for it the argument would give no vanishing.
- Without the balance the exactness of §8.5 fails and the vanishing of N_a on V[𝔪_f] does not give vanishing of the Cousin map on the 𝔪_f-parts of the graded pieces.

### Examples

At w=2 the repeated block V_(−2) is an extension of Gr²V by Gr³V, and classicality of a de Rham ordinary eigenform of weight (2,2;−2) with balanced multiplicities follows from the vanishing of N_(−2) on its eigenspace.

### Dependencies

Layer 7; gap:analytic-localization; gap:vb-sen-period; gap:completed-eichler-shimura; EndoscopicTransferAndUnitaryTraceComparison §11.1; gap:coherent-automorphic-realization; HigherHidaAndColemanTheory §§5.5, 5.8; PadicHodgeTheory §§3.3, 4.4; AutomorphicGaloisRepresentationsPartII §AG2.P; `Module.End.genEigenspace`.

## Layer 9: Four integral projective Hida modules

Standing hypotheses for Layer 9. G=GSp₄/ℚ with the integral Siegel datum of HigherHidaAndColemanTheory, p any prime, O a finite flat discrete valuation ring over ℤ_p with fraction field E, Λ=O[[T(ℤ_p)]] the full completed group ring including its finite part, neat tame level K^p, and the four Kostant representatives w of lengths ℓ(w)=0,1,2,3. The genus-two integral amplitudes of HigherHidaAndColemanTheory §4.9 are used; no integral sharp amplitude in genus at least three is asserted. Let ι be the involution of Λ induced by t↦t⁻¹ on T(ℤ_p): the complexes of HigherHidaAndColemanTheory §4.5 specialize at −λ, and after base change along ι they specialize at +λ. Every comparison keeps the torus twist E(−λ) and transposes the torus action in duality.

### 9.1 The four modules

Let M_w^ε be the perfect Iwasawa complex of HigherHidaAndColemanTheory §4.5 with boundary parameter ε (ε=1 cuspidal, ε=0 canonical), and M_w^(ε,ι) its base change along ι. Define 𝓜_w=H^(ℓ(w))(M_w^(1,ι)) for ℓ(w)=0,1 and 𝓜_w=H^(ℓ(w))(M_w^(0,ι)) for ℓ(w)=2,3, with its Λ-module structure and its Hecke action (BCGP25, §7.3, pp. 163–164). The definition precedes the proof that the complex is concentrated in that degree; neither flatness nor projectivity is part of it.

A proof route is as follows: transport the existing universal complexes rather than construct a second family; choose the support by length and take the specified cohomology module.

*Needs:* HigherHidaAndColemanTheory §4.5; HigherHidaAndColemanTheory §4.6; HigherHidaAndColemanTheory §4.9; PadicMeasuresIwasawaAlgebras §1.7; PadicMeasuresIwasawaAlgebras §6.1.

The basic properties of this construction are:

- 𝓜_w is the cohomology in degree ℓ(w) of the transported supported complex.
- The support is cuspidal for lengths 0 and 1 and canonical for lengths 2 and 3.
- Evaluation at +λ after ι equals evaluation at −λ before ι.
- The Λ-linear Hecke action is independent of choices under the comparison maps of the supplier.

**Checks.**

- The length-zero module is H⁰ of the cuspidal complex, and the length-three module is H³ of the canonical complex.
- For a character χ of T(ℤ_p) of order 3, evaluation at χ and at χ⁻¹ differ, so omitting ι changes every specialization by χ↦χ⁻¹; for a quadratic character the two agree and the omission is invisible.
- At ℓ(w)=1 the cuspidal complex has amplitude [0,1] by HigherHidaAndColemanTheory §4.9, so H¹ alone is not yet the whole complex; §9.2 supplies the vanishing of H⁰.

### 9.2 Concentration and projectivity

Prove that for each of the four w the transported supported complex is quasi-isomorphic to 𝓜_w[−ℓ(w)] and that 𝓜_w is a finite projective Λ-module, for every prime p including p=2, without splitting the finite part of T(ℤ_p) by averaging (BCGP25, Theorem 7.3.1(1) and its proof, pp. 164–165).

The genus-two amplitudes alone do not suffice: the length-one cuspidal complex has amplitude [0,1] and the length-two canonical complex amplitude [2,3]. The extra input is that H⁰ with the length-one support condition vanishes, and Serre duality gives the complementary length-two concentration.

A proof route is as follows: prove the vanishing of H⁰ with length-one support, apply the duality of HigherHidaAndColemanTheory §4.8, and conclude by residual detection of amplitude on every residue fibre, including the finite-torus cofinal system: a perfect complex over a local ring concentrated in one degree after reduction to the residue field has finite free cohomology in that degree.

*Needs:* §9.1; HigherHidaAndColemanTheory §4.8; HigherHidaAndColemanTheory §4.9; DeformationAndDerivedPatchingAlgebra §7.3; DeformationAndDerivedPatchingAlgebra §9.2.

**Checks.**

- Lengths 0 and 3 are concentrated already by the amplitudes [0,0] and [3,3] of HigherHidaAndColemanTheory §4.9; lengths 1 and 2 need the vanishing and duality.
- At p=2 the finite part of T(ℤ₂) is (ℤ/2)², whose group ring over O is local, not a product of copies of O; averaging over it would divide by 4.
- A perfect complex [Λ→Λ] given by multiplication by a non-unit nonzerodivisor has amplitude [0,1] and torsion H¹, so concentration in degree one with projective cohomology is a genuine statement.

### 9.3 Classical specialization in the four chambers

For an algebraic G-dominant λ and κ=−w₀,M w(λ+ρ)−ρ, prove that there are Hecke-equivariant isomorphisms 𝓜_w⊗_(Λ,λ)E(−λ)≅H^(ℓ(w))(Sh^tor_(Iw(p)K^p),ω^κ(−D))^ord for ℓ(w)=0,1 and ≅H^(ℓ(w))(Sh^tor_(Iw(p)K^p),ω^κ)^ord for ℓ(w)=2,3, that all other cohomology of the derived fibre vanishes, and that these are isomorphisms of normalized Hecke and torus modules (BCGP25, Theorem 7.3.1(2) and Remark 7.3.3, pp. 164–166).

A proof route is as follows: apply derived control after transport along ι, the regular-chamber classicality of HigherHidaAndColemanTheory §3.7, and §9.2 to replace the derived tensor product by the ordinary one, inserting E(−λ).

*Needs:* §9.2; HigherHidaAndColemanTheory §3.7; HigherHidaAndColemanTheory §4.6; HigherHidaAndColemanTheory §9.1.

**Checks.**

- For ν=(0,−2;0) the four weights κ_w are (5,3), (5,1), (2,−2), (0,−2) in lengths 0,1,2,3, and the length-zero specialization is ordinary cuspidal H⁰ of weight (5,3).
- With χ of order 3 as in §9.1, the specialization at λ+χ and at λ−χ differ; the transport and the twist E(−λ) select the stated classical weight.
- Higher Tor terms vanish because 𝓜_w is projective; for a nonprojective module the derived fibre could have cohomology outside degree ℓ(w).

### 9.4 Coleman specialization

For algebraic λ with κ=−w₀,M w(λ+ρ)−ρ M-dominant but not necessarily G-dominant, prove that 𝓜_w⊗_(Λ,λ)E(−λ) is the degree-ℓ(w) ordinary higher Coleman cohomology H^(ℓ(w))_w(Sh^tor_(K^p),ω^(κ,sm)(−D))^(ord,T(ℤ_p)) for ℓ(w)=0,1 and its canonical variant for ℓ(w)=2,3 (BCGP25, Theorem 7.3.1(3) and Remark 7.3.3, pp. 164–166). No global classical identification is asserted at such weights.

A proof route is as follows: use the ordinary/overconvergent family comparison, identify the normalized positive torus operators, and keep the torus invariants and support before taking the concentrated degree.

*Needs:* §9.2; HigherHidaAndColemanTheory §8.3; HigherHidaAndColemanTheory §5.5.

**Checks.**

- A weight that is M-dominant but not G-dominant gives a higher Coleman fibre and no classical one.
- At a G-dominant weight in the chamber of w the Coleman and classical specializations agree, by HigherHidaAndColemanTheory §5.10.
- The torus invariants T(ℤ_p) are part of the target; without them the target is the cohomology at full Iwahori level with all finite characters.

### 9.5 Integral duality

For w*=w₀,M w w₀ prove that there is a perfect Λ-bilinear pairing 𝓜_w×𝓜_(w*)→Λ, after the torus-involution transport, matching the Serre coefficient twist and the adjoint normalized Hecke action and interpolating classical Serre duality. The shift [−3] of the complex duality becomes the equality of complementary degrees ℓ(w)+ℓ(w*)=3; it is not an additional shift on the modules (BCGP25, Theorem 7.3.1(4), p. 164; BP26, Theorems 5.5.1–5.5.2).

A proof route is as follows: start from the integral family duality of HigherHidaAndColemanTheory §4.8 with its transpose t↦w₀t⁻¹, transport both coefficient actions through ι and the Serre weight identification, and take the complementary-degree pairing using §9.2.

*Needs:* §9.2; HigherHidaAndColemanTheory §4.8.

**Checks.**

- Lengths 0 and 3 pair, and lengths 1 and 2 pair.
- For finite projective modules P and Q over Λ, a pairing P×Q→Λ is perfect iff the induced map P→Hom_Λ(Q,Λ) is an isomorphism; for P=Q=Λ the multiplication pairing is perfect and the pairing (x,y)↦pxy is not.
- No extra complex shift is attached to either module: a shift would place the pairing in degree ±3 and it would not be a pairing of modules.

### 9.6 Tame group-ring projectivity

For normal neat tame levels K₁^p⊂K₂^p with finite quotient Δ, prove that 𝓜_(w,K₁) is finite projective over Λ[Δ], that pullback identifies 𝓜_(w,K₂) with the Δ-invariants and trace identifies the Δ-coinvariants with 𝓜_(w,K₂), also when p divides |Δ| (BCGP25, Theorem 7.3.1(5) and Lemma 7.3.2, pp. 164–165).

A proof route is as follows: the tame-level map is a torsor in the interior, and on toroidal charts the boundary stabilizers are of order prime to p; prove that the derived coinvariants for a Sylow p-subgroup are concentrated in degree zero, also after residue-field reduction, and apply the Sylow projectivity criterion; identify trace and pullback. Division by |Δ| is not used.

*Needs:* §9.2; DeformationAndDerivedPatchingAlgebra §5.9; gap:tame-boundary-stabilizers; ShimuraCompactifications §C3.2.

**Checks.**

- For Δ=ℤ/p acting on O[Δ] itself, the module is free of rank one, its invariants are the line of norms and its coinvariants are O; the norm map from coinvariants to invariants is an isomorphism, while multiplication by |Δ|=p on O is not invertible.
- For Δ of order prime to p projectivity over Λ[Δ] follows by averaging; the theorem is needed for p | |Δ|.
- The trivial module O over O[ℤ/p] has nonzero higher group homology, so it is not projective; the derived-coinvariant test detects this.

### 9.7 Fixed central character

Base change the full-torus modules along the two-variable Galois-weight map Λ→Λ_(GSp₄,ℚ) of BCGP25 Lemmas 7.3.5–7.3.6, defined by the root-datum and central-character identity (the half-ρ notation is read through that integral identity, not as half-powers of characters). Fixing the central action |·|² gives finite projective modules over the two-variable algebra tensored with the group ring of the tame quotient, at the neat auxiliary level Iw₁(r) of Lemma 7.3.8, with r>5 prime, r≠p, and r≢1 mod p if p is odd, r≢1 mod 4 if p=2. The central invariants factor through 𝔽_r×/{±1}, of order prime to p, and are a direct summand (BCGP25, Lemmas 7.3.5–7.3.8 and Remark 7.3.7, pp. 166–167).

The condition on r is read by cases: at p=2 the condition r≢1 mod p would exclude every odd prime, and the operative condition is r≡3 mod 4.

A proof route is as follows: define the torus-ring map from the universal diagonal Galois character and its multiplier relation, base change the finite projective tame module of §9.6, use Iw₁(r) to keep neatness when enlarging the tame centre, and take the prime-to-p quotient invariants as a direct summand.

*Needs:* §9.6; §9.5; PadicMeasuresIwasawaAlgebras §1.6; PadicMeasuresIwasawaAlgebras §6.1.

**Checks.**

- At p=2, r=7 satisfies r≡3 mod 4 and 𝔽₇×/{±1} has order 3, prime to 2; r=13 has 13≡1 mod 4 and 𝔽₁₃×/{±1} has order 6, divisible by 2.
- At p=3, r=7 is excluded since 7≡1 mod 3, and 𝔽₇×/{±1} has order 3; r=11 is allowed and 𝔽₁₁×/{±1} has order 5.
- At p=5, r=11 is excluded (11≡1 mod 5, order 5) and r=13 is allowed (order 6).

### Examples

At p=2 and ν=(0,−2;0), the four modules 𝓜_w are finite projective over O[[T(ℤ₂)]] (including its finite part (ℤ/2)²), specialize at the four weights (5,3), (5,1), (2,−2), (0,−2) to ordinary cohomology in degrees 0,1,2,3, and pair as 𝓜₀×𝓜₃→Λ and 𝓜₁×𝓜₂→Λ.

### Dependencies

HigherHidaAndColemanTheory §§3.7, 4.5–4.9, 5.5, 5.10, 8.3, 9.1; PadicMeasuresIwasawaAlgebras §§1.6, 1.7, 6.1; DeformationAndDerivedPatchingAlgebra §§5.9, 7.3, 9.2; gap:tame-boundary-stabilizers; ShimuraCompactifications §C3.2.

## Downstream consumers

The singular-weight modularity lifting theorem of BCGP25 §7.5, on which AbelianSurfacesModularity rests, consumes the four projective modules and their central-character versions (§§9.2–9.7) and the singular classicality theorem (§8.6). The potential modularity of abelian surfaces over totally real fields (BCGP21 §§7–10) consumes the derived control of §4.7, the doubling injection and unit-root refinements of §§5.8–5.9 and the one-place comparison of §6.7. Classicality on PEL Shimura varieties (§2.8) is the input that turns overconvergent eigenforms of small slope in eigenvarieties of unitary and symplectic type into classical forms.

## Worked examples

- **The PEL normalization and the slope region.** For the modular curve, n=1 and the region is s<k−1; for the Siegel threefold, n=3 and the region is s<k₂−3. With c=4, s=0 and n=3, any ε<1/4 makes n+s−(1−ε)c negative; with c=3 no ε does.
- **The Klingen thresholds.** At Ω(k,2) the extension threshold of HigherHidaAndColemanTheory §9.7 is k+1 and the all-degree BGG threshold of §9.6 is k−2; at k=0 these are 1 and −2, which is why degree-zero control does not give all-degree control and why §3.5 compares Euler characteristics.
- **Doubling.** The companion operator with T=5, U=6 sends (2,3) to (28,−2) and has characteristic polynomial X²−5X+6 with roots 2 and 3; replacing −x by x gives X²−5X−6. The doubling injection compares global sections with sections on the w-ordinary locus and is not a formal 2×2 statement.
- **The two-defect Euler argument.** For an H⁰-injective, H¹-surjective map of two-term complexes, χ(source)−χ(target)=−a−b with a,b≥0, so equal Euler characteristics force a quasi-isomorphism; a four-term complex has more defects and the argument does not apply for |I|≥2.
- **The repeated Sen block.** At w=2 the Sen values in degrees 3,2,1,0 are −2,−2,−3,−3. A Jordan block has the same graded values as a semisimple block, so the Sen–Cousin theorem compares extension classes. The germ 1/(1+x) is killed by (x+1)∂_x+1, so the overlap comparison of §8.3 is proved on the constrained fibre.
- **The four modules.** Lengths 0 and 3, and 1 and 2, pair; the shift [−3] becomes complementary degrees. A character of order 3 distinguishes evaluation at χ and χ⁻¹ and detects a missing involution ι. At p=2 neither the finite torus nor a tame deck group of even order is handled by averaging.

## Source corrections

The following points of the sources are corrected or completed in the statements above; each is described in this roadmap's own words.

- BPS Lemma 4.4.3: the map from ordered k-tuples of complements to the k-fold product is not finite étale in positive dimension; quasi-compactness is obtained coordinate by coordinate (§2.3).
- BPS Lemma 4.4.5: the bound for the bad operator uses c_i≥0; the theorem here is stated on the region s_i≥0, s_i+n_i<c_i, which forces c_i>0 (§2.1).
- BPS §§4.5–5.1: half-open degree strips are exhausted by closed rational boxes rather than treated as quasi-compact (§2.7).
- Pilloni §15.2.2 and §15.2.4: the large-weight witness uses the parameter λ₁=−k−1<0; and the proof of Theorem 15.2.1 needs a witness in every finite-character component of Λ₁, with the full local algebra at p=2 (§3.5).
- BCGP21 Proposition 4.6.19: the dévissage runs one Hasse exponent at a time (§4.6).
- BCGP21 Proposition 4.4.3 and Lemma 3.8.5: integral descent through deck invariants as a direct factor needs p∤|Δ| (§4.2).
- BCGP21 §6.4: the BGG conjugation is θ_v∘U_source=p^(k_v−l_v+1)U_target∘θ_v (§6.4).
- BCGP21 §6.5.1: the degree of the untruncated finite flat subgroup is used before passing to bounded Hasse coordinates (§6.5).
- BCGP21 Theorem 6.6.4: the Euler argument uses the actual restriction map, with defects a=dim coker H⁰(r) and b=dim ker H¹(r) (§6.7).
- BCGP25 Remark 4.10.7: the degree-zero piece has weight (2,2;−w) (§8.2).
- BCGP25 Proposition 3.6.15: the injectivity of (x+1)∂_x+1 is needed on the constrained fibre at the overlap, not on ambient germs (§8.3).
- BCGP25, the choice of r before Lemma 7.3.8: the condition is read by cases in p (§9.7).

## References

- [BPS] S. Bijakowski, V. Pilloni and B. Stroh, *Classicité de formes modulaires surconvergentes*, Annals of Mathematics 183 (2016), no. 3, 975–1014, doi:10.4007/annals.2016.183.3.5; cited by section and result number of the HAL deposit hal-01409534, whose numbering is that of the published article.
- [P20] V. Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weights*, Duke Mathematical Journal 169 (2020), no. 9, 1647–1807, doi:10.1215/00127094-2019-0075; cited by result number and page of the 113-page author version.
- [BCGP21] G. Boxer, F. Calegari, T. Gee and V. Pilloni, *Abelian surfaces over totally real fields are potentially modular*, Publications Mathématiques de l'IHÉS 134 (2021), 153–501, doi:10.1007/s10240-021-00128-2; cited by result number and page of arXiv:1812.09269v3.
- [BCGP25] G. Boxer, F. Calegari, T. Gee and V. Pilloni, *Modularity theorems for abelian surfaces*, arXiv:2502.20645v1 (2025); cited by result number and page of that version.
- [BP26] G. Boxer and V. Pilloni, *Higher Hida theory for Siegel modular forms*, Inventiones Mathematicae 244 (2026), 45–141, doi:10.1007/s00222-025-01393-2; cited by result number of the author version.
