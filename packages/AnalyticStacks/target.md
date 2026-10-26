Verdict: design
Name: AnalyticStacks
Base: none
Owner: none

## Scope

This roadmap develops the general theory of light analytic rings and analytic stacks of Clausen and Scholze, in the written account of Rodríguez Camargo (RCSolid). On top of that theory it builds the quasi-coherent six-functor formalism and the parts of the abstract six-functor calculus (Heyer–Mann, Scholze) that analytic geometry over ℤ_■, over ℚ_{p,■} and over Gelfand rings needs. Several board designs already request this theory under the name `AnalyticStacks`, and none of them can plan it, because their consumers sit earlier in the merge order than they do:

- RationalAnalyticPrismatization declares six contracts with supplier "none" (`analytic-stacks`, `analytic-stacks-betti-nuclear`, `solid-cotangent-complex`, `analytic-cartier-duality`, `algebraic-stacks-as-analytic`, `solid-serre-duality`). Its review (F01 in `packages/RationalAnalyticPrismatization/reports/REV-DESIGN-RationalAnalyticPrismatization.md`) blocks until a roadmap owns them.
- MotivesAndAlgebraicCyclesPartII requests the interfaces `AnalyticStacks:AS.0` and `AnalyticStacks:AS.1` (merge order line 223).
- AutomorphicBundlesPartII records gap G-solid, "solid/discrete six operations" (merge order line 234).
- HigherHidaAndColemanTheory was told by its review that no owner exists. It therefore moved the solid six operations on finite-type ℤ-schemes into its own target D1/solid-scheme-operations.

**Why a new design, and not a Part II.** Nothing on main, in the 367 open roadmap pull requests, on the board or in the pinned Mathlib and Tau Ceti defines any of the following:

- light analytic rings over a general base;
- the analytic rings ℚ_{p,■} or (A, A⁺)_■ for complete Huber pairs, in the light setting;
- the ∞-topos of analytic stacks;
- an abstract six-functor formalism with its extension theorem;
- suave or prim maps;
- Betti stacks of condensed anima;
- the cotangent complex of analytic rings;
- analytic Cartier duality;
- the realization of algebraic stacks as analytic stacks;
- solid Serre duality.

The report records the searches. The nearest roadmaps keep their scope and supply this one:

- SolidAnalyticRings is the light solid coefficient library. It is sphere-linear by design, and its analytic structures (§§7.1–7.3) are coefficient structures with no geometry.
- VStackSheavesAndLisseCategories VS2.2 has analytic measures, solid E-coefficients and the Zariski gluing of ℤ-solid spectra of discrete rings. It works in the κ-condensed setting and for the BCGP application only.
- DiamondSixOperations and VStackSheavesAndLisseCategories build concrete étale six operations, prime to p, on v-stacks without an abstract formalism.

AnalyticStacks does not continue any of these in their own direction: it is geometry (stacks, six functors, smoothness and duality), not coefficient algebra. Hence the verdict is `design`. The filed name is kept, and it is the name the consumers already use.

**Generality.** The filed wording is "light analytic geometry over ℚ_p". The sources state almost everything for arbitrary light analytic rings, or for a small category of them, and the library needs that generality:

- the motivic and automorphic consumers work over ℤ_■ and over discrete rings with solid structures;
- the prismatization works over ℚ_{p,■} and over Gelfand rings.

The general statements are therefore the targets, and the ℚ_p statements are their instances (Checks, or named corollaries where a consumer needs them). In particular:

- the analytic ring ℚ_{p,■} is the instance (ℚ_p, ℤ_p)_■ of the solid analytic ring of a complete Huber pair (AS.2);
- "analytic stacks for !-equivalences" is constructed relative to any essentially small category of affinoid analytic stacks over a base, stable under finite limits and finite coproducts (AS.3);
- "cohomological smoothness of maps represented in smooth rigid spaces" is the instance of the theorem for locally solid smooth maps of solid Huber rings (AS.6). That theorem covers schemes and rigid spaces at once.

The filed phrase "dualizing complex given by the shifted cotangent complex" follows the shorthand of ALRS Remark 6.5.6 (ALRS line 8825), and it is imprecise. The source's theorem is that the dualizing complex is the determinant of the cotangent complex, shifted by the relative dimension (RCSolid Theorem 7.7.21, RCSolid line 6208). For smooth maps this equals Ω^d[d]. That is the target.

**Suggested layer labels.** The labels follow the requests already on the board, so that the consumers' citations resolve. The design may renumber them, but must then tell those consumers.

| Label | Content | Requested by |
| --- | --- | --- |
| AS.0 | abstract three- and six-functor formalisms, construction, extension, kernels, suave/prim/smooth/proper/étale calculus | MotivesAndAlgebraicCyclesPartII AS.0; RationalAnalyticPrismatization `analytic-stacks` (c), (d) |
| AS.1 | quasi-coherent six functors on algebraic stacks in the !-topology; graded, filtered and complete filtered modules; shearing | MotivesAndAlgebraicCyclesPartII AS.1 (in part); RationalAnalyticPrismatization `algebraic-stacks-as-analytic` |
| AS.2 | light analytic rings, colimits and induced structures, localizations, solid Huber rings, ℚ_{p,■} | RationalAnalyticPrismatization `analytic-stacks` (a); LocallyAnalyticRepresentationsOfLocalGroups LR.3 |
| AS.3 | the !-able class, the quasi-coherent six-functor formalism, the ∞-topos of analytic stacks, its instances (schemes, discrete adic spaces, solid Huber stacks, ℚ_{p,■}-stacks), realization of algebraic stacks | RationalAnalyticPrismatization `analytic-stacks` (b), (c), (f); HigherHidaAndColemanTheory AS.3; AutomorphicBundlesPartII G-solid |
| AS.4 | Betti stacks and classifying stacks of locally profinite groups, nuclear modules and their descent, Fredholm criteria | RationalAnalyticPrismatization `analytic-stacks` (e), `analytic-stacks-betti-nuclear` |
| AS.5 | the cotangent complex of analytic rings | RationalAnalyticPrismatization `solid-cotangent-complex` |
| AS.6 | solid finite presentation, étale and smooth maps; suaveness of l.c.i. maps; solid Serre duality | RationalAnalyticPrismatization `solid-serre-duality`; HigherHidaAndColemanTheory; AutomorphicBundlesPartII |
| AS.7 | Cartier duality in kernel categories; ring stacks and transmutation; tori, vector bundles and gerbes | RationalAnalyticPrismatization `analytic-cartier-duality` |

