Verdict: design
Name: RationalAnalyticPrismatization
Base: none
Owner: none

## Scope

Develop the rational analytic prismatization of Anschütz–Le Bras–Rodríguez Camargo–Scholze (ALRS). This is a prismatization with ℚ_p-coefficients for Gelfand stacks over ℚ_p, and in particular for rigid analytic varieties over finite extensions of ℚ_p and over perfectoid bases. It also covers the Gelfand-stack foundations from Anschütz–Bosco–Le Bras–Rodríguez Camargo–Scholze (ABLB) that the prismatization needs and that no roadmap owns. The headline result is ALRS Theorem 1.15 = Theorem 6.3.1 (ALRS line 356, ALRS line 8082). For a smooth partially proper rigid space X over a finite extension of ℚ_p, pullback along FF_{X^⋄} → X^{Div¹} gives an equivalence between perfect complexes on the p-adic twistor stack and perfect complexes on the relative Fargues–Fontaine curve. Around it sit:

- the decompletion theorem for Berkovich spaces with an action of a p-adic Lie group (ALRS Theorem 5.1.1, ALRS line 4738);
- the pro-étale comparison;
- Poincaré duality for twistor cohomology;
- first Chern classes;
- the relation to the p-adic Riemann–Hilbert functor.

**Why a new design.** Nothing on main, in the open roadmap pull requests, in the board packages or in the pinned Mathlib/Tau Ceti defines any of: Gelfand rings or stacks, derived Berkovich spaces, analytic de Rham or Hyodo–Kato stacks, rational δ-spaces, analytic δ-stacks, the analytic prismatization, the p-adic twistor stack, analytic Hodge–Tate stacks, or Gelfand-stack decompletion. The search is recorded in the report.

The roadmap does not continue PrismaticCohomology. Parts I–IV (`TauCetiRoadmap/PrismaticCohomology/README.md` through `TauCetiRoadmap/PrismaticCohomologyPartIV/README.md`, open pull requests) build integral δ-rings, bounded prisms and the Cartier–Witt stack of p-adic formal schemes. Their Hodge–Tate divisor (Part II §§4.12–4.14), Breuil–Kisin twists (Part II §3.9) and prismatic logarithm (Part III §6.10) are the formal-scheme analogues of ALRS §§4.4, 4.9 and 4.10. This roadmap works instead with:

- solid ℚ_p-algebras;
- nilperfectoid test rings;
- degree-one Cartier divisors on thickened Fargues–Fontaine discs.

Hence the verdict is `design`, not `part-ii`. No open target or design plans the same objects. The report gives the comparison with TARGET-ProetaleCohomologyOfPAdicCurvesAndTowers, TARGET-RefinedTraceMethodsPartII and TARGET-AnabelianGeometryAndNonabelianChabautyPartII.

**Section-by-section ownership.** The target asks for an explicit comparison with the roadmaps it names. For every ALRS section:

