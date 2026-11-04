# Triage report: TARGET-DynamicalDegreesOfRationalMaps

Verdict: `design`, name `DynamicalDegreesOfRationalMaps`, no base, no owner. The brief is
`packages/DynamicalDegreesOfRationalMaps/target.md`; the manifest is
`packages/DynamicalDegreesOfRationalMaps/sources.toml` (nine entries, seven certified from arXiv,
two paywalled books recorded as uncertified). No text is missing, so no `needs-references.toml`
was written.

## Consolidation against the open board

Every open target and design listed in the job was compared by mathematical object. None concerns
rational maps, intersection numbers on graphs, degree growth or entropy of algebraic maps:
`DimerModelsAndLozengeTilings`, `ConstructiveFieldTheoryPhi4`, `CountableStructureSpacesPartII`,
`ComplexHessianEquations`, the five explicit-analytic-number-theory targets,
`BallQuotientsAndComplexHyperbolicLattices`, `AmenableTracesOnCStarAlgebras` and the remaining
geometric, analytic and arithmetic targets (`VirtualFundamentalClasses`, `NashBlowups`,
`StackPointsAndResidualGerbes`, `HyperbolicDynamicsAndThermodynamicFormalism`,
`MathematicalBilliards`, `SurfaceGroupCharacterVarieties`, `QuasicoherentSheavesOnPrestacks`, the
modularity targets, and the rest) share at most a supplier (SchemeAndStackFoundations) or the word
"dynamics" (`HyperbolicDynamicsAndThermodynamicFormalism` is smooth dynamics on manifolds,
`MathematicalBilliards` is billiards). `VirtualFundamentalClasses` builds rational Chow groups on
Deligne–Mumford stacks and does not touch degrees of rational maps. No merge.

## Ownership searches

`roadmaps grep` over main and all open pull requests, by object:

- "dynamical degree", "algebraic entropy", "Khovanskii", "Teissier": no match anywhere.
- "Cremona": only Cremona's book on elliptic curves (EllipticCurveModularity,
  EffectiveDiophantineMethods).
- "rational self-map", "dominant rational map", "indeterminacy": `ArithmeticDynamics` (#1335)
  §0.18 (monoid of rational self-maps of ℙ¹ as pairs of binary forms, degree multiplicative),
  §0.26 (comparison with endomorphisms of the scheme ℙ¹); `AbelianSchemesAndArithmeticModuli`
  (#849) one lemma on indeterminacy loci of maps to affine schemes. Nothing in dimension `≥ 2`.
- "topological degree", "Fekete": only unrelated uses (Fekete diameters in
  ClassicalArithmeticCompletion, topological degree in SymplecticGeometry).
- "intersection number", "numerical equivalence", "Néron–Severi", "Hodge index", "projection
  formula", "big and nef", "Kleiman": the owners are `SchemeAndStackFoundations` on main (Layer
  5: §5.1 Chow groups, §5.2 proper pushforward and degree, §5.3 first Chern class cap product with
  commutativity and projection formula on any algebraic scheme, §5.6 intersection products on smooth
  varieties, §5.9–5.10 surface pairing, numerical equivalence and Hodge index over algebraically
  closed fields, §5.12 Bézout) and `AbundanceStatement` on main (Layer 4: curve degrees,
  `N¹(X)_ℝ`, nef cone, Kleiman's criterion, Nakai–Moishezon, over algebraically closed fields of
  characteristic zero). `MotivesAndAlgebraicCycles` (#1313) owns correspondences and numerical
  equivalence on smooth projective varieties for motives; `EquivariantIntersectionTheory` (#1685)
  owns equivariant Chow groups of quotient stacks; `AlgebraicModuliForArithmeticGeometryPartII`
  (#1754) has nef-and-big classes on special fibres over a DVR. None defines degrees of rational
  maps or the positivity theory in codimension `≥ 2` (searches for "pseudo-effective",
  "basepoint free class" and "Siu" found nothing relevant; the Siu hits are the arithmetic Siu
  inequality of ArithmeticDynamics §4.3).
- Mathlib: `AlgebraicGeometry/Birational/RationalMap.lean` (partial maps, rational maps,
  `RationalMap.domain`, `equivFunctionField`), `Birational/Dominant.lean`,
  `Birational/Composition.lean` (composition of a dominant rational map with any rational map,
  associativity), `Birational/Birational.lean`; `Analysis/Subadditive.lean`
  (`Subadditive.tendsto_lim`, Fekete's lemma); `AlgebraicGeometry/AlgebraicCycle/Basic.lean`.
  No graph of a rational map, no intersection numbers, no degree theory.
- Tau Ceti: Cartier divisors, line-bundle classes and degrees on curves; nothing on rational maps
  of higher-dimensional varieties.

Conclusion: the target is planned nowhere, continues no roadmap in its own direction (it is not a
Part II of `ArithmeticDynamics`, whose base is ℙ¹ and heights, and whose Part II is Markoff
theory), so the verdict is `design` under the suggested name, which no roadmap, pull request or
package uses (the board folder `packages/DynamicalDegreesOfRationalMaps` held only an empty
`reports` directory before this job).

## Generality

The filed statement is already general (any field, any dimension, big-and-nef classes). Three
adjustments were made in the brief:

- The carrier is an integral projective variety; normality is the hypothesis of the
  sub-multiplicativity theorem as the sources state it (Dang's Theorem 1), and a non-normal variety
  is handled by its normalization (a Check).
- The degrees are defined on the graph itself, or its normalization, using
  SchemeAndStackFoundations' cap products on possibly singular schemes, so no resolution of
  singularities is used anywhere and the roadmap is characteristic-free;
  `ResolutionOfSingularitiesCharacteristicZero` named in the issue is not a supplier.
- The topological degree is the field degree `[K(X) : f^*K(X)]`, which counts inseparable degree,
  so that the statement holds in every characteristic (Frobenius Check).

The issue's description of Dang–Favre's Theorem 2 is inaccurate: that theorem proves algebraicity
of `λ_1` for proper polynomial maps under `λ_1² > λ_2`, it does not compute `λ_k`. The brief
records this and keeps the roadmap to the definitions and basic theorems the Dang–Favre statements
need, with their Theorems 1–2 as consumers.

## Sources

All nine works were fetched through the sources service. The issue's arXiv identifier for
Dang–Favre (1905.01607) points to an unrelated computer-science paper; the correct identifier
2006.10262 was fetched and the wrong entry removed from the manifest before re-fetching under the
same key. Russakovskii–Shiffman, listed as paywalled in the issue, resolved to an open arXiv copy
(math/9604204). Lazarsfeld and Fulton resolved only to paywalled Springer pages and are recorded as
uncertified with locators; every statement cited from them is also available in
SchemeAndStackFoundations on main or restated in the certified open sources. Statements in the brief
cite the line-numbered extractions (`<source id> line N`). Nothing suspicious was found in any
fetched text.

## Risks noted for the design

The main risk is the positivity theory in codimension at least two needed for sub-multiplicativity
when `2 ≤ k ≤ d − 1` (numerical cycle classes, Siu-type inequalities, basepoint-free cones or a
Chow moving lemma, de Jong alterations), which no roadmap owns and which the design must plan in
full. The second is the descent from an algebraically closed field to an arbitrary one, which the
sources only sketch. The third is the characteristic-free proof of the Khovanskii–Teissier
inequality through alterations instead of resolutions. These are stated in the brief's Risks.