**Boundaries.** What other roadmaps own is imported by name and section.

- *Light condensed foundations.* Light profinite sets and light condensed modules are in Mathlib. Light solid abelian groups, the solid tensor product and light solid spectra are SolidAnalyticRings §§1.1–1.5, 2.1–2.4. Their spectral analytic structures, completed scalar extension and discrete animated Huber-pair coefficient structures are SolidAnalyticRings §§7.1–7.3, with the site comparison of §7.4.
  - AS.2 defines analytic rings over condensed animated rings and proves their comparison with SolidAnalyticRings §7.1 (through its §2.3) and with VStackSheavesAndLisseCategories VS2.2 (through SolidAnalyticRings §7.4). It does not redefine the spectral structures.
  - The geometric statements about discrete Huber pairs (open immersions, rational localizations, descent) are new here.
- *Higher category theory.* Quasicategories, presentable and dualizable categories, monadicity, descendable algebras, sheaves of anima, animated rings and the cotangent complex of discrete animated rings are EnhancedDerivedSheaves E0, E2.6–E2.7, E3, E5:abstract, E5:presentability, E5:descent, E5:animation and E5:cotangent-export.1.
- *Classical algebra.* The classical cotangent complex, regular quotients and Koszul complexes are DerivedModuleAlgebra §§0.4, 0.6, 0.12–0.13, 0.K.1. Classical algebraic stacks, quotient stacks, [𝔸¹/𝔾_m] and abelian quasi-coherent sheaves on stacks are SchemeAndStackFoundations §§1.15, 1.18–1.22, and derived quasi-coherent complexes on schemes are its §2.18.
- *Representations, Huber pairs, nuclear modules.*
  - Smooth representations, their enhancement and derived invariants are SmoothRepresentationsOfLocalGroups SR.0.2 and SR.0d.1–SR.0d.2; Haar measures and the modulus character are its SR.0.3 and SR.1.1.
  - Huber pairs, rational localizations, smooth morphisms of adic spaces and rigid spaces are AdicSpacesPartII §§R0.1, R0.4–R0.8, R0.16, R1.1.
  - Trace-class maps and nuclear modules are RefinedTraceMethods §6.2.
- *Not owned here:*
  - Gelfand rings and stacks, bounded solid ℚ_p-algebras, the Fredholm property of Gelfand rings (ABLB §3.3), derived Berkovich spaces, analytic de Rham stacks, and the deformation theory of Gelfand stacks. These stay with RationalAnalyticPrismatization.
  - Scholze–Stefanich Gestalten and the n-proper and n-étale maps they define (Gest Lectures VII and IX). They are a separate theory. If RationalAnalyticPrismatization answers its review F02 by repair (a), Gestalten need their own target, placed after this roadmap.
  - The application of Cartier duality to the Hodge–Tate stack and the Simpson gerbe (RC26a §3.4). RationalAnalyticPrismatization also excludes it.
  - Liquid and gaseous analytic rings and complex-analytic geometry. The general definitions cover them, but no consumer needs their theory.
  - Analytic stacks over the category of all analytic rings, which RCSolid Warning 6.3.24 (RCSolid line 4445) says requires facts not known to its author.

## Final targets

Throughout, "analytic ring" means light analytic animated ring; categories of complete modules are presentable stable ∞-categories, and every functor is derived. Each block below is stated at the generality of its source. Instances that a consumer names are listed as Checks or corollaries.

**AS.0 Abstract six-functor formalisms.**
- **Formalisms.** Define geometric setups (C, E) and the symmetric monoidal ∞-category of correspondences Corr(C, E). Define 3-functor formalisms as lax symmetric monoidal functors Corr(C, E) → Cat, and 6-functor formalisms (HM §§2.1–3.2; SixFF Definitions 2.3–2.5, SixFF line 486; RCSolid Definitions 6.1.1, 6.1.4, RCSolid line 3567, RCSolid line 3688).
- **Construction principle.** Let C have pullbacks, let I, P ⊆ E be a suitable decomposition, and let D: C^op → CAlg(Pr^L) be given. Suppose D has:
  - left adjoints j_! for j ∈ I;
  - right adjoints p_* for p ∈ P;
  - base change and projection formula for both.

  Then D extends to a 6-functor formalism with j_! the left adjoint and p_! = p_* (HM Proposition 3.3.3, HM line 1924; Man22 Proposition A.5.10, Man22 line 12675; SixFF Theorem 4.6, SixFF line 1016).