| ALRS | Status |
| --- | --- |
| §2.1 Gelfand stacks (from ABLB §§2–4) | New here, on the unowned analytic-stack prerequisite (see Suppliers). Solid ℚ_p-modules are imported from VStackSheavesAndLisseCategories VS2.1–VS2.2. Berkovich spectra of Banach algebras are imported from TropicalAndBerkovichArithmetic Layer 0. Arc-stacks are imported from MotivesAndAlgebraicCyclesPartII BM.0. |
| §2.2 Derived Berkovich spaces | New. Compared with rigid spaces (RigidAnalyticGeometry; AdicSpacesPartII §R1), dagger spaces (AdicSpacesPartIV F1) and Berkovich analytic spaces (TropicalAndBerkovichArithmetic §§0.17–0.22). |
| §2.3 Analytic de Rham stacks | New (ABLB §§4.5, 4.7, 5); RC24 is a comparison source. |
| §2.4 Analytification, Tannakian stacks | New. Algebraic stacks come from SchemeAndStackFoundations §§1.18–1.22. Tannakian reconstruction comes from ReductiveGroups Layer 1. |
| §2.5 Generalized Cartier divisors | `[𝔸¹/𝔾_m]` is imported from SchemeAndStackFoundations §1.21. Its Gelfand-stack incarnation is new. |
| §§2.6–2.7 Morphisms, pushouts, †-cohesiveness | New. |
| §§2.8–2.9 Cone construction | New. Compared with the algebraic deformation to the normal cone of SchemeAndStackFoundations §5.5. |
| §3.1 Filtered de Rham stack | New. Toy model only, not an endpoint. |
| §3.2 Fargues–Fontaine curves as Gelfand stacks | New. Compared with RelativeFarguesFontaine §§1.2, 2.1, VectorBundlesAndIsocrystals VB−1 and FarguesFontaineDiamonds F2. |
| §§3.3–3.4 Rational δ-spaces, realizations | New. |
| §3.5 Hyodo–Kato stacks | New (ABLB §6). Comparing their cohomology with Colmez–Nizioł Hyodo–Kato cohomology (CohomologyComparisons §4.9a) is excluded; ABLB Remark 6.1.3, ABLB line 4997, defers it to a sequel. |
| §3.6 Perfect complexes on Fargues–Fontaine curves | New. Bundles on perfectoid-base curves are imported from VectorBundlesAndIsocrystals VB1. |
| §3.7 Locally analytic Banach–Colmez spaces | New. Classical Banach–Colmez spaces are imported from VectorBundlesAndIsocrystals VB3 for the de Rham-stack identification. |
| §§4.1–4.3 Prismatization, geometry, twistor stack | New. Degree-one divisors are imported from RelativeFarguesFontaine §§3.2, 4.7 and FarguesFontaineDiamonds F4. |
| §§4.4–4.5 Hodge–Tate stacks | New. The integral WCart^HT of PrismaticCohomologyPartII §4.12 is a convention Check only. |
| §4.6 Faltings' extension | New construction. Its agreement with the classical extension of PadicHodgeTheory §2.3 is a target. |
| §4.7 Descent | New. |
| §§4.8–4.10 ℚ_p, Breuil–Kisin twist, logarithm, 𝔾_m | New. The integral analogues (PrismaticCohomology §1.5, Part II §3.9, Part III §6.10) are Checks, not imports. |
| §§5.1–5.6 Decompletion | New for semilinear representations over Gelfand rings. The linear theory is imported from LocallyAnalyticRepresentationsOfLocalGroups LR.0, LR.2, LR.3 and LocallyAnalyticDistributionsPartII ND.0. |
| §5.7 Classical Sen theory | New stacky proof. Classical Sen operators are imported from FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P7.1–R07.P7.3 and PadicHodgeTheory §4.4. Tate–Sen traces are imported from PadicPeriodRings §§1.1–1.5. |
| §5.8 Torsors | New. |
| §§6.1–6.4 Pro-étale comparison, torsors | New. PhiGammaModulesAndIwasawaCohomology §1.4 (`cyclotomicDecompletionEquivalence`) is the arithmetic Check. |
| §6.5 Twistor cohomology | New. ClassicalAdicEtaleCohomologyPartII §5.9 (proper rational Poincaré duality) is a Check. |
| §6.6 First Chern class | New. Checked against ClassicalAdicEtaleCohomology §9.3 and CohomologyComparisons §6.7. |
| §6.7 Riemann–Hilbert | New. The functor E ↦ Fil⁰(E⊗OB_dR)^{∇=0} is imported from PadicHodgeTheory §7.1 (`associatedLocalSystem`). |
| Appendix A Deformation theory | New for Gelfand stacks. The animated cotangent complex is imported from DerivedModuleAlgebra §§0.4, 0.25. |

**Owned layers.** The design organises the new work as follows:

1. Gelfand analytic geometry (ABLB §§2–4, 6; ALRS §2, Appendix A).
2. Analytic δ-stacks (ALRS §3).
3. The prismatization and its geometry (ALRS §4).
4. Decompletion and Sen theory (ALRS §5).
5. Comparisons and applications (ALRS §6).

