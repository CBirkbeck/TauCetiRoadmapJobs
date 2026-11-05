Verdict: duplicate
Name: SymplecticAlmostComplexStructures
Base: none
Owner: HeegaardFloer §4.1 (F2.1, "Symplectic and almost-complex foundations": the spaces of smooth tame and compatible J, nonemptiness, the contraction to a chosen compatible J₀, relative extension on closed spatial regions, C^∞ continuity) together with AnalyticStableMaps §2.1 (pull request #987: the smooth tame and compatible spaces with the C^∞ topology are complete metrizable, hence Baire; the finite-regularity Banach manifolds J^ℓ), §2.13 and §2.18–§2.21 (the Baire genericity argument, on compact and on arbitrary second-countable targets, including the space fixed outside a precompact open set), §10.1 (contractibility of the tame space by the polar retraction), ComplexKahlerGeometry K5a (the Fréchet C^∞ topology on smooth sections of a finite-rank bundle over a second-countable manifold: completeness, atlas independence) and the pinned Tau Ceti declarations `TauCeti.SymplecticForm.Tames`, `TauCeti.SymplecticForm.Compatible`, `TauCeti.SymplecticForm.exists_compatible`, `TauCeti.SmoothAlmostComplexStructure`, `TauCeti.SmoothTwoForm.Tames`, `TauCeti.SmoothTwoForm.Invariant`, `TauCeti.SmoothTwoForm.Compatible` (the pointwise and manifold-level definitions and the metric g_J).

## Scope

The target asks for one object, the space 𝒥(M, ω) of smooth ω-compatible almost complex
structures on a second-countable symplectic manifold without boundary, with its tame enlargement
𝒥_τ(M, ω) and its relative version 𝒥(M, ω; 𝒰, J_fix) of structures agreeing with a fixed
compatible J_fix outside an open 𝒰 with compact closure, and for four theorems about it: the
C^∞ topology (Fréchet, independent of the auxiliary metric, chartwise), closedness in the ambient
section space and hence completeness and the Baire property, nonemptiness and contractibility,
and the vocabulary of Baire subsets and "generic J". This is exactly the setup of Wendl's
super-rigidity paper (wendl-superrigidity lines 166–186), whose Remark 1.3 (line 175) notes that
the same statements hold for tame structures and for arbitrary almost complex structures.

Every piece of this is already owned, by the pinned library or by a roadmap on main or at an
open head:

- **Pointwise linear algebra.** `TauCeti.AlmostComplexStructure`, `TauCeti.SymplecticForm`,
  `TauCeti.SymplecticForm.Tames` (ω(v, Jv) > 0 for v ≠ 0) and
  `TauCeti.SymplecticForm.Compatible` (invariance plus tameness) are in
  `TauCeti/Geometry/Symplectic/AlmostComplex.lean`; the metric g_J = ω(·, J·) with its positivity
  and nondegeneracy is `associatedBilinForm` and `innerProductCore` in
  `TauCeti/Geometry/Symplectic/CompatibleMetric.lean`, the symmetrised tame metric is
  `symmetrizedBilinForm` in `TauCeti/Geometry/Symplectic/TameMetric.lean`, and existence of a
  compatible structure on a finite-dimensional symplectic vector space is
  `TauCeti.SymplecticForm.exists_compatible` in `TauCeti/Geometry/Symplectic/ExistsCompatible.lean`.
  The sign convention ω(v, Jw) versus ω(Jv, w) is fixed there and is the one Wendl uses
  (wendl-superrigidity line 169).
- **Manifold-level definitions.** `TauCeti.SmoothAlmostComplexStructure` (a smooth section of
  End(TM) with J² = −1) and `TauCeti.SmoothTwoForm.Tames`, `.Invariant`, `.Compatible` are in
  `TauCeti/Geometry/Symplectic/Manifold/AlmostComplex.lean` and
  `TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean`, with the reduction of each predicate to the
  pointwise one on tangent fibres.
- **The C^∞ topology on sections.** ComplexKahlerGeometry K5a (`TauCetiRoadmap/ComplexKahlerGeometry/README.md`,
  the paragraph beginning "Construct the Fréchet topology on all smooth sections of every
  finite-rank bundle") owns the compact-C^k seminorm topology on Γ(E) for every finite-rank
  bundle E over a finite-dimensional second-countable Hausdorff manifold, its completeness, atlas
  independence and continuous restriction, and K5a.SmoothSectionMontel its Montel property. With
  E = End(TM) this is the Fréchet space of the target; independence of the auxiliary metric h is a
  reformulation of atlas independence. The weak Whitney topology on maps is already in the
  library (`ContMDiffMap.weakWhitneyTopology`, `TauCeti/Geometry/Manifold/ContMDiffMap/WeakWhitney.lean`,
  and its manifold version in `.../Chart/Topology.lean`), and GeometricTopology §3.1 (pull
  request #903) owns the comparison of the weak topology with the Whitney C^∞ topology on compact
  sources.
- **The spaces of tame and compatible J, nonemptiness and contractibility.** HeegaardFloer §4.1
  (F2.1), on main and at the head of pull request #1794, constructs the spaces of smooth tame and
  compatible J on a finite-dimensional symplectic manifold on the native bundle carriers, proves
  nonemptiness, a contraction fixing a chosen compatible J₀, and extension of prescribed smooth
  finite-parameter families relative to closed parameter faces and closed spatial regions with an
  open neighbourhood of prescribed data, with the pointwise homotopies, smooth bundlewise
  assembly, finite-C^k estimates and C^∞ continuity on compact sources. The relative extension on
  a closed spatial region is the contraction of 𝒥(M, ω; 𝒰, J_fix) fixing M ∖ 𝒰.
  AnalyticStableMaps §10.1 (pull request #987) owns contractibility of the tame space by the
  polar retraction onto compatible structures with respect to g_J, and records why convex
  combinations do not work for tame structures.
- **Completeness and the Baire property.** AnalyticStableMaps §2.1 constructs the Banach
  manifolds J^ℓ_τ and J^ℓ_c of C^ℓ tame and compatible structures, with prescribed germs on a
  closed subset, and proves that the smooth tame and compatible spaces with the C^∞ topology are
  complete metrizable, so that Baire category applies, and dense in each J^ℓ. Its supplier
  contract names Mathlib's Baire theorem on complete metrizable spaces
  (`BaireSpace.of_completelyPseudoMetrizable`, `dense_iInter_of_isOpen`) as the only Baire input.
  §2.13 runs the countable-intersection genericity argument on compact targets and §2.18–§2.21
  extend it to arbitrary second-countable symplectic targets, including the theorem for
  structures fixed outside a precompact open set U, which is Wendl's 𝒥(M, ω; 𝒰, J_fix).
- **"Generic J" and Baire subsets.** The definition of a Baire (comeagre) subset, closure under
  countable intersection and density in a complete metric space (wendl-superrigidity lines
  180–186) are Mathlib: `BaireSpace`, `dense_iInter_of_isOpen`, `dense_biInter_of_isOpen` in
  `Mathlib/Topology/Baire/Lemmas.lean`, and the instances in
  `Mathlib/Topology/Baire/CompleteMetrizable.lean`.

What no roadmap states in so many words is small and follows from the owners above: that
𝒥(M, ω) is closed in the Fréchet space of K5a on a noncompact M (the three defining conditions
are pointwise closed, and a limit of compatible structures is compatible because g_J is a limit
of inner products that is nondegenerate by invariance, the argument AnalyticStableMaps §2.1 runs
on compact targets); that on 𝒥(M, ω; 𝒰, J_fix) the weak topology is induced by the metric
Σ 2^{−k} min{1, ‖J − J'‖_{C^k(closure 𝒰)}} and agrees with the strong Whitney topology, because
all differences are supported in one compact set; and the example that the weak and strong
topologies on 𝒥(M, ω) differ when M is noncompact. The strong (fine) Whitney C^∞ topology on
sections over a noncompact manifold is owned by no roadmap, but the target does not need it
beyond this remark, and no consumer named in the target uses it: every genericity statement in
AnalyticStableMaps, FukayaTheory and HeegaardFloer is made in the compact-C^k topology. These
remarks are a note for the authors of HeegaardFloer F2.1 and AnalyticStableMaps §2.1, not a
roadmap.

## Final targets

None are assigned: each theorem of the target has an owner.

1. Compatibility ⇔ g_J(v, w) = ω(v, Jw) is a Riemannian metric, with the sign convention:
   library, `TauCeti.SymplecticForm.Compatible` and `CompatibleMetric.lean`; manifold level
   `TauCeti.SmoothTwoForm.Compatible` (TwoForm.lean lines 114–170 of the pinned file).
2. The C^∞ topology on Γ(End TM): Fréchet, complete, atlas independent, chartwise:
   ComplexKahlerGeometry K5a (main).
3. 𝒥(M, ω), 𝒥_τ(M, ω), 𝒥(M, ω; 𝒰, J_fix) as spaces; nonemptiness; contraction to J_fix fixing
   a closed spatial region: HeegaardFloer §4.1 (F2.1) (main, head #1794). Tame contractibility:
   AnalyticStableMaps §10.1 (#987).
4. Closedness, complete metrizability and the Baire property of the smooth tame and compatible
   spaces, with prescribed germs on a closed subset; the C^ℓ Banach manifolds: AnalyticStableMaps
   §2.1 (#987); the noncompact-target and precompact-U versions: §2.18–§2.21.
5. Baire subsets, countable intersections, density, "for generic J": Mathlib
   `BaireSpace`, `dense_iInter_of_isOpen`; used as such by AnalyticStableMaps §2.13 and
   FukayaTheory FK3 (#1045).

## Suppliers

Not applicable (duplicate). For the record, the owners above sit as follows: the library
declarations are pinned; ComplexKahlerGeometry, HeegaardFloer and GeometricTopology's host are on
main; AnalyticStableMaps (#987), GeometricTopology (#903), HeegaardFloer's refactor (#1794) and
FukayaTheory (#1045) are open pull requests.

## Consumers

The consumers the target names already import the owners: AnalyticStableMaps §2.1 and §2.13
(generic J on compact targets) and §2.18–§2.21 (arbitrary targets, precompact U);
PseudoholomorphicCurveAnalysis (#1793) and HeegaardFloer (#1794) for the Cauchy–Riemann analysis
at a fixed J; GromovWittenTheory (#990) fixes one tame J on a closed target and consumes
AnalyticStableMaps; FukayaTheory (#1045) FK3 takes its residual sets from HeegaardFloer F2.4 and
Mathlib `BaireSpace`; SymplecticGeometry S1 (main) consumes HeegaardFloer F2.1's compatible-structure
family. A future target on Wendl's super-rigidity and transversality theorems (wendl-superrigidity
lines 201, 266, 290, 777) would state its Baire subsets inside AnalyticStableMaps §2.1's complete
metrizable space with germs prescribed outside U; no roadmap mentions super-rigidity yet.

## Sources

- wendl-superrigidity: C. Wendl, *Transversality and super-rigidity for multiply covered
  holomorphic curves*, arXiv:1609.09867v7 (published Annals of Mathematics 198 (2023), no. 1).
  Open repository (arXiv), certified. Section 1.1, lines 166–186: the space 𝒥(M, ω; 𝒰, J_fix),
  Remark 1.3, Baire subsets and generic J.
- gromov-pseudoholomorphic: M. Gromov, *Pseudo holomorphic curves in symplectic manifolds*,
  Invent. Math. 82 (1985), 307–347, Section 1 (tame structures). Open repository (EuDML landing
  page, GDZ volume PPN356556735_0082), but the GDZ viewer served no extractable text, so the entry
  is recorded as uncertified and cited by locator.
- mcduff-salamon-intro: D. McDuff, D. Salamon, *Introduction to Symplectic Topology*, 3rd ed.,
  Oxford 2017, Chapter 2 and Section 4.1. Paywalled, uncertified, cited by locator.
- mcduff-salamon-jhol: D. McDuff, D. Salamon, *J-holomorphic Curves and Symplectic Topology*,
  2nd ed., AMS Colloquium Publications 52, 2012, Chapter 3. Paywalled, uncertified, cited by locator.
- hirsch-difftop: M. W. Hirsch, *Differential Topology*, GTM 33, 1976, Chapter 2 (weak and strong
  topologies, Baire property). Paywalled, uncertified, cited by locator.
- audin-lafontaine: M. Audin, J. Lafontaine (eds.), *Holomorphic Curves in Symplectic Geometry*,
  Progress in Mathematics 117, 1994, Chapter II. Paywalled, uncertified, cited by locator.

## Risks

None for the verdict. Two things the owners' authors may want to know:

- HeegaardFloer F2.1 proves C^∞ continuity of its contraction "on compact sources"; the
  contraction of 𝒥(M, ω; 𝒰, J_fix) on a noncompact M is continuous for the compact-C^k topology
  because the contraction is pointwise and fixes M ∖ 𝒰, but F2.1 does not say so explicitly.
- AnalyticStableMaps §2.1 states complete metrizability for compact X; on arbitrary targets
  §2.18 transfers the carriers "replacing only compactness", and the supplier contract requires a
  complete metrizable parameter space for §2.19's Baire argument. The noncompact case follows
  from ComplexKahlerGeometry K5a's Fréchet completeness plus closedness, which §2.1's argument
  gives, but the dependency on K5a is not written in §2.1's Needs line.