- **Extension to sheaves.** A sheafy presentable 6-functor formalism on a subcanonical site C extends uniquely to Shv(C). The class of !-able maps of the extension is local on the target, local on the source, stable under disjoint unions, and tame (HM Theorem 3.4.11, HM line 2258; SixFF Theorem 5.19, SixFF line 1576; RCSolid Theorem 6.2.11, RCSolid line 3924).
- **Kernel category.** Construct the 2-category of kernels K_{D,S} and its functoriality (HM §§4.1–4.2, Theorem 4.2.4, HM line 3073). Define:
  - f-suave and f-prim objects with their duals (HM Definition 4.4.1, HM line 3225; SixFF Definition 6.1 and Propositions 6.6, 6.9, SixFF line 1667);
  - D-suave and D-prim maps, with their locality and permanence lemmas (HM Definition 4.5.1 and Lemmas 4.5.4–4.5.18, HM line 3505);
  - D-étale and D-proper maps for truncated maps, with f^! ≅ f^* and f_! ≅ f_* respectively (HM Definition 4.6.1 and Lemma 4.6.4, HM line 3731, HM line 3783; SixFF Definitions 6.10, 6.12);
  - cohomologically smooth maps and the trace criterion (SixFF Definition 5.1 and Theorem 5.5, SixFF line 1152, SixFF line 1195);
  - exceptional descent (HM §4.7).
- **Checks.**
  - For f = id_S, the f-suave objects are exactly the dualizable objects of D(S) (HM Example 4.4.3).
  - Isomorphisms are suave, prim, étale and proper.
  - In the étale formalism of DiamondSixOperations, ℓ-cohomologically smooth maps (its §S4.2) are D-smooth.

**AS.1 Quasi-coherent six functors on algebraic stacks.**
- **The formalism on affines.** On affine derived schemes, take E = P = all maps and I = isomorphisms. Then R ↦ D(R) is a 6-functor formalism. So is its condensed promotion D^cond(R) = Mod_R(D(ℤ^cond)), and so is its base change along any analytic ring A (RCSolid §6.4 and Remark 6.4.1, RCSolid line 4457, RCSolid line 4465).
- **The !-topology and AlgStk.** The !-covers are the descendable maps (RCSolid Remark 6.4.2, RCSolid line 4490). AlgStk is the ∞-category of presheaves inverting !-equivalences. Hypersheaves for the ω₁-fpqc topology map to it (RCSolid Proposition 6.4.5, Corollary 6.4.6, RCSolid line 4562), and schemes embed fully faithfully (RCSolid Proposition 6.4.9, RCSolid line 4614).
- **Schemes and formal completions.**
  - Every qcqs morphism of schemes is !-able and prim, with trivial dualizing object (RCSolid Proposition 6.4.7, RCSolid line 4568).
  - The formal completion along a finitely generated ideal is the colimit of the derived quotients by powers of the generators, and its D is the derived complete modules (RCSolid Proposition 6.4.12, RCSolid line 4650).
  - The formal completion of the affine line at zero is suave over the base, with f^!ℤ ≅ O[1] (RCSolid Lemmas 6.4.15–6.4.16, RCSolid line 4702, RCSolid line 4736).
- **Graded and filtered modules.** QCoh(B𝔾_m) is graded objects and QCoh(𝔸¹/𝔾_m) is filtered objects, symmetric monoidally (Mou Theorems 4.1 and 1.1, Mou line 168, Mou line 26; RCSolid Remark 7.7.6, RCSolid line 5936). The Rees module is the pullback along 𝔸¹ → 𝔸¹/𝔾_m (RCSolid Example 7.7.8, RCSolid line 5947). The completion 𝔸̂¹/𝔾_m gives complete filtered objects. All of this holds with coefficients in any presentable D(ℤ)-linear category (ALRS Remark 2.9.1, ALRS line 1866).
- **𝔸̂¹ and shearing.**
  - 𝔸̂¹ = BG_a[−1], so that 𝔸̂¹/𝔾_m = BG_a[−1]/𝔾_m with ε₁ in degree 1 and weight −1. The source states this over ℚ_{p,■} (ALRS line 1893). The design states it over the most general base on which the zero section is a !-cover (RCSolid Lemma 6.4.15).
  - Over ℚ-linear coefficients, shearing identifies sheaves on BG_a[−1]/𝔾_m with graded objects carrying a differential shifted by one. The Beilinson t-structure on this category has heart the chain complexes (ALRS Remark 2.9.2, ALRS line 1900; BZSV §6.3).

**AS.2 Light analytic rings.**
- **Definition.** An uncompleted analytic ring is a condensed animated ring A▷ with a full subcategory D(A) ⊂ D(A▷) such that:
  - D(A) is stable under limits and colimits;
  - D(A) is stable under RHom_ℤ(C, −) for condensed C;
  - the left adjoint of the inclusion preserves connective objects.

  It is an analytic ring when A▷ ∈ D(A) (RCSolid Definition 4.1.1, RCSolid line 1431; the κ-condensed form is CSAnal Definition 12.1 and Proposition 12.20, CSAnal line 3015, CSAnal line 3320).
- **Colimits.**
  - Uncompleted analytic rings have small colimits, and analytic rings are stable under sifted colimits, with A[S] computed termwise (RCSolid Proposition 4.1.11 and Corollary 4.1.12, RCSolid line 1599, RCSolid line 1619).
  - D: AnRing → CAlg(Pr^L_{D(ℤ^cond)}) preserves colimits (RCSolid Proposition 4.1.14, RCSolid line 1664).
  - Completions exist (RCSolid §4.2, Corollary 4.2.7).