The Gelfand-stack foundations come first and keep a self-contained public interface, so that later consumers (Hauck's syntomification, an integral theory) can import them by section.

**Boundaries.**

- *Analytic stacks and abstract six functors are not owned here.* Two things belong to an earlier supplier that does not yet exist:
  - light analytic rings over ℚ_{p,□} and analytic stacks inverting !-equivalences, with their quasi-coherent six-functor formalism (RCSolid §6.3, RCSolid line 4101 and RCSolid line 4330);
  - the abstract extension theorem for six-functor formalisms (HM Theorem 3.4.11, HM line 2258; SixFF Proposition 5.16, SixFF line 1554), with suave, prim, cohomologically smooth and proper maps (RCSolid §6.2) and Betti stacks (RCSolid §6.5).

  MotivesAndAlgebraicCyclesPartII (merge order line 220, interfaces AS.0–AS.1) and AutomorphicBundlesPartII (gap G-solid) already request this nonexistent `AnalyticStacks` supplier. Planning it here would make an earlier roadmap depend on a later one.
- *Gestalten are avoided.* ALRS uses Gestalten (Gest) in only two places: trivializing codualizing sheaves of 0-proper maps, and !-ability of finite-presentation maps (ALRS Remark 2.1.1, ALRS line 683). The design follows the alternatives that remark names: the l.c.i. class of !-able maps, and the arguments of Remarks 6.5.6 and 6.5.9 (ALRS line 8822, ALRS line 8932).
- *Out of scope:*
  - ℤ_p-coefficient analytic prismatization (ALRS Remark 1.27, ALRS line 551);
  - the filtered prismatization and syntomification (Hauck);
  - characteristic-p geometry;
  - the p-adic monodromy theorem (ABLB Theorem 7.1.1, ABLB line 5523; PadicHodgeTheory §5.1 owns monodromy);
  - the Bhatt–Zhang Simpson gerbe and Cartier duality (ALRS Remark 4.4.6, ALRS line 3561);
  - the open question in ALRS Remark 1.22 (ALRS line 460);
  - the geometrization of locally analytic Langlands.

## Final targets

Coefficients are ℚ_p throughout; this is the source's own restriction (ALRS line 551).

- Constructions are made for arbitrary (qfd, separable) Gelfand stacks.
- Cartesian descriptions require †-cohesive Gelfand stacks (ALRS Definition 2.7.7, ALRS line 1538).
- Comparisons are stated for smooth partially proper rigid spaces over a finite extension K of ℚ_p (mixed case) and for rigid smooth Berkovich spaces over a perfectoid base D (geometric case).
- The arithmetic case X = GSpec(K) and the toric charts 𝔾_m^d are Checks, not separate endpoints.
- Partial properness is not imposed where the source shows it unnecessary: the Hodge–Tate statements, by ALRS Remarks 6.3.4 and 6.4.2 (ALRS line 8277, ALRS line 8349).
- The extensions sketched in ALRS footnotes 48 and 50 are not targets: bases W(k)[1/p] with k perfect of finite transcendence degree, and relative prisms in general (ALRS line 7776, ALRS line 7942).

**T1. Gelfand analytic geometry.**
- Construct bounded solid ℚ_p-algebras, their †-nilradical, †-reduction and uniform completion A^u (ABLB Definitions 2.1.1, 2.2.8, 2.2.19, 2.3.1; ABLB line 609, ABLB line 746, ABLB line 974, ABLB line 1037).
- Construct separable Gelfand rings (ABLB Definition 3.1.1, ABLB line 1162). The Berkovich spectrum M(A) must agree with the Berkovich spectrum of the Banach algebra A^u.
- Construct Gelfand stacks as sheaves of anima on separable Gelfand rings inverting !-equivalences (ABLB Definition 4.2.6, ABLB line 2189), and their qfd variant (ABLB Definition 4.2.14, ABLB line 2261).
- Prove that nilperfectoid rings form a basis of the !-topology, and strictly totally disconnected nilperfectoids a basis in the qfd case (ALRS Theorem 2.1.7, ALRS line 797; ABLB Proposition 4.6.4, ABLB line 2916).
- Prove that perfectoidization GelfStk → ArcStk_{ℚ_p} preserves colimits and has a right adjoint, the analytic de Rham stack (ALRS Remark 1.1, ALRS line 117). This right adjoint is left exact, commutes with colimits and satisfies arc-hyperdescent (ABLB Theorem 5.6.6, ABLB line 4799).
- Embed derived Berkovich spaces and †-rigid spaces fully faithfully (ABLB Definitions 4.3.1, 4.3.6, ABLB line 2295, ABLB line 2384; ALRS Example 2.2.1, ALRS line 908).
- Show that Perf(X) is the dualizable part of D(X) and satisfies !-descent (ALRS line 809; ABLB Lemma 4.2.11, ABLB line 2235).
- Construct the cotangent complex and deformation theory of Gelfand stacks (ALRS Definition A.2.2, ALRS line 9552).
- Checks: the de Rham stack of the analytic affine line is its quotient by the overconvergent neighbourhood G_a^† of zero (ABLB line 105); every affinoid rigid space gives a Berkovich space whose spectrum is the classical one.

**T2. Hyodo–Kato stacks and Fargues–Fontaine curves.**
- For a qfd arc-stack X over 𝔽_p, define the de Rham stack of the punctured curve and the Hyodo–Kato stack X^HK = (FF^⋄_X)^dR (ABLB Definition 6.1.2, ABLB line 4989).
- For a smooth map f of pure relative dimension d, prove that f^HK is cohomologically smooth with dualizing sheaf the d-th power of the Tate twist O⟨1⟩ = O(1)[2]. For f arc-locally lqfd, prove f^HK is !-able, and cohomologically proper when f is proper (ABLB Theorem 6.3.1, ABLB line 5415).
- Construct the relative Fargues–Fontaine curve FF_Y of a Gelfand stack as a Gelfand stack (ALRS Definition 3.2.6, ALRS line 2390). For a smooth morphism of analytic adic spaces over ℚ_p, prove cohomological smoothness of the induced map of Fargues–Fontaine curves, with dualizing complex O(d)[2d], in the light Gelfand formalism (ALBM Theorems 4.4.4 and 4.4.6, ALBM line 1580, ALBM line 1654).

**T3. Analytic δ-stacks.**
- Define rational δ-spaces (S, 𝒳, ι, φ) and rational analytic prisms (ALRS Definition 3.3.1, ALRS line 2398; Definition 4.1.1(1), ALRS line 2953).
- For a uniformly perfectoid T = GSpec(A), the δ-spaces under T have an initial object (T^♭, X_T). For a nilperfectoid T, X_T is the stated pushout of Berkovich spaces (ALRS Proposition 3.4.7, ALRS line 2501).
- Prove that realization AnStk^δ → GelfStk preserves colimits and finite limits, with the stated sheafified description on uniformly perfectoids (ALRS Proposition 3.4.12, ALRS line 2569).
- Prove that (−)^⋄_FF on perfect analytic δ-stacks has fully faithful left and right adjoints (ALRS Proposition 3.5.3, ALRS line 2685), and that Y^HK = D^{×,dR}_{FF,Y}/φ^ℤ (ALRS Remark 3.5.6, ALRS line 2743).
- For a nilperfectoid ℚ_p-algebra A, prove that Perf(FF_A) is the fibre product of Perf(FF_{A^u}) and Perf(A) over Perf(A^u) (ALRS Proposition 3.6.3, ALRS line 2822).
- Prove the pullback squares describing the absolute Banach–Colmez Gelfand stacks BC(O(λ)) and BC(O(λ)[1]) through their de Rham stacks (ALRS Proposition 3.7.4, ALRS line 2915).
- Checks: BC(O) = ℚ_p^{la} (ALRS Proposition 3.7.4(1), ALRS line 2919), and BC(O(1)) is the uncompleted perfectoid open disc (ALRS Example 3.7.3, ALRS line 2890). The de Rham stacks of these Gelfand stacks are the classical Banach–Colmez spaces of VectorBundlesAndIsocrystals VB3 after base change to Marc(ℚ_p) (FS Proposition II.2.2, FS line 2274).

**T4. The prismatization and the twistor stack.**
- For every Gelfand stack X, construct X^Δ, the perfect prismatization, the twistor stack X^{Div¹}, the analytic Hodge–Tate stack X^HT and the relative versions over a prism (ALRS Definitions 4.1.1, 4.1.4, 4.1.8; ALRS line 2953, ALRS line 3010, ALRS line 3048).
- Prove rigidity of prism structures (ALRS Remark 4.1.2(3), ALRS line 2988).
- Prove that the de Rham stack of X^Δ is D^{×,dR}_{FF,X^⋄}, and that X^Δ and X^{Div¹} have the same de Rham stack (ALRS Lemma 4.2.1, Proposition 4.2.3; ALRS line 3062, ALRS line 3080).
- For a perfectoid space Y over ℚ_p, prove Y^HT ≅ Y (ALRS Proposition 4.2.4, ALRS line 3094).
- Prove descent along †-formally étale maps (ALRS Lemma 4.2.5, ALRS line 3118).
- Prove the factorization FF_{X^⋄} → X^{Div¹} → X^HK. The second map is an isomorphism off the Hodge–Tate locus. For †-cohesive X the square with the cone is cartesian (ALRS Propositions 4.3.1–4.3.2, ALRS line 3396, ALRS line 3406).

**T5. Hodge–Tate geometry and Faltings' extension.**
- Construct π_X: X^HT → X × ℚ_p^HT.
- For †-cohesive X with a cotangent complex, X^HT is a torsor for the overconvergent shifted Breuil–Kisin-twisted tangent complex. For formally smooth X it is a gerbe banded by T_X^†{1} (ALRS Proposition 4.4.3, ALRS line 3481). Prove the relative version over a perfect prism (ALRS Proposition 4.4.4, ALRS line 3535).
- Prove the cartesian descriptions of the formal and overconvergent Hodge–Tate stacks (ALRS Propositions 4.5.2–4.5.3, ALRS line 3614, ALRS line 3630).
- Define Faltings' extension through the cone (ALRS Definition 4.6.1, ALRS line 3674). Prove it agrees with the classical extension 0 → Ô(1) → gr¹OB_dR⁺ → Ô⊗Ω¹ → 0 of PadicHodgeTheory §2.3 (ALRS Corollary 4.6.10, ALRS line 3966; Sch13 Corollary 6.14, Sch13 line 1787).
- Prove the absolute and relative formal Hodge–Tate squares (ALRS Corollaries 4.6.11–4.6.12, ALRS line 3985, ALRS line 3999).

**T6. Descent.**
- For f: Y → X a †-formally étale locally †-formally smooth map, prove that f^Δ, the perfect prismatization of f and f^{Div¹} are weakly †-formally smooth, and epimorphisms if f is an arc-cover (ALRS Theorem 4.7.1, ALRS line 4040).
- For an infinitesimally cohesive epimorphism f with perfect cotangent complex of amplitude [−1,0], prove that f^HT is an epimorphism (ALRS Theorem 4.7.2, ALRS line 4062).

**T7. Explicit computations.**
- For the base ℚ_p (ALRS Proposition 4.8.1, ALRS line 4112), prove:
  - ℚ_p^Δ is the fibre product of the Breuil–Kisin divisor with its de Rham stack;
  - ℚ_p^HT → GSpec(ℚ_p) is a gerbe banded by 𝔾_m^†;
  - the perfect prismatization is X_cyc/ℤ_p^{×,la}, and Div¹ = X_cyc/ℚ_p^{×,la};
  - ℚ_p^HT ≅ GSpec(ℚ_p(μ_{p^∞}))/ℤ_p^{×,la}.
- Construct the Breuil–Kisin twist O{1} (ALRS Construction 4.9.1, ALRS line 4233).
- Prove that the prismatic logarithm is †-formally étale, with its fibre square (ALRS Theorem 4.10.6, ALRS line 4494).
- Prove the presentation of the perfect prismatization of 𝔾_m over the cyclotomic prism as 𝔾̃_m/ℤ_p^{la} (ALRS Theorem 4.10.13, ALRS line 4622).
- Checks:
  - ℚ_p^HT against the integral Hodge–Tate stack of AHLB (AHLB Theorem 1.2, AHLB line 42);
  - against PrismaticCohomologyPartII §4.12, where G_a^♯ is replaced by G_a^†;
  - the sign and normalisation of {1} against PrismaticCohomologyPartII §3.9.

**T8. Decompletion by locally analytic vectors.**
- Let X be a Berkovich space with a continuous action of a p-adic Lie group G, and h: X/G^cont → |X|^Betti/G^la (ALRS Theorem 5.1.1, ALRS line 4738). Prove:
  1. h is 0-proper and h^* is fully faithful, defining O_X^{la};
  2. for classically decompleted affinoid X = GSpec(R) (ALRS Definition 5.4.2, ALRS line 5851), modules over R^{la} in D(BG^{la}) are modules over O_X^{la};
  3. for locally strongly decompleted X (ALRS Definition 5.6.8, ALRS line 6730), Perf(X^{la}/G^{la}) ≃ Perf(X/G^cont), also after every equivariant Berkovich-étale X′ → X (ALRS Theorem 5.6.10, ALRS line 6754).
- The semilinear representation theory is the theory of ALRS §5.2 (ALRS Construction 5.2.1, ALRS line 4817), extending the linear theory of LR.3 and RJRC (RJRC Definition 3.3.1, RJRC line 1171).
- Prove the Sen-theoretic decompletions: arithmetic (ALRS Theorem 5.7.4, ALRS line 6930), geometric (ALRS Corollary 5.7.18, ALRS line 7371) and mixed (ALRS Theorem 5.7.19, ALRS line 7390). These rest on the Tate–Sen axioms (ALRS Assumption 5.7.1, ALRS line 6855).
- Prove torsor decompletion (ALRS Propositions 5.8.9–5.8.10, ALRS line 7595, ALRS line 7627).
- Theorem 5.1.1(3) keeps its strong-decompletion hypothesis; the source does not know the general case (ALRS Remark 5.1.4, ALRS line 4791).
- Checks:
  - for one-dimensional Γ, the decompletion recovers W^{fin} = W^{la} and the isomorphism K̂_∞ ⊗ W^{la} ≅ W of Berger–Colmez (BC16 Théorèmes 3.2 and 3.4, BC16 line 397, BC16 line 425);
  - derived locally analytic vectors agree with RJRC22 Theorems 4.36, 5.3, 5.5 (RJRC22 line 162, RJRC22 line 203, RJRC22 line 219) and with LR.2.

**T9. Comparison with the relative Fargues–Fontaine curve (headline).**
- Let K/ℚ_p be finite and X a smooth partially proper rigid space over K. Prove that α_X: FF_{X^⋄} → X^{Div¹} is 0-proper and O → α_{X,*}O is an equivalence. Prove that for every Berkovich-étale Y → X^{Div¹}, pullback gives Perf(Y) ≃ Perf(FF_{X^⋄} ×_{X^{Div¹}} Y) (ALRS Theorem 6.3.1, ALRS line 8082).
- Prove the same for a rigid smooth X over a perfectoid D, relative to FF_D (ALRS Theorem 6.2.1, ALRS line 7921).
- Corollary: Γ(X^{Div¹}, O) = RΓ_proét(X, ℚ_p) (ALRS (1.2.2), ALRS line 480).
- Checks:
  - X = GSpec(K) (ALRS Theorem 6.1.1, ALRS line 7756). On vector bundles this recovers Robba (φ,Γ)-modules and agrees with PhiGammaModulesAndIwasawaCohomology §1.4 (ALRS Remark 1.18, ALRS line 380).
  - Perfect complexes on the Hodge–Tate stack recover v-perfect complexes on X̂^⋄ (ALRS Theorem 6.1.3(1), ALRS line 7798).

**T10. Hodge–Tate stacks and Sen operators.**
- Arithmetic case (ALRS Theorem 6.1.3, ALRS line 7798):
  - L_{X^HT/ℚ_p} ≅ O[−1];
  - every object of the essential image carries an arithmetic Sen operator, equal to the derivative of the Γ-action on locally analytic vectors;
  - Sen's identity H^*(Gal_K, M) ≅ H^*(θ_M, M)^{Gal_K} holds for static objects.
- Geometric case (ALRS Theorem 6.2.2, ALRS line 7976):
  - perfect complexes on X^HT agree with those on X̂^⋄;
  - L_{X^HT/X} ≅ Ω¹_{X/D}{−1}[−1];
  - there is a natural Higgs field, with its Higgs complex;
  - it agrees with the geometric Sen operator of RCSen Theorem 1.0.3 (RCSen line 64).
- Mixed case (ALRS Theorem 6.3.2, ALRS line 8145): the gerbe structure over X × K^HT holds, and L_{X^HT/X} is the inverse Faltings' extension (FE_X^−{−1} = L_{X^HT/X}[1]).
- Check: on finite-dimensional C_p-representations the arithmetic Sen operator is that of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2 and PadicHodgeTheory §4.4.

**T11. Torsors.**
- For X smooth partially proper over ℚ_p and G a p-adic Lie group (ALRS Theorem 6.4.1, ALRS line 8321), prove:
  - G^{la}-torsors on X^HT, on X̂^⋄ and pro-étale G-torsors on X^⋄ are equivalent;
  - G^{la}-torsors on X^{Div¹} restricted over Berkovich-étale U are equivalent to those on FF_{X^⋄} restricted over U;
  - pro-étale G-torsors give G^{la}-torsors on FF_{X^⋄};
  - the relative version over a perfectoid base holds.
- Identify the Sen maps of torsors with geometric and arithmetic Sen operators (ALRS Propositions 6.4.10 and 6.4.12, ALRS line 8477, ALRS line 8545).

**T12. Twistor cohomology and duality.**
- Prove (ALRS Theorem 6.5.4, ALRS line 8745):
  - Div^{1,dR} → GSpec(ℚ_p) is cohomologically proper and smooth with dualizing complex O⟨1⟩;
  - Div¹ → Div^{1,dR} is 0-proper;
  - Div¹ → GSpec(ℚ_p) is 0-proper and cohomologically smooth with dualizing complex O{1}[2], the cyclotomic (φ,Γ)-module.
- For a rigid smooth f: Y → X of relative dimension d, prove that f^{Div¹} is cohomologically smooth. Prove f^{Div¹}_!O ≅ O{d}[2d] over FF_{X^⋄}, and over X^{Div¹} when X is smooth partially proper over ℚ_p (ALRS Theorem 6.5.8, ALRS line 8875).
- For f smooth proper between smooth partially proper rigid spaces, prove that f^{Div¹}_* preserves perfect complexes and satisfies duality with twist {d}[2d] (ALRS Corollary 6.5.11, ALRS line 8952).
- Check: for smooth proper X, (1.2.2) and this duality recover ClassicalAdicEtaleCohomologyPartII §5.9.

**T13. First Chern class.**
- Construct c₁^Δ: B𝔾_m^Δ → B²V(O{1}) from the prismatic logarithm (ALRS Construction 6.6.1, ALRS line 8992).
- Prove the projective-bundle formula, making it a strong theory of first Chern classes in Zavyalov's sense (ALRS Proposition 6.6.7, ALRS line 9093).
- Check: compatibility with pro-étale Chern classes (ALRS Remark 6.6.4, ALRS line 9032; ClassicalAdicEtaleCohomology §9.3).

**T14. Riemann–Hilbert.**
- For smooth X over ℚ_p, the map from the formal Hodge–Tate stack to the formal cone is a T_X^{dR}{1}-torsor; in the partially proper case the same holds for the overconvergent version (ALRS Proposition 6.7.1, ALRS line 9143).
- After base change to Spf B_dR⁺, prove that pullback is fully faithful, with essential image the sheaves whose geometric Sen operators are †-nilpotent (ALRS Proposition 6.7.3, ALRS line 9177).
- On vector bundles, after base change to B⁺_{pdR}, the resulting functor is Scholze's E ↦ Fil⁰(E⊗OB_dR)^{∇=0} (ALRS Proposition 6.7.6, ALRS line 9237; Sch13 Theorem 7.6, Sch13 line 1936; PadicHodgeTheory §7.1).
- Prove the relative version over a perfectoid base (ALRS Proposition 6.7.7, ALRS line 9297).

## Suppliers

The general analytic-stack layer has no owner: an `AnalyticStacks` target must be filed before the design can close. Its contract is the following:

- light analytic rings over ℚ_{p,□};
- the ∞-topos of analytic stacks for !-equivalences;
- the quasi-coherent six-functor formalism, and the HM Theorem 3.4.11 extension;
- suave, prim, cohomologically smooth/proper/étale maps;
- Betti stacks of light condensed anima;
- the cotangent complex of analytic rings.

The sources are RCSolid §§4, 6, 7.4, HM §§3–4 and SixFF Lectures IV–VI. It should sit early in the merge order, after VStackSheavesAndLisseCategories and SolidAnalyticRings and before MotivesAndAlgebraicCyclesPartII, which already cites it. Until that target exists the design records the contract as an explicit supplier gap. It does not move these foundations into this roadmap.

| Supplier (merge-order line) | Sections and use |
| --- | --- |
| Pinned Mathlib | `Mathlib/Condensed/Light/*`, `Mathlib/Condensed/Solid.lean`, `Mathlib/Topology/Category/LightProfinite/*`: light condensed carriers and the integer solidity predicate. Nothing in the pins defines the target's objects. |
| EnhancedDerivedSheaves (main) | E0, E1, E3, E5:abstract, E5:presentability, E5:descent: ∞-categories, presentable stable categories, sheaves of anima, descendable algebras. |
| SchemeAndStackFoundations (main) | §§1.18–1.22 (algebraic stacks, `[𝔸¹/𝔾_m]` in §1.21), §5.5 (deformation to the normal cone). |
| DerivedModuleAlgebra (main) | §§0.4, 0.25 (cotangent complex, deformation theory), §§1.1–1.9 (perfect complexes and descent). |
| RigidAnalyticGeometry, AdicSpacesPartII, AdicSpacesPartIV (main) | Rigid spaces and the rigid–adic comparison; dagger geometry (AdicSpacesPartIV F1). |
| AdicEtaleGeometry (main, 10) | §§A1.10–A1.12 (pro-étale site), §A2.1 (partially proper morphisms). |
| PerfectoidSpaces (12), DiamondsAndVStacks (15) | Tilting and untilts (P1–P3); v-topology and diamonds (D2, D4), the diamond of an analytic adic space (D6.4), rigid full faithfulness (D6.9). |
| PadicPeriodRings (19), FiniteFlatGroupsAndIntegralPadicHodgeTheory (52), AInfCohomology (62) | B_dR⁺, t and Tate–Sen traces (§§1.1–1.5, 3–4); Sen modules and operators (§§R07.P7.1–R07.P7.3); pro-étale period sheaves (§AI.3.1). |
| PhiGammaModulesAndIwasawaCohomology (31) | §1.0 cyclotomic Robba realization; §1.4 `cyclotomicDecompletionEquivalence` (Check for T9). |
| LocallyAnalyticDistributions (76) | Layer 0 locally analytic functions and distributions (through LR). |
| FarguesFontaineDiamonds (131), PadicHodgeTheory (136), VectorBundlesAndIsocrystals (139), RelativeFarguesFontaine (143) | F2 quotient and F4 untilt divisors; §§0.2–0.3, 2.1–2.4 (period sheaves, Faltings' extension), §4.4 (Sen), §7.1 (Riemann–Hilbert); VB−1, VB1, VB3 (Banach–Colmez spaces), VB4 (local systems); §§1.2, 2.1, 3.2, 4.7 (annuli, relative curve, untilt divisors, Div¹). |
| VStackSheavesAndLisseCategories (144) | VS2.1 solid abelian groups and solid tensor; VS2.2 `SolidECoefficients`, analytic measures, analytic spectra. |
| TropicalAndBerkovichArithmetic (201) | §§0.1–0.24: Berkovich spectrum, Banach rings, completed residue fields, affinoid and analytic spaces. |
| MotivesAndAlgebraicCyclesPartII (220, board design) | BM.0: Banach arc-site, Marc(A), strict basis, quasi-pro-étale maps. This roadmap owns the comparison with ABLB's light arc-stacks (ABLB Definition 4.1.8, ABLB line 2023). |
| ClassicalAdicEtaleCohomology, ClassicalAdicEtaleCohomologyPartII (284) | §9.3 Chern classes; §5.9 rational Poincaré duality (Checks only). |
| LocallyAnalyticDistributionsPartII (300, board design) | ND.0 p-valued groups and Lazard coordinates (ALRS Theorem 5.2.14, ALRS line 5314). |
| LocallyAnalyticRepresentationsOfLocalGroups (302, board design) | LR.0 locally analytic representations; LR.2 derived locally analytic vectors; LR.3 solid representations and solid locally analytic vectors. |

**Placement.** Provisionally the roadmap goes immediately after LocallyAnalyticRepresentationsOfLocalGroups in `merge-order/ORDER.txt`, and after the future AnalyticStacks entry. This triage makes no order edit.

**Requested changes to existing designs.**
- File AnalyticStacks, as above. MotivesAndAlgebraicCyclesPartII AS.0–AS.1 and AutomorphicBundlesPartII G-solid need it too.
- LocallyAnalyticRepresentationsOfLocalGroups LR.2 and CompletedCohomologyPartII F.4 both plan derived locally analytic vectors. Their owners should consolidate them; this roadmap imports LR.2 and LR.3 only.
- No existing design duplicates this target. PrismaticCohomology I–IV, RelativeFarguesFontaine (and its Part II), FarguesFontaineDiamonds, HodgeTateAndCanonicalSubgroups, LocallyAnalyticDistributions, SolidAnalyticRings and PadicHodgeTheory keep their scopes. They are suppliers or comparison partners and do not need to change. When this roadmap is designed, their downstream lists may name it.

## Consumers

No roadmap later in the current merge order consumes these objects yet. Prospective consumers are:

- a Part II for the filtered prismatization and rational analytic syntomification (Hauck abstract, Hauck line 7);
- an integral analytic prismatization (ALRS line 559);
- TARGET-ProetaleCohomologyOfPAdicCurvesAndTowers (open, #401), if its design uses the twistor-stack duality for pro-étale cohomology of curves (it would then be placed after this roadmap);
- a geometrization of the locally analytic p-adic Langlands programme (ALRS Remark 1.23, ALRS line 472). This would use Pan22's geometric Sen theory together with LocallyAnalyticRepresentationsOfLocalGroups and the CompletedCohomology roadmaps.

## Sources

Every cited work is recorded once in `packages/RationalAnalyticPrismatization/sources.toml`. All were fetched legally (author pages and arXiv), and none is missing.

| Key | Work and principal locators |
| --- | --- |
| ALRS | Anschütz–Le Bras–Rodríguez Camargo–Scholze, *Rational analytic prismatization*, 2026 preprint, author page. All final targets; locators as above. |
| ABLB | Anschütz–Bosco–Le Bras–Rodríguez Camargo–Scholze, *Analytic de Rham stacks of Fargues–Fontaine curves*, arXiv:2510.15196v2. §§2–6; Theorems 5.6.6, 6.3.1. Numbering must be collated with ALRS's citations. |
| RCSolid | Rodríguez Camargo, *Notes on Solid Geometry*, arXiv:2603.03012v1. §§4, 6, 7.4: the unowned analytic-stack contract. |
| HM, SixFF | Heyer–Mann, arXiv:2410.13038v1, Theorem 3.4.11; Scholze, *Six-Functor Formalisms*, arXiv:2510.26269v2, Lectures IV–VI. |
| Gest | Scholze, *Geometry and higher category theory*, author page. Definitions 6.5, 6.12; Proposition 9.5; Corollary 9.8. To be avoided where ALRS Remark 2.1.1 permits. |
| ALBM | Anschütz–Le Bras–Mann, arXiv:2412.20968v2, Theorems 4.4.4, 4.4.6. |
| RC24 | Rodríguez Camargo, arXiv:2401.07738v1, §§5.2–5.4. |
| FS | Fargues–Scholze, arXiv:2102.13459v4, Propositions II.1.18, II.1.21, II.2.2. |
| RJRC22, RJRC | Rodrigues Jacinto–Rodríguez Camargo, arXiv:2110.11916v2 (Theorems 4.36, 5.3, 5.5) and arXiv:2305.03162v5 (Definition 3.3.1, Theorem 4.1.5). |
| BC16 | Berger–Colmez, arXiv:1405.5430v1 (Ann. ENS 2016), Théorèmes 3.2, 3.4. |
| RCSen | Rodríguez Camargo, *Geometric Sen theory over rigid analytic spaces*, arXiv:2205.02016v4, Theorems 1.0.3–1.0.4. |
| Sch13 | Scholze, arXiv:1205.3463v2, Corollary 6.14 (Faltings' extension), Theorem 7.6 (Riemann–Hilbert functor). |
| AHLB | Anschütz–Heuer–Le Bras, arXiv:2211.08470v3, Theorem 1.2. |
| Pan22, Hauck | Pan, arXiv:2008.07099v3; Hauck, arXiv:2604.15193v2. Consumer context only. |

## Risks

- **Unowned foundations.** The analytic-stack and abstract six-functor layer is far above the pinned libraries, and no roadmap or open target owns it. Mathlib has light condensed modules and an integer solidity predicate, but no ∞-topoi of analytic stacks, no !-topology and no six-functor formalism. Without an AnalyticStacks supplier, T1–T14 rest on a declared gap.
- **Size.** ABLB (129 pp.) and ALRS (193 pp.) together are very large. The design should freeze the T1–T2 interface first, so that the Gelfand foundations can be split into an earlier supplier without re-planning if review asks for it.
- **Preprint status.** ALRS is an unrefereed 2026 author-page preprint. Its introduction and body differ in places (Theorem 1.19 versus Theorem 5.1.1(1)). It cites ABLB in an earlier numbering. Locators are pinned by sha256 and must be re-collated if the file changes.
- **Hypotheses that must not be weakened.** Theorem 5.1.1(3) needs strong decompletion (ALRS line 4791). Theorem 6.5.8(3) needs partial properness (ALRS Remark 6.5.9, line 8932). Remark 1.22 is an open question. The extensions in footnotes 48 and 50 are sketches.
- **Gestalten.** If the l.c.i. route of ALRS Remark 2.1.1 does not cover a needed !-ability (Proposition 6.5.10), the design meets a second unowned foundation (Gest). It must then record that as a gap rather than assume it.
- **Board-design suppliers.** BM.0, ND.0, LR.2 and LR.3 are board designs, not merged roadmaps. Their section labels may change, and LR.2 overlaps CompletedCohomologyPartII F.4.
- **Acceptance test.** Almost every headline statement lives in stable ∞-categories of quasi-coherent sheaves on Gelfand stacks. `Suggested.lean` must still use a single `import Mathlib`, simple definitions, no sorry'd data and no `set_option`. It may therefore be limited to the few statements expressible at the pins; classical consequences such as the Berger–Colmez decompletion for finite-dimensional semilinear representations are candidates. Missing carriers must not be hidden in axioms or abstract structures. This triage writes no Lean.