- **Induced structures.** For an A-algebra B in D(A), the induced structure B_{A/} has D(B_{A/}) = Mod_B(D(A)). Analytic ring structures are invariant in the sense of RCSolid Theorem 4.4.1 (RCSolid line 1898).
- **Localizations.**
  - Localizations of D(A) by killing idempotent algebras, and the smashing spectrum (RCSolid Proposition 4.6.2 and §5.1, RCSolid line 2091, RCSolid line 2212).
  - ℤ[T]_■ as a localization of (ℤ[T], ℤ)_■ (RCSolid Proposition 5.2.2 and Theorem 5.2.3, RCSolid line 2419, RCSolid line 2434).
  - R_■ for R of finite type and then for every animated R, with (−)_■ fully faithful (RCSolid Theorem 5.3.2, Definition 5.4.7, Proposition 5.4.11, RCSolid line 2471, RCSolid line 3097, RCSolid line 3132).
  - The open immersions of RCSolid Lemmas 5.4.13–5.4.14 (RCSolid line 3168).
- **Solid Huber rings.**
  - Define (A▷, S)_■ and solid Huber rings (RCSolid Definition 7.1.1, RCSolid line 4779). The inclusion of solid Huber rings into analytic rings over ℤ_■ has a right adjoint (RCSolid Proposition 7.1.5, RCSolid line 4813).
  - Discrete Huber pairs (Man22 Definition 2.9.3 and Proposition 2.9.6, Man22 line 4884) and complete Huber pairs (And21 Proposition 3.34, And21 line 1569) embed fully faithfully (RCSolid Example 7.1.4, RCSolid line 4805).
  - Rational localizations are open immersions, and D satisfies descent on the solid adic spectrum (RCSolid Definition 7.2.1, Lemma 7.2.3 and Proposition 7.2.12, RCSolid line 4912, RCSolid line 5082; And21 Theorem 4.1, And21 line 1596; SixFF Theorem 9.15).
- **Instance.** For a complete nonarchimedean field E over ℚ_p, E_■ = (E, O_E)_■. In particular ℚ_{p,■} = (ℚ_p, ℤ_p)_■, and its induced structures on solid ℚ_p-algebras are closed under colimits and base change.
- **Checks.**
  - ℚ_{p,■} is the structure on ℚ_p induced from ℤ_■.
  - Completed direct sums of copies of ℚ_p tensor over ℚ_{p,■} to the completed direct sum over the product index set (RCSolid Example 3.5.4, RCSolid line 1336).
  - On common light presentations, D(ℚ_{p,■}) agrees with VStackSheavesAndLisseCategories VS2.2 `SolidECoefficients` for E = ℚ_p.
  - The discrete Huber pairs here have the coefficient structures of SolidAnalyticRings §7.3.

**AS.3 Analytic stacks and the quasi-coherent six-functor formalism.**
- **The !-able class.** On affinoid analytic stacks, define the classes:
  - P: maps whose target has the induced structure;
  - I: open immersions in the smashing spectrum;
  - E: !-able maps.

  Prove the factorization E = P ∘ I and the adjunction properties (RCSolid Definition 6.3.2 and Lemma 6.3.3, RCSolid line 4025, RCSolid line 4034). By AS.0 this gives a presentable 6-functor formalism with j_! = j_♮ and p_! = p_* (RCSolid Corollary 6.3.4, RCSolid line 4101), with categorical Künneth (RCSolid Proposition 6.3.7, RCSolid line 4146).
- **Analytic stacks.** Fix a base S and an essentially small full subcategory C₀ of affinoid analytic stacks over S, stable under finite limits and finite coproducts. AnStk(C₀) is the full subcategory of presheaves inverting ℵ₁-compact !-equivalences (RCSolid Definitions 6.3.13, 6.3.16, 6.3.23, RCSolid line 4295, RCSolid line 4435; ABLB Definition 4.2.1, ABLB line 2109).
  - It is an ∞-topos and a cotopological localization of !-sheaves (RCSolid Corollary 6.3.15, RCSolid line 4330).
  - D extends to it as a 6-functor formalism (RCSolid Corollary 6.3.19, RCSolid line 4364).
  - D inverts !-equivalences (RCSolid Proposition 6.3.18, RCSolid line 4358). Site comparisons induce morphisms of topoi (RCSolid Lemmas 6.3.20–6.3.21, RCSolid line 4370).
  - Descendable maps of analytic rings are !-covers.
  - A !-sheaf of categories that is fully faithful along !-equivalences inverts them. ABLB proves this only for perfect complexes on Gelfand stacks (ABLB Lemma 4.2.11, ABLB line 2235, after Sch24 Corollary VI.1.4). The general form is a target here, and the design fixes its locator.
- **Instances.**
  1. Derived schemes almost of finite type over ℤ, and discrete adic spaces, with P the proper maps, I the open immersions and E the separated maps (SixFF Theorem 9.7, SixFF line 3208; RCSolid §§5.4, 5.6, Corollary 5.4.17 and Theorem 5.6.8, RCSolid line 3212, RCSolid line 3426; CSCond Lectures VIII–X). For proper f, f_* preserves pseudocoherent and coherent complexes, and perfect complexes if f has finite Tor-dimension (SixFF Theorem 9.18, SixFF line 3444).
  2. Solid Huber stacks (RCSolid Definitions 7.3.1–7.3.2, RCSolid line 5180), which contain rigid spaces over complete nonarchimedean fields.
  3. Analytic stacks over ℚ_{p,■} for the induced structures on solid ℚ_p-algebras, which is the setting of the prismatization.
- **Realization of algebraic stacks.** Construct (−)^cond: AlgStk → AnStk with D(X^cond) = Fun_{QCoh(ℤ)}(QCoh^!(X), D(ℤ^cond)). For !-able X this is QCoh(X) ⊗_{QCoh(ℤ)} D(ℤ^cond), and QCoh → D((−)^cond) is a morphism of 6-functor formalisms (RCSolid Remark 6.4.1 and Corollary 6.4.6; ALRS Remark 2.9.1, ALRS line 1866). The graded, filtered and complete filtered descriptions of AS.1 therefore hold on B𝔾_m × Y, 𝔸¹/𝔾_m × Y and 𝔸̂¹/𝔾_m × Y for every analytic stack Y.
- **Checks.**
  - The coefficients ℤ/p^s and their finite flat extensions in instance 1, which is the form HigherHidaAndColemanTheory uses.
  - The !-cover ℚ_p → ℤ_p((x))^∧_p[1/p] (ABLB line 2231).
  - The empty cover.
  - On affines of discrete rings, VStackSheavesAndLisseCategories VS2.2 `ZSolidAnalytification` gives the induced (A, ℤ)_■-structures of AS.2.

**AS.4 Betti stacks, nuclear modules and Fredholm rings.**
- **Betti realization.** (−)^Betti: CondAni → AnStk preserves colimits and finite limits, is the left adjoint in a morphism of ∞-topoi, and sends a light profinite S over ℚ_{p,■} to AnSpec C^lc(S, ℚ_p) (RCSolid §6.5, RCSolid line 4745; ABLB Lemma 4.2.9, ABLB line 2214). Composed with D, it recovers, after base change to D(ℤ^cond), the six-functor formalism on condensed anima of HM Proposition 3.5.22 (HM line 2691).
- **Classifying stacks.** Let G be locally profinite with locally finite Λ-cohomological dimension. Then ∗/G is Λ-suave iff G is locally Λ-Poincaré (HM Proposition 5.3.19, HM line 4885). For Λ a ℤ[1/p]-algebra and G locally pro-p, the dualizing complex is the modulus character (HM Example 5.3.21, HM line 4911). The same holds for (∗/G)^Betti over ℚ_{p,■}. D(∗/G, Λ) is identified with the enhanced smooth representations of SmoothRepresentationsOfLocalGroups SR.0d.
- **Nuclear modules.** The definitions are imported from RefinedTraceMethods §6.2. For analytic rings with induced structure, this block proves:
  - Nuc(A) is closed under colimits and tensor products, and its ω₁-compact objects are the basic nuclear ones (ABLB Lemmas A.0.6–A.0.9, ABLB line 6781; CSAnal Proposition 13.13, CSAnal line 3787; CS22 Theorem 8.6, CS22 line 3168);
  - nuclear modules descend along countable !-equivalences of nuclear algebras (ABLB Lemma A.0.13, ABLB line 6850);
  - on a light profinite set T, nuclear sheaves are nuclear C(T, Λ)-modules (AM24 Lemma 3.29, AM24 line 1713).
- **Fredholm rings.** An analytic ring is Fredholm if its dualizable objects are perfect. This is equivalent to the trace-class criterion (Sch24 Definition VI.1.6 and Proposition VI.1.5, Sch24 line 1743; CS22 Definition 9.7, CS22 line 3639). Further:
  - conservative base change detects perfect amplitude (Sch24 Proposition VI.1.2 and Corollaries VI.1.3–VI.1.4, Sch24 line 1720);
  - Fredholmness passes along surjections satisfying a Nakayama condition (Sch24 Proposition VI.1.7, Sch24 line 1755);
  - Banach algebras with induced structure are Fredholm, and so are filtered colimits of them. The source proves this for liquid real Banach algebras (CS22 Assumption 9.8 and Proposition 9.11, CS22 line 3716). The design proves the solid nonarchimedean analogue for Banach ℚ_p-algebras, the case used in ABLB Proposition 3.3.5 (ABLB line 1828).
- **Check.** ℚ_{p,■} is Fredholm (ABLB line 3624).

**AS.5 The cotangent complex of analytic rings.**
- **Definition.** For a map A → B of analytic rings, L_{B/A} ∈ D_{≥0}(B) corepresents M ↦ Der_A(B, M) on connective complete B-modules. Here B ⊕ M carries the structure induced from B (RCSolid Definition 7.4.1 and Remark 7.4.2, RCSolid line 5257).
- **Properties.**
  - Base change along pushouts, compatibility with colimits of arrows, the transitivity fibre sequence, and vanishing for idempotent maps (RCSolid Lemma 7.4.3, RCSolid line 5276; ALRS Lemma A.1.1, ALRS line 9427).
  - Connectivity and Postnikov statements, and the comparison with induced structures (RCSolid Lemma 7.4.5 to Corollary 7.4.8, RCSolid line 5315 to RCSolid line 5339).
  - Descent of exterior powers of the cotangent complex along descendable maps, also for analytic rings with induced structure (ALRS Lemma A.1.2, ALRS line 9435).
- **Checks.**
  - On discrete animated rings with trivial structure, L agrees with EnhancedDerivedSheaves §E5:cotangent-export.1 and DerivedModuleAlgebra §0.4 (RCSolid Example 7.4.4(1), RCSolid line 5295).
  - L vanishes for the idempotent map ℤ[T] → ℤ((T⁻¹)).

**AS.6 Solid smoothness and Serre duality.**
- **Morphism classes.** Morphisms of solid finite presentation, solid étale and solid smooth maps, and their local structure (RCSolid Definitions 7.5.4, 7.6.1, 7.6.3, Proposition 7.6.5 and Theorem 7.6.7, RCSolid line 5458, RCSolid line 5766).
- **Suaveness.**
  - For maps of analytic rings with trivial structure, f is suave iff B is dualizable over A (RCSolid Lemma 6.3.5, RCSolid line 4111). Hence regular closed immersions are suave, with invertible dualizing complex in homological degree minus their codimension.
  - Maps of derived schemes of finite Tor-dimension are suave, and l.c.i. maps have invertible f^!1 computed by the determinant of the cotangent complex (SixFF Theorem 9.17, SixFF line 3423; CSCond Proposition 11.5, CSCond line 2853).
- **Smoothness and duality.**
  - ℤ_■ → ℤ[T]_■ is cohomologically smooth with dualizing complex ℤ[T][1] (RCSolid Proposition 7.1.11, RCSolid line 4874).
  - A locally solid smooth map of solid Huber rings is cohomologically smooth, with f^!1 locally a line bundle in homological degree dim f. It is cohomologically étale if it is locally solid étale (RCSolid Theorem 7.7.1, RCSolid line 5827).
  - Through the deformation to the normal cone, f^!1 ≅ det(L_{B/A})[dim f], natural up to a sign depending only on dim f (RCSolid Theorem 7.7.21, RCSolid line 6208). This uses RCSolid Proposition 7.7.2, Construction 7.7.15 and Remark 7.7.17 (RCSolid line 5849, RCSolid line 6032, RCSolid line 6063).
- **Corollaries.** Smooth morphisms of schemes, and smooth morphisms of rigid spaces over a complete nonarchimedean field, are cohomologically smooth with dualizing complex det Ω¹[n] (RCSolid Corollary 7.7.23, RCSolid line 6255; CSCond Theorems 11.1 and 11.6, CSCond line 2706). Coherent duality for proper smooth schemes follows (RCSolid Remark 7.7.24).
- **Checks.**
  - The zero section of 𝔸¹_ℤ has dualizing complex Hom_{ℤ[T]}(ℤ, ℤ[T]) ≅ ℤ[−1] (RCSolid line 5838).
  - For 𝔸¹_ℤ → Spec ℤ, the compactification through Spa(ℤ[T], ℤ) computes f_!1 as the fibre of ℤ[T] → ℤ((T⁻¹)) (SixFF line 3427).
  - ALRS Remark 6.5.6 (ALRS line 8825) writes the dualizing complex of a map represented in smooth rigid spaces of pure dimension d as L_g[d]. The determinant form of AS.6 agrees with this when d = 1, and is the correct form in general.

**AS.7 Cartier duality in six-functor formalisms.**
- **Framework.**
  - Presentable kernel categories (RC26a §2.1, Definition 2.1.6 and Proposition 2.1.9).
  - Lurie-style Cartier duality for commutative monoid objects and the notion of a 1-categorical Cartier duality given by a bilinear pairing (RC26a Theorem 2.3.2, Propositions 2.4.3–2.4.4 and Definition 2.4.7, RC26a line 678, RC26a line 861).
  - The descent criterion RC26a Theorem 2.5.15 (RC26a line 1318).
  - Ring stacks in analytic stacks and the transmutation of separated finite-type schemes along them (SixFF Theorem 10.6, SixFF line 3612).
- **Dualities.**
  1. ℤ^Betti against 𝔾_m and lattices against tori (RC26a Proposition 3.1.3 and Theorem 3.1.4, RC26a line 1495, RC26a line 1518).
  2. Ĝ_a against G_a^♯ over ℤ^cond, through exp(xy) over ℚ (RC26a Proposition 3.2.6 and Corollary 3.2.7, RC26a line 1610).
  3. The solid version (RC26a Proposition 3.2.11, RC26a line 1680).
  4. Overconvergent against open discs over R = ℤ((π)) (RC26a Proposition 3.2.21, RC26a line 1881).
  5. G_a^{♯,†} against G_a^{an} over R (RC26a Proposition 3.2.27, RC26a line 1936). ALRS cites this as "Theorem 3.2.27"; it is a Proposition in v3.
  6. ℤ_p^{la} against 1 + D^{<1}_{ℚ_p} through the Amice transform (RC26a Proposition 3.2.32, RC26a line 2013).
- **Stacky form.** For each ring stack of RC26a Example 3.2.36, the transmuted universal vector bundle and its dual satisfy Cartier dualities exchanging !- and ∗-functors in the kernel category over the stack of vector bundles (RC26a Theorem 3.2.37, RC26a line 2085). The same holds for gerbes of vector bundles (RC26a Proposition 3.3.3, RC26a line 2171).
- **Classifying stacks.** Over an animated solid K_■-algebra A, D([AnSpec A/𝔾_m^{an}]) is modules over A ⊗ ℓ^{temp}_{ℤ,K}, and D(AnSpec A × 𝔾_m^{an}) is D([AnSpec A/ℤ^{temp}]) (RJRC Proposition 4.4.8, RJRC line 2134). D(BV^{♯,†}) is identified with D(V^{∨,an}).
- **Checks.**
  - D(B𝔾_m) recovers the graded modules of AS.1.
  - For finite locally free commutative group schemes, the classical Cartier dual of Tau Ceti (`TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean` at the pin) agrees with the 1-categorical duality of this block.

## Suppliers

The roadmap goes immediately after RefinedTraceMethods (merge order line 220), its last supplier, and before MotivesAndAlgebraicCyclesPartII (line 223), its first requesting consumer. This triage makes no order edit.

| Supplier (merge-order line) | Sections and use |
| --- | --- |
| Pinned Mathlib | `LightProfinite`, `LightCondensed` (`Mathlib/Condensed/Light/Basic.lean:28`), `LightCondMod` (`Mathlib/Condensed/Light/Module.lean:42`), `CondensedMod.IsSolid` (`Mathlib/Condensed/Solid.lean:83`), basic quasicategories (`Mathlib/AlgebraicTopology/Quasicategory/`), Kähler differentials. Nothing at the pin defines analytic rings, correspondences or six-functor formalisms. |
| Pinned Tau Ceti | Classical Cartier duality of finite locally free group schemes and finite Hopf algebras (`TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/`, `TauCeti/Algebra/HopfAlgebra/FiniteDual/CartierDuality/`); a Check for AS.7. |
| SchemeAndStackFoundations (main, line 2) | §1.15 (𝔾_m-torsors), §§1.18–1.22 (stacks, quotient stacks, [𝔸¹/𝔾_m], abelian QCoh of stacks), §2.18 (derived quasi-coherent complexes); AS.1. |
| DerivedModuleAlgebra (main, line 7) | §§0.4, 0.6, 0.12–0.13 (cotangent complex, universal property, smooth and regular-quotient cases), §0.K.1 (Koszul complexes), §1.E.0 (perfect complexes); AS.5, AS.6. |
| AdicSpacesPartII (main, line 8), RigidAnalyticGeometry (main) | §§R0.1, R0.4–R0.8 (Huber pairs, completed tensor, fibre products), §R0.16 (smooth and étale morphisms), §R1.1 (rigid spaces); AS.2, AS.6. |
| EnhancedDerivedSheaves (main, line 17) | E0, E2.6–E2.7, E3, E5:abstract, E5:presentability (including dualizable categories and the tensor product of presentable categories), E5:descent, E5:animation, E5:cotangent-export.1; all layers. |
| SmoothRepresentationsOfLocalGroups (line 25) | SR.0.2, SR.0d.1–SR.0d.2 (smooth representations and their enhancement), SR.0.3, SR.1.1 (Haar measures, modulus character); AS.4. |
| ProfiniteCohomology (main) | Cohomological dimension of profinite groups; AS.4. |
| LocallyAnalyticDistributions (line 76) | §0.1 (Amice transform); AS.7. |
| DiamondSixOperations (line 90) | §§S3–S4; Check for AS.0 only. |
| VStackSheavesAndLisseCategories (line 144) | VS2.1 (compact-Hausdorff solid abelian groups); VS2.2 (`AnalyticMeasures`, `SolidECoefficients`, `ZSolidAnalytification`); comparisons in AS.2, AS.3. |
| SolidAnalyticRings (line 145) | §§1.1–1.5, 2.1–2.4 (light solid spectra and abelian groups, Hℤ-linear comparison), §§7.1–7.4 (spectral analytic structures, completed scalar extension, discrete Huber-pair coefficient structures, site comparison); AS.2, AS.3. |
| RefinedTraceMethods (line 220) | §6.2 (trace-class maps and nuclear solid modules), §§4.1–4.3 (dualizable and rigid categories, nuclear objects); AS.4. |

## Consumers

| Consumer | What it takes |
| --- | --- |
| MotivesAndAlgebraicCyclesPartII (line 223, board design) | AS.0 for its interface `AnalyticStacks:AS.0`. AS.1 for the derived quasi-coherent categories and tensor descent of its interface `AnalyticStacks:AS.1`. The comodule and operator identifications of that interface for its stacks MG_k and MG_C stay with the consumer. |
| AutomorphicBundlesPartII (line 234, board design) | AS.3 instance 1 and AS.6 for gap G-solid (solid six operations on schemes, the discrete-to-solid comparison of SixFF Theorem 9.18). The filtered support functors of BP26 stay with the consumer. |
| HigherHidaAndColemanTheory (board design, not yet ordered) | AS.3 instance 1 and AS.6. Its D1/solid-scheme-operations should be repointed here once this design exists; its review offered that alternative. Its requests to SolidAnalyticRings (`gap:solid-localization-kernel`) overlap AS.2's localization targets, and the two designs should agree which one owns them. |
| RationalAnalyticPrismatization (board design) | The six gap slugs map as follows: `analytic-stacks` to AS.0, AS.2, AS.3 and AS.4 (classifying stacks); `analytic-stacks-betti-nuclear` to AS.4; `solid-cotangent-complex` to AS.5; `analytic-cartier-duality` to AS.7; `algebraic-stacks-as-analytic` to AS.1 and AS.3; `solid-serre-duality` to AS.6. |
| LocallyAnalyticRepresentationsOfLocalGroups (line 306, board design) | AS.2 for E_■ and the solid structures of affinoid algebras, which its LR.3 attributes to the nonexistent stages SolidAnalyticRings SA.2 and SA.4. |
| Prospective | TARGET-ProetaleCohomologyOfPAdicCurvesAndTowers, if its design uses solid ℚ_p-cohomology; a Gestalten roadmap; the syntomification and integral Part IIs that RationalAnalyticPrismatization names. |

## Sources

Every cited work is recorded once in `packages/AnalyticStacks/sources.toml`. All were read from arXiv or the authors' pages, and nothing is missing. The Clausen–Scholze course *Analytic stacks* (2023–24) that the target names has no written text: the course page links only to recordings, and the book cited as [CS26] in CSAnal is in preparation. It is therefore not a source here. RCSolid is the written account of that course.

| Key | Work | Principal locators |
| --- | --- | --- |
| RCSolid | Rodríguez Camargo, *Notes on Solid Geometry*, arXiv:2603.03012v1 | §§4–7; AS.1–AS.3, AS.5, AS.6 |
| HM | Heyer–Mann, *6-Functor Formalisms and Smooth Representations*, arXiv:2410.13038v1 | Proposition 3.3.3, Theorem 3.4.11, §§4.1–4.7, Proposition 3.5.22, §5.3; AS.0, AS.4 |
| SixFF | Scholze, *Six-Functor Formalisms*, arXiv:2510.26269v2 | Theorems 4.6, 5.5, 5.19; Definitions 5.1, 6.1, 6.10, 6.12; Theorems 9.7, 9.15, 9.17, 9.18, 10.6; AS.0, AS.3, AS.6, AS.7 |
| Man22 | Mann, *A p-adic 6-functor formalism in rigid-analytic geometry*, arXiv:2206.02022v1 | Proposition A.5.10, Definition 2.9.3, Proposition 2.9.6; AS.0, AS.2 |
| ABLB | Anschütz–Bosco–Le Bras–Rodríguez Camargo–Scholze, arXiv:2510.15196v2 | Definition 4.2.1, Lemmas 4.2.9, 4.2.11, Appendix A, §3.3; AS.3, AS.4 |
| RC26a | Rodríguez Camargo, *Cartier duality for gerbes of vector bundles*, arXiv:2512.24967v3 | §§2–3; AS.7 |
| RJRC | Rodrigues Jacinto–Rodríguez Camargo, *Solid locally analytic representations*, arXiv:2305.03162v5 | Proposition 4.4.8; AS.7 |
| AM24 | Anschütz–Mann, arXiv:2403.01951v2 | Lemma 3.29; AS.4 |
| Sch24 | Scholze, *Geometrization of the real local Langlands correspondence*, author page (draft) | §VI.1; AS.4 |
| CS22 | Clausen–Scholze, *Condensed Mathematics and Complex Geometry*, arXiv:2605.11731v1 | Theorem 8.6, Definition 9.7, Proposition 9.11; AS.4 |
| CSCond, CSAnal | Scholze (with Clausen), *Lectures on Condensed Mathematics*, arXiv:2605.03658v1; *Lectures on Analytic Geometry*, arXiv:2605.03655v1 | CSCond Lectures VII–XI; CSAnal Definition 12.1, Propositions 12.20, 13.13; AS.2–AS.4, AS.6 |
| And21 | Andreychev, arXiv:2105.12591v1 | Proposition 3.34, Theorem 4.1; AS.2 |
| Mou, BZSV | Moulinos, *The geometry of filtrations*, arXiv:1907.13562v2; Ben-Zvi–Sakellaridis–Venkatesh, *Relative Langlands duality*, arXiv:2409.04677v1 | Mou Theorems 1.1, 4.1; BZSV §6.3; AS.1 |
| ALRS | Anschütz–Le Bras–Rodríguez Camargo–Scholze, *Rational analytic prismatization*, author page | Remarks 2.9.1–2.9.2, Lemmas A.1.1–A.1.2; AS.1, AS.5 and the consumer contract |
| Gest | Scholze, *Geometry and higher category theory*, author page | Lectures VII, IX; boundary only |

## Risks

- **Higher-categorical foundations above the library.** AS.0 needs things that no roadmap supplies:
  - the symmetric monoidal ∞-category of correspondences with its operadic structure;
  - the (∞,2)-category of kernels and the calculus of adjunctions in it (HM Appendix D; SixFF Appendix to Lecture V);
  - presentable enriched categories (RC26a §2.1).

  EnhancedDerivedSheaves supplies quasicategories, presentability, monoidal localizations and mates, but not (∞,2)-categories. The design must either plan the needed (∞,2)-categorical statements inside AS.0 or declare them as a gap on an EnhancedDerivedSheaves Part II. AS.0 is also a natural cut: if review asks for a split, it can become a separate earlier roadmap without re-planning.
- **Set theory.** Analytic stacks exist here only relative to an essentially small C₀ (RCSolid Warning 6.3.24, RCSolid line 4445). Consumers must name their C₀, as ABLB does for Gelfand rings (ABLB line 2228).
- **Unproved or deferred steps in the sources.**
  - RCSolid is a set of seminar notes (v1, unrefereed). Parts of its Lemma 7.4.3 and Lemma 5.4.13 are left to the reader (RCSolid line 5288, RCSolid line 3172), and its notion of algebraic stack is non-standard by its own footnote (RCSolid line 4484).
  - The uniqueness clause of RCSolid Corollary 6.3.4 rests on an external reference that this triage did not read (RCSolid line 4107). The design decides whether uniqueness is a target and fetches that work if so.
  - Sch24 is a draft for a seminar. ALRS and Gest are unrefereed, and the Clausen–Scholze book is unpublished. Locators are pinned by sha256 and must be re-collated if the files change.
- **A statement whose nonarchimedean locator is missing.** The RationalAnalyticPrismatization contract attributes "Banach ℚ_p-algebras are Fredholm" to Sch24, but Sch24 proves only the gaseous real cases (Propositions VI.1.8–VI.1.9), and CS22 Proposition 9.11 proves the liquid real Banach case. The solid ℚ_p analogue in AS.4 has no source locator yet. The design must find one or prove it from CS22 Assumption 9.8.
- **Ownership seams.** Three neighbouring plans touch this one:
  - SolidAnalyticRings §7.3 owns discrete Huber-pair coefficient structures. HigherHidaAndColemanTheory has asked SolidAnalyticRings for the localization kernel of (A[T], A)_■ → A[T]_■. AS.2 must import whatever SolidAnalyticRings settles and plan only the rest.
  - VStackSheavesAndLisseCategories VS2.2 already glues ℤ-solid spectra of discrete rings. AS.3 must compare with it, not replace it.
  - HigherHidaAndColemanTheory's D1/solid-scheme-operations duplicates AS.3 instance 1 and AS.6 until it is repointed.
- **Hypotheses that must not be weakened.**
  - Shearing and the Beilinson description need ℚ-linear coefficients (ALRS line 1907).
  - The Fredholm, nuclear-descent and classifying-stack statements keep their source hypotheses: nuclear algebras, countable diagrams, and locally finite cohomological dimension.
- **Acceptance test.** Every headline statement lives in stable ∞-categories of complete modules on analytic stacks, which the pins do not have. `Suggested.lean` must still use a single `import Mathlib`, simple definitions, no sorry'd data and no `set_option`. It is likely to name the headlines as not statable at the pins. Missing carriers must not be hidden in axioms or abstract structures. This triage writes no Lean.
