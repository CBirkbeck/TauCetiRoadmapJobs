# Review of MorseNovikov (pull request #1690 at 9637d5e)

**Verdict:** needs changes

## R01 (P1) — The admitted ring and coefficient theorem imply False

**Location:** `TauCetiRoadmap/MorseNovikov/Suggested.lean:45,68`. Quote: `instance : CommRing (NovikovSeries R H N) := by sorry`.

**Claim:** these admissions consistently specify a ring and its monomials for every commutative coefficient ring.

**Witness:** negation transports the usual ring on ℤ to one with the same zero but unit −1. The two admitted monomial coefficient functions are definitionally equal; their equations force 1=−1.

This proof, appended to a scratch copy with `import Mathlib`, elaborated successfully at the pins:

```lean
namespace ReviewProbe
open TauCetiRoadmap.MorseNovikov.NovikovSeries
private abbrev negRing : CommRing ℤ := (Equiv.neg ℤ).commRing
theorem collapse : False := by
  have h : (1 : ℤ) = -1 := calc
    1 = (monomial (R := ℤ) (N := integerPeriod) 0).val.coeff 0 := by
      simpa only [ite_true] using
        (monomial_coeff (R := ℤ) (N := integerPeriod) 0 0).symm
    _ = (letI := negRing;
        (monomial (R := ℤ) (N := integerPeriod) 0).val.coeff 0) := rfl
    _ = -1 := by
      have hn := @monomial_coeff ℤ ℤ negRing _ integerPeriod 0 0
      rw [if_pos rfl] at hn
      exact hn
  exact (by decide : (1 : ℤ) ≠ -1) h
end ReviewProbe
```

**Repair:** delete the admitted ring and dependent prototypes from the acceptance file; retain the construction/API in the README and identify the missing completion ring in the docstring. An eventual construction must carry the coefficient operations explicitly. In the transported-ring test its monomial coefficient must change from 1 to −1, making the displayed `rfl` fail. Moving the admission to another data definition is not a repair.

## R02 (P1) — The build gate fails

**Location:** `TauCetiRoadmap/MorseNovikov/Suggested.lean:13,145,201`. Quote: `import TauCetiRoadmap.DifferentialGeometry.Suggested`.

**Claim:** the acceptance module builds with only `sorry` warnings.

**Witness:** direct elaboration exits 0 but reports deprecated `Set.mem_setOf_eq` at 145 and unused boundaryless/Hausdorff binders at 201. The worker reports `build=41 FAIL`, including module-system warnings from DifferentialGeometry.

**Repair:** remove the forbidden import/dependent prototypes and padding (R03/R06/R08); retained code must use the replacement API and necessary binders. Rerun the targeted gate with zero non-sorry warnings. The supplied gate prints twenty of forty-one diagnostics; I independently reproduced the direct-elaboration warnings, not its unprinted diagnostics.

## R03 (P2) — Admitted constructions replace the acceptance test

**Location:** `TauCetiRoadmap/MorseNovikov/Suggested.lean:15–21,45–461`. Quote: “`sorry` bodies denote constructions/theorems to build”.

**Claim:** the headline tests determined objects at the pins.

**Witness:** `dynamicalZeta`, `novikovTorsion`, and `completedCellularTorsion` have admitted bodies without defining equations. Assigning them zero makes the headline 0=0; on the critical-free circle the intended ζ=(1−t)⁻¹ has constant coefficient 1.

The twenty data admissions occur at 45,60,65,74,80,88,102,128,135,138,190,245,304,333,384,388,422,435,440,444. Signature checks also show `criticalIndex` lacks finite-dimensional/Hausdorff/boundaryless binders and `completedCellularTorsion` lacks compactness, finite-dimensionality, finite generation and connected-cover binders. Conversely, the local-potential index equation carries unnecessary compactness/metric binders.

**Repair:** retain only statable headlines with simple real definitions; delete admitted data and dependents. Name the unavailable completion, cutoff moduli, Novikov/cellular comparison, zeta/torsion and Euler-refinement carriers in the docstring. The circle test must distinguish coefficient-one ζ from zero. Do not copy DifferentialGeometry's admitted prototypes into this file.

## R04 (P2) — A statable Lefschetz headline is absent

**Location:** `TauCetiRoadmap/MorseNovikov/README.md:524–542`; `Suggested.lean:15–21`. Quote: “prove Lefschetz signed fixed-point counts for all iterates”.

**Claim:** statable deep endpoints occur in Suggested.

**Witness:** a scratch theorem equating signed nondegenerate fixed-point count to alternating rational singular-homology traces elaborated with only `import Mathlib`, two real definitions and one theorem `sorry`.

The definitions transport `mfderiv` along `f x=x` and take the `.hom` of the native singular-homology functor's map. The statement assumes a finite-dimensional smooth compact Hausdorff second-countable boundaryless manifold, smooth self-map and nondegenerate fixed points; it uses a finite-support fixed-point sum and traces through the manifold dimension. No completion or torsion is needed.

**Repair:** state that headline on these native carriers, retaining the explicit nondegeneracy hypothesis for signed counts. On S¹ reflection the sides are 1+1=2 and 1−(−1)=2; on nontrivial rotation they are 0 and 1−1=0. Identity in positive dimension fails nondegeneracy. Continuous-index strengthening can remain a README target until its carrier exists.

## R05 (P2) — N5 rebuilds HeegaardFloer's return germ

**Location:** `TauCetiRoadmap/MorseNovikov/README.md:324–341`. Quote: “construct the C^k scalar hitting-time branch”.

**Claim:** this roadmap owns generic return germs, section transitions, conjugacy and normal-derivative comparison.

**Witness:** main `TauCetiRoadmap/HeegaardFloer/README.md:1710–1725` owns the same hitting-time branch, reverse inverse, conjugacy, iterates and section-independent spectrum. It explicitly assigns MorseNovikov the application to −α♯.

**Repair:** import HeegaardFloer §2.8 (F0.6) by name and section; delete the generic construction target here, retaining the closed-form application and new index/zeta results. For P(x)=2x,h(x)=3x, both interfaces give hPh⁻¹=2x, derivative2 and determinant−1. This is a local ownership defect, not rejection of the folder's scope.

## R06 (P3) — Both Lean import headers violate the form

**Location:** `TauCetiRoadmap/MorseNovikov/Suggested.lean:1–13`; `AbelianCoverHomologyTargets.lean:1–2`. Quote: `import Mathlib.Data.ZMod.Basic`.

**Claim:** both files use permitted imports.

**Witness:** Suggested has ten Mathlib submodule imports, no root import, and another roadmap's module. The companion has two submodule imports. Gate: `imports=1`, `mathlib-subimports=10`, `no-import-mathlib=1`.

**Repair:** use `import Mathlib` followed only by used individual pinned Tau Ceti modules. Remove the roadmap import/dependents. Delete the coordinate-only companion under R08. The conforming Lefschetz probe elaborates at these pins.

## R07 (P3) — Replace the historical supplier link

**Location:** `TauCetiRoadmap/MorseNovikov/README.md:420`. Quote: “Consume [HeegaardFloer M.5]”.

**Claim:** the supplier citation resolves to maintained work.

**Witness:** it targets `blob/7d7fa6e8…`; gate reports `blob=1`. Main HeegaardFloer §1.5 (M.5) starts at line402 and supplies the fold/continuation interface.

**Repair:** cite HeegaardFloer §1.5 (M.5), optionally linking `../HeegaardFloer/README.md`. This resolves the same needed interface without a historical commit.

## R08 (P3) — Remove API and coordinate-test padding

**Location:** `TauCetiRoadmap/MorseNovikov/Suggested.lean:110–114,201–224,465–472`; `AbelianCoverHomologyTargets.lean:14–42`. Quote: `by simp [twoTermTorsion, ha]`.

**Claim:** the Lean files contain headlines, not API catalogues/Checks.

**Witness:** `twoTermTorsion_mul` is one `simp`; `inner_dualField` directly applies `inner_rieszDual`; `negativeDualFlow_apply` applies `toFlow_apply`. The companion only proves doubling injective and n↦(0,2n mod2) zero/noninjective.

**Repair:** delete these from `Suggested.lean` and delete the coordinate companion; keep the computations in README Checks. Remove the coefficient catalogue, unused Euler-chain/return-sign definitions and two-term boundary tests from the acceptance file. The companion correctly sends 0,1 to 0,2 upstairs and both to (0,0) downstairs, but constructs no cover. All 29 directly admitted theorems were tried with `simp` on a copy; none closed. That does not make API equations headlines.

## R09 (P3) — Restore locators, dependencies and Checks

**Location:** `TauCetiRoadmap/MorseNovikov/README.md:1–12,75–655`; both module docstrings. Quote: “representative completion, based-chain, flow and coefficient interfaces”.

**Claim:** the folder has the required roadmap/acceptance-test shape.

**Witness:** zero `*Needs:*` lines, zero `**Checks.**` lists, no source manifest, missing claim-level locators, and five companion names absent from README.

**Repair:** use the Summary/scope/conventions/contracts/build/layers form; supply per-target prerequisites/locators, prose API bullets and three discriminating Checks per definition. Match names to retained Lean declarations and record cited works in the manifest as author work. For completion, test N=0 finite support, allowed Σtᵏ for N(t)=1, and forbidden infinite ties at period1. Preserve the mathematical detail; replace “representative interfaces” by the headline/missing-carrier contract.

## R10 (P3) — Name the inverse convention relative to Milnor

**Location:** `TauCetiRoadmap/MorseNovikov/README.md:254–255,663`. Quote: “from degree 1 to degree 0 has torsion a⁻¹”.

**Claim:** the referenced torsion conventions transport without an unstated inversion.

**Witness:** ℚ —2→ ℚ has rt3 torsion1/2, but Milnor §3, printed p.365 (`milnor-whitehead-torsion line 270`), gives2.

**Repair:** explicitly choose rt3's convention and identify Milnor's as its inverse. With basis changes A₀=3,A₁=5 the new torsion is3/10=(1/2)·3/5. The README's formula is correct; this fixes its convention transport.

## Previous findings, checked individually

The previous report is for #1161 at 1c71a9c, not this PR. No repair report marking findings not actionable was supplied. Each old claim was rechecked against this head.

| Previous finding | Current passage/evidence | Disposition |
|---|---|---|
| R01 build warnings | Suggested:145 `Set.mem_setOf_eq`; :201 `inner_dualField` | Not repaired; reproduced in R02. |
| R02 twenty admitted data | Suggested:45 `instance … := by sorry`; :435 `dynamicalZeta` | Not repaired. This head has the original ring instance, not the old report's `commRingOf` repair. R01/R03. |
| R03 imports | Suggested:13 `import TauCetiRoadmap.DifferentialGeometry.Suggested` | Not repaired; companion adds two more nonconforming imports. R06. |
| R04 two True regression examples | No `example : True` in either reviewed file; gate `residue=0` | Absent/satisfied at this head; this is not evidence they were removed from this PR. No finding. |
| R05 historical supplier link | README:420 `HeegaardFloer M.5` with commit URL | Not repaired. R07. |
| R06 padding | Suggested:114 `by simp [twoTermTorsion, ha]` | Not repaired; companion adds coordinate Checks. R08. |
| R07 shape/locators/name agreement | README:654 “representative … interfaces”; no Needs/Checks lists | Not repaired. The new geometric counterexample itself is now explicit and correct. R09. |
| R08 torsion convention/unused hypotheses | README:255 `torsion a⁻¹`; :663 Milnor reference | Convention still unnamed relative to Milnor: R10. Unused metric/compactness binders remain in the checked local-index signature; included in R03's rewrite, not a separate blocking finding. |

## Verified sound

All three files were reviewed. The outside-folder diff is empty, HEAD matches the requested hash, and the worktree remains clean. The new cover passes the computed tests below; inherited defects still affect the folder verdict.

**Gate and order.** The worker's gate is:

```text
gate MorseNovikov: set_option=0 blob=1 latex=0 tex=0 prnum=0 sorry-data=20 sorry-examples=0 residue=0 private-paths=0 imports=1 mathlib-subimports=10 no-import-mathlib=1 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=41 FAIL
```

Every failing rule is covered by R02/R03/R06/R07. I ran the requested dependency check with the supplied merge order and main content:

```text
depcheck: 204 roadmaps, 1500 edges, 0 problem(s)
```

No UPWARD/CYCLE/moved lines or declared gaps. All supplier-table/prose citations were checked; no Needs lines exist. Refined N6 uses N7's Euler carrier and needs a separate edge from unrefined N6. No route shortcut, algorithmic deliverable or copied source passage was identified.

**Pins, elaboration and signature audit.** The installed git revisions match `lake-manifest.json`: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`, Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Direct `lake env lean` of Suggested exited 0 with the two non-sorry warnings in R02. A scratch copy with `#check @name` for all 85 named declarations in Suggested plus the contradiction proof exited 0; the companion's five signatures also elaborated, with no warning. Section binders were compared to the README, exposing the dropped and extra hypotheses in R03. The separate Lefschetz signature probe exited 0 with one `sorry` warning. No test establishes the truth of an admitted theorem merely by elaborating it.

**Pinned declarations opened, by object.** Library-relative paths and lines are at the pins above.

| Object | Declaration; file:line | Boundary |
|---|---|---|
| Hahn support | Mathlib `HahnSeries`; `RingTheory/HahnSeries/Basic.lean:52` | Partially well-ordered support is weaker than finite-below. |
| Laurent | Mathlib `LaurentSeries`; `RingTheory/LaurentSeries.lean:100` | Hahn series on ℤ; bounded-below support. |
| Cover | Mathlib `IsAddQuotientCoveringMap`; `Topology/Covering/Quotient.lean:26` | Orbit fibers/disjoint translates; no connectedness/nonemptiness axiom. |
| Ring transport | Mathlib `Equiv.commRing`; `Algebra/Ring/TransferInstance.lean:159` | Negation sends unit to −1. |
| Homology | Mathlib `singularHomologyFunctor`; `AlgebraicTopology/SingularHomology/Basic.lean:54` | Actual homology maps. |
| Trace | Mathlib `LinearMap.trace`; `LinearAlgebra/Trace.lean:75` | Zero outside finite-free case. |
| Euler–Poincaré | Tau Ceti `TauCeti.finsum_finrank_singularHomology_of_finite_cwComplex`; `AlgebraicTopology/Cellular/EulerCharacteristic/Singular.lean:141` | Finite CW and finite-dimensional coefficients. |
| Critical point/index | Tau Ceti `IsManifoldNondegenerateCriticalPoint`, `manifoldMorseIndex`; `Geometry/Manifold/Morse/Basic.lean:59`, `Index.lean:74` | Coordinate Hessian; geometric hypotheses separate. |
| Morse chart/field | Tau Ceti `MorseChart`, `MorseChart.field`; `Geometry/Manifold/Morse/Lemma.lean:63`, `PseudoGradient/Existence.lean:162` | Standard model, quadratic factor 1/2; not closed-form moduli. |
| Riesz | Tau Ceti `Riemannian.Tensor.rieszDual`, `inner_rieszDual`; `Geometry/Manifold/VectorBundle/Riemannian/Riesz.lean:74,82` | Fiberwise finite dimension; no compactness needed. |
| Stable sets | Tau Ceti `stableSet_eq_biUnion_orbit_localInvariantSet_Ici`; `Analysis/Calculus/Morse/LocalToGlobal.lean:187` | Vector-space flow with Lipschitz/convergence inputs. |
| Sard–Smale | Tau Ceti `isMeagre_image_criticalPoints_of_isFredholm`; `Analysis/Fredholm/SardSmale.lean:451` | Open separable Banach domain; regularity ≥(dim ker)²+1. |
| Local flow | Tau Ceti `exists_contMDiffAt_localFlow`; `Geometry/Manifold/IntegralCurve/SmoothFlow.lean:58` | Finite-dimensional/boundaryless local theorem. |

The imported DifferentialGeometry declarations were also opened in `TauCetiRoadmap/DifferentialGeometry/Suggested.lean`: `RoughForm` :529, `flowOf` :1280, `toFlow` :1396, `circleAngularForm` :1951, `mextDerivₗ` :2155, `closedForms` :2182. Several have real bodies, but `toFlow` is admitted and `mextDerivₗ` contains admitted fields. They are roadmap declarations, not pinned library imports.

**Resolved contracts and ownership.** Main is `fa41b37`. I read UniversalCovers and OrthogonalL2Bases for shape. The resolver found no missing citations; its skipped Lake-package search was supplemented by the pin audit above. Main suppliers were used rather than their open revisions.

| Roadmap | Repository-relative location read | Resolution |
|---|---|---|
| MorseTheory | `TauCetiRoadmap/MorseTheory/README.md:90,124,430,458,649` | M1–M4,M6: local theory, handles, inequalities, convergence. |
| HeegaardFloer | `TauCetiRoadmap/HeegaardFloer/README.md:216,262,284,319,349,402,1185,1690,1710` | Lane M/F0/M.5 exist; F0.6 duplicates N5 (R05). |
| DifferentialGeometry | `TauCetiRoadmap/DifferentialGeometry/README.md:268,311,341,371,503,782,816,877,910` | Named form/flow/integration/period/degree/metric layers exist. |
| AlgebraicTopology | `TauCetiRoadmap/AlgebraicTopology/README.md:289,326,471,499,512,515,849,946,1573` | AT4.2/4.3 mean Stage4 items2/3; cellular/singular comparison natural on homology, not strict chains. |
| DGFloer | `TauCetiRoadmap/DGFloer/README.md:442,453` | Layer1 item1 supplies natural π₁-abelianization/H₁ comparison. |
| UniversalCovers | `Completed/UniversalCovers/README.md:98,111,116` | Stage2 item8 supplies normal-subgroup/deck classification. |
| GeometricTopology | `TauCetiRoadmap/GeometricTopology/README.md:177,357,409,519,831,869,877,930` | Gluing, families, knots/surgery, simplex-cell boundary and triangulation suppliers exist. |
| SymplecticReidemeisterTorsionModSquares, supplied head | `TauCetiRoadmap/SymplecticReidemeisterTorsionModSquares/README.md:15` | Defers Novikov total-quotient torsion to N4. |
| AlgebraicTopologyPartII, supplied head | `TauCetiRoadmap/AlgebraicTopologyPartII/README.md:392–394` | Consumes N6 Lefschetz; not its owner. |

Object searches used `roadmaps grep` over indexed open work/main, board packages, and both pinned libraries. FukayaTheory/GromovWittenTheory/SymplecticFieldTheory/K3 hits consume these layers; no second completion owner or duplicate fully qualified declaration in another roadmap was found. This PR amends existing MorseNovikov work. Kim's cited revision was read (`kim-novikov-series line 24`, `line 32`, `line 108`): finitely many real additive-submonoid exponent coordinates differ from arbitrary abelian exponents with a noninjective period. Native group algebra, localization, homology, Morse index and Riesz objects are reused; completion and based torsion remain new constructions.

**Source sample and locators.** The brief supplies no identities or seed for its “15 targets (none found by heading)”. I independently checked these 15 groups, including every explicit rt3 lemma reference; README flags none unverified. Locators use printed pages of legal author-hosted published PDFs. N1 coefficient-ring extensions and N3 controlled chain equivalence require more than the source statements.

| # | README target | Source locator opened | Hypotheses and comparison |
|---|---|---|---|
| 1 | N1 completion | `hutchings-rt3 line 137`, §1.2, p. 211 | Abelian exponent group, real homomorphism; integral coefficients in source. Its finite-sublevel condition agrees with N=−P. General R operations require the finite-sum argument here. |
| 2 | N2 cover/period setup | `hutchings-rt3 line 133`, Choice 1.2, p. 211 | Connected abelian cover with exact pulled-back form; H₁ surjects onto the deck group. It does not assert injectivity of the upstairs H₁ map. The new Klein example is independently verified below. |
| 3 | N3 Novikov comparison | `hutchings-rt3 line 254`, equation (1.4), p. 213 | Admissible pair and chosen cover; homology of completed cellular chains. This is not itself the full chain-homotopy/control statement; that construction remains an N3 target. |
| 4 | N4 torsion/minors/components | `hutchings-rt3 line 1851`, Definition A.1/Proposition A.2, p. 239; `line 1886`, A.3/A.4, p. 240 | Finite based field complex, projection to coordinate subspace, finite-generation/abelian hypotheses for total quotients. The README preserves partial acyclicity and projections. |
| 5 | N4 basis change | `hutchings-rt3 line 1933`, Proposition A.5, p. 240 | Degree-preserving invertible change, product exponent (−1)^i; matches the two-term calculation. |
| 6 | N4/N6 cutoff continuity | `hutchings-rt3 line 681`, Lemma 2.8 and proof, p. 221 | Good parameter, fixed Euler representative; `line 706` explicitly needs invariant acyclic component set, including the limit. README supplies a limiting continuation target, rather than using continuity at a change of homology. |
| 7 | N4/N5 cover norms | `hutchings-rt3 line 1090`, Lemma 3.5, p. 227; `line 1146`, Proposition 3.6, p. 228 | Cyclic quotient; torsion-annihilation condition (3.8) is needed for the nonzero-component/torsion claim, not zeta. README retains that distinction. |
| 8 | N5 orbit finiteness/logarithm | `hutchings-rt3 line 176`, §1.3, p. 212 | Admissibility rules out both degenerate-orbit and broken-cycle accumulation. Source's tensor notation for logarithms is defective; README correctly uses Nov(ℚ,H,N). |
| 9 | N5 primitive product/iterate signs | `hutchings-lee-rt2 line 119`, equation (2), pp. 371–372; `hutchings-rt3 line 201`, (1.2), p. 212 | Source assumes oriented X and nondegenerate iterates. Its exponent omits dimension parity; an attracting surface orbit (multiplier 1/2) refutes it within that scope. README corrects it. |
| 10 | N6 main invariance/comparison | `hutchings-rt3 line 322`, Theorem A, p. 214; `line 338`, Theorem B/(1.5), p. 215 | Closed connected smooth manifold, χ=0, admissible pair, cover fixed, general real class. Equality is modulo sign/deck ambiguity; refinement retains ±1. README matches these scopes. |
| 11 | N6 self-slide proof | `hutchings-rt3 line 1282`, Lemma 3.7 proof, p. 229; `line 1289`, Lemma 3.8, p. 230; `line 1328`, Lemma 3.10, pp. 230–231 | First chain coefficient ±1, leading zeta coefficient (−1)^(i+1)a₁; higher coefficients killed by cyclic norms. Read the proof, including torsion nonvanishing. Source divisibility wording has a reversal; README uses the right direction. |
| 12 | N6 birth/death | `hutchings-rt3 line 1387`, (3.13), p. 231; `line 1416`, Proposition 3.13, p. 232 | Euclidean normalized metric, semi-isolated death; x₁²+t−t₀ component and indices i,i−1. The statement includes oriented multiply broken products; proof explicitly omits orientations at `line 1443`. Those signs are not independently certified here. |
| 13 | N6 circles | `hutchings-rt3 line 354`, Example 1.7, p. 215 | Nonzero period, universal cyclic cover; torsion/zeta exchange with unchanged product. N=0 calculation is separately checked as Laurent-polynomial homology. |
| 14 | N6 mapping torus/Lefschetz | `hutchings-rt3 line 377`, Example 1.9/(1.6), pp. 215–216 | Connected fiber, downward return monodromy, canonical Euler structure; alternating homology determinant. This identifies the intended formula, not a detailed proof of the roadmap's new Hopf/subdivision adapter. |
| 15 | N7 Euler structures | `hutchings-rt3 line 1951`, Appendix B/Definition B.1, p. 241; `line 2009`, B.3, pp. 241–242 | χ=0; affine H₁ action and field comparisons, no preferred torsor origin. Source's zero-complex basis assertion is defective; determinant volumes in README repair it. |

Additional reference checks: `hutchings-lee-rt2 line 150`, Example 1.4, p. 372 gives the zero-surgery Alexander expression (the extraction loses the fraction bar; the denominator was checked independently by the unknot chain calculation). `milnor-whitehead-torsion line 258`, §3, p. 365 supplies the alternate torsion convention, with free chain, homology and boundary modules. `hutchings-erratum-family line 23` and `line 27` give the function/metric or connection correction used in N3. The original rt1 paper was fetched and inspected for context, not used to certify a different numbering of rt2/rt3. All available PDFs/code/blog text were fetched through the source service. No manifest was edited.

**Headline audit.** N1's completion/universal property and functoriality, N2's cutoff compactification/gluing, N3's continuation/cellular equivalence/inequalities/top-degree vanishing, N4's quotient decomposition/torsion laws, N5's integral zeta product/cover norm, N6's invariance/topological comparison/mapping-torus/knot-surgery formulas, and N7's Poincaré–Hopf/Euler-refined comparison are the deep endpoints. The file instead presents API prototypes and an equality through admitted data. Genuine completion, geometric moduli, torsion and Euler-torsor carriers are missing; the docstring must name the affected headlines rather than force them through admissions. N6 Lefschetz is statable now, as the probe proves (R04). N7's nondegenerate Poincaré–Hopf formulation also merits explicit assessment using native derivatives: no statement or precise missing-carrier explanation is provided. The simple EulerChain relation does not state that theorem. Two-term computations are Checks, not replacements for N4's endpoints.

**Computed adversarial pass.** These are calculations, not proofs of general geometric theorems. “Keep” means no contradiction on these inputs; R03 marks undetermined admitted data. Local linear models test germs, not compact global manifolds. Characteristic-p tests concern algebra; `AddCommGroup` excludes nonabelian exponents, while the geometric π₁ test is nonabelian.

| Statement / definition | Instances and computed values on the two sides | Result / change |
|---|---|---|
| N1 `NovikovSeries` finite-below support | H=0: support ∅ or {0}, sizes 0/1. H=ℤ,N=id, Σₖ≥₀tᵏ: below 3 has {0,1,2}, size 3; Σₖ∈ℤtᵏ has infinitely many below 0. | First two allowed; last excluded. Keep. |
| Strict versus non-strict cutoff | Σₖ≥₀tᵏ: below 2 size 2; at most 2 size 3; below 3 size 3 bounds the latter. | Equivalent finiteness, not equal cutoff sets. Keep. |
| Lower bound and least period | Support {−2,0,3} has lower bound/minimum −2; empty support has no minimum. | Nonzero hypothesis essential. Keep. |
| Irrational period and finite ties | H=ℤ³,N(a,b,c)=a+√2b: e^(0,0,0)+e^(0,0,1) has two terms of period 0; Σₙ≥₀e^(n,n,0) has periods n(1+√2), only two below 3. Infinite kernel sum has infinitely many below 1. | Retains finite ties, rejects infinite ties. Keep. |
| `ext` | Coefficient functions δ₀ and δ₀ agree everywhere; δ₀ and δ₁ differ at 0 by 1 versus 0 over ℤ. | Equality determined by coefficients; body is elementary padding. |
| Ring instance | Negation-transported ℤ has zero 0 and one −1; ordinary ℤ has zero 0 and one 1. Admitted monomial functions coincide definitionally. | 1=−1, contradiction proved: R01. |
| `coeff_zero` | Zero series has coefficient 0 at h=0 and h=1; δ₀ has coefficient 1 at 0. | Intended 0=0, excludes δ₀ as zero; R03. |
| `coeff_add` | a=1+t,b=1−t: coefficient at 0 is 2=1+1; at 1 is 0=1−1. | Intended equation holds; R03. |
| `coeff_neg` | a=1+t: negative coefficient at 1 is −1=−a₁; over 𝔽₂ it is 1=−1. | No characteristic-zero assumption needed; R03. |
| `convolution_finite` | a=Σₖ≥₀tᵏ: pairs for coefficient 2 of a² are (0,2),(1,1),(2,0), count 3; for −1 count 0. | Both finite; R03. |
| `coeff_mul` and associativity | (1+t)(1−t)=1−t²: coefficients 1,0,−1. Three factors (1+t)³ have t² coefficient 3 under either parenthesization. | Finite convolution matches; R03. |
| Zero coefficient ring | In the zero ring every coefficient is 0; all supports ∅ and all ring equations 0=0. | Allowed algebraically; no field inference. Keep. |
| `ofGroupRing`, coefficient map | Polynomial 2e⁰+3e² maps to coefficients (2,0,3) at 0,1,2, matching Finsupp. | Intended injective map, R03. |
| Group-ring inclusion onto iff N=0 | N=0 permits only finite support, so onto. N=id admits Σₖ≥₀tᵏ outside group ring. Zero ring is onto even for N=id. | Nontrivial R is correctly required. Keep. |
| `monomial`, `monomial_coeff` | e² coefficients at 2,0 are 1,0; e²e⁻²=e⁰. | Intended unit fixed by coefficients; admitted model contradicts it, R01. |
| `monomial_add` | e²e³=e⁵; coefficients at 5 are 1 on both sides, at 4 are 0. | R03; no new headline. |
| `cutoff`, `mem_cutoff` | t²∈U₂ (all coefficients below 2 zero); t²∉U₃ (coefficient at 2 is 1). | Both directions discriminate; R03. |
| Filtration separation/completeness/density | Partial sums through n of Σtᵏ differ by first term tⁿ⁺¹; below any fixed C the tail is 0 eventually. ∩U_C excludes nonzero term t² by C=3. | Correct elementary sequence and separation test. Keep. |
| Ring continuity/cutoff bounds | t²U₃⊆U₅; (t³+t⁴)+(−t³)=t⁴∈U₃; order product 2+3=5. | Matches continuity, including cancellation increasing order. Keep. |
| Rescale/reverse N | N and 2N allow Σtᵏ. −N rejects it, accepts Σt⁻ᵏ; h↦−h exchanges them. | Positive scaling only; identity is wrong for reversal. Keep. |
| Scalar change and tensor caution | Reduction ℤ→𝔽₂ maps 2+t to t. Σtᵏ/k has unbounded rational denominators, hence is not in ℤ((t))⊗ℚ. | Coefficientwise change valid; general tensor identification rejected. |
| Period-compatible pushforward | φ:ℤ⊕C₂→ℤ, φ(n,e)=n: 1+g↦2, 1−g↦0, product 0↦0=2·0. | Finite ties add; injectivity not claimed. Keep. |
| Pushforward without finite kernel | H=ℤ²,N(a,b)=a, φ(a,b)=a: two terms at (0,0),(0,1) map to 2; each support fiber remains finite despite infinite ker φ. | Finite kernel unnecessary. Keep. |
| Pushforward identity/composition/monomials | e^(2,1)↦t²↦s⁴ for maps (a,b)↦a then a↦2a; composite gives s⁴; coefficient at 4 is 1 both ways. | Keeps units and reindexing. |
| Pushforward cutoff and grading | t²∈U₂ maps to s⁴∈U′₄ when c=2; φ kills second coordinate, so degrees b=0,1 coalesce to one exponent. | Ungraded map valid; independent grading needs stated compatibility. |
| Finite-kernel coefficient restriction | φ:ℤ⊕C₂→ℤ: φ*1=1+g, support size 2; its square is 2+2g, whereas φ*(1²)=1+g. | Support map is not a ring map; README does not claim it is. |
| Nonnegative subring/positive ideal | 1,t have orders 0,1; t(1+t) has order 1. t⁻¹ lies outside subring. | Positive ideal only inside nonnegative subring. Keep. |
| `geometricInverse` and inverse identity | (1−t)(1+t+t²+…)=1: coefficient 0 is 1, each positive coefficient 1−1=0. For h=0, 1−e⁰=0 cannot invert in ℤ. | N(h)>0 excludes wrong case; R03. |
| exp/log | exp(t)=1+t+t²/2+t³/6+…; log(1+t)=t−t²/2+t³/3+…; exp(log(1+t)) has first coefficients 1,1,0,0. | ℚ-algebra needed. Keep. |
| Filtered infinite products | Πₙ≥₁(1+tⁿ) has first coefficients 1,1,1,2; coefficient of t stabilizes at 1. Infinite copies of (1+t) give coefficient m after m factors. | Escape condition excludes the latter nonconvergent family. |
| `integerPeriod` | N(−1)=−1, N(0)=0,N(2)=2; N(1+1)=2=1+1. | Real additive convention correct. |
| `laurentEquiv`, coefficient identity | t⁻²+3+t² has coefficients 1,3,1 at −2,0,2 in both carriers, lower support bound −2. | Intended native comparison; R03. |
| Split-kernel Hahn comparison | H=ℤ²,N(a,b)=a: e^(0,0)+e^(0,1) maps to coefficient 1+u at Hahn exponent 0. Support {1−1/n} in ℝ is well ordered but infinite below 2. | Kernel coefficients retained; unrestricted Hahn carrier too large. |
| Domain theorem | Torsion-free kernel ℤ: (1+u)(1−u)=1−u²≠0 over ℤ; C₂: same expression 1−g²=0 with both factors nonzero. | Torsion-free/domain hypotheses discriminate. Keep. |
| Completed free H-set module | One orbit F(n)=−n: Σₙ≥₀[n] has finitely many terms above every threshold; changing lift 0 to 1 changes generator by t. | Potential sign and rank 1 match; empty orbit set gives rank 0. |
| Matrix extension and composition | Multiplication by 1+t sends t² to t²+t³; composing with 1−t gives t²−t⁴, same as matrix product. | Continuous finite-matrix model. Keep. |
| N2 `ClosedOneForm` | In a local plane chart, dx has dα=0; x dy has dα=dx∧dy≠0. | Closedness distinguishes; carrier is forbidden roadmap import, R03/R06. |
| `criticalSet` | Local x dx vanishes only at x=0; dx has no zero; zero form vanishes everywhere. | Correct actual-covector definition. |
| `IsMorseForm` | Potentials ±x²/2 have Hessian ±1; x³/3 has Hessian 0 at 0. In dimension 0 the 0×0 Hessian is nonsingular. | First two Morse, cubic not; rank-zero convention consistent. |
| `criticalSet_finite` | Circle cosine has two zeros of df; nonzero angular form has 0. On ℝ, cos x has infinitely many critical points. | Compactness rules out negative control. |
| Local-potential/Hessian independence | x²/2 and x²/2+7 both yield α=x dx, Hessian 1 and index 0; rescaling to −x²/2 changes α and index to 1. | Constants harmless; negative scale not silently identified. |
| `covector`, `covector_apply` | α=3dx,v=2 gives α(v)=6 and desired continuous functional 6; zero functional would give 0. | Coefficient equation excludes zero model, but data admitted: R03. |
| `dualField`, `inner_dualField` | Standard metric: dual of 3dx is 3; ⟨3,2⟩=6=α(2). Metric 4dx² gives dual 3/4 and 4·(3/4)·2=6. | Correct normalization; pairing theorem padding R08. |
| `dualField_contMDiff` | Local α=x dx gives smooth dual x with derivative 1, higher derivatives 0. Constant α gives derivative 0. | Smooth model; no compactness needed for this local property. R03. |
| `negativeDualField_contMDiff` | Same form gives −x, derivative −1; taking positive x instead has derivative +1. | Sign and C¹ target correct; R03. |
| `negativeDualFlow`, apply equation | On unit circle α=dθ gives flow θ↦θ−t; at t=0 identity, t=1 identity, t=1/4 rotation −1/4. | Downward convention fixed; apply theorem padding R08. |
| `stableSet` | Local negative gradient of x²/2 is −x: flow e⁻ᵗx tends to 0 forward for every x. | Stable germ dimension 1, not 0. |
| `unstableSet` | Same flow tends to 0 backwards only at x=0; for −x²/2 the two dimensions reverse to stable 0/unstable 1. | Index/flow convention consistent. |
| `setTangent` | x-axis in ℝ² gives span(1,0); singleton at origin gives {0}; empty set also gives {0} since no curve exists. | Submanifold comparison needs x∈S; prototype alone makes no stronger assertion. |
| `IsMorseSmale` | Saddle with stable/unstable coordinate axes: their sum is ℝ²; two coincident one-dimensional axes sum to a line, not ℝ². | Transversality distinguishes. |
| `criticalIndex`, local equation | ±x²/2 indices 0,1; adding constant 7 preserves 0. Off-critical index is not constrained by the equation. | Local values right, dropped binders/catalogue R03. |
| `criticalGenerators` | Circle cosine: one generator each at degrees 0,1; at −1 and 2 none. | Integer grading excludes natural-subtraction wraparound. |
| Loop periods and angular normalization | Positive angular loop has ∫dθ=1, reverse −1; concatenation twice has 2=1+1. DG angle form before division has 2π. | Correct 2π factor and negative-flow sign. |
| `PeriodCover`, exactness/deck law | ℝ→ℝ/ℤ, potential s, deck +1: f(s+1)=s+1=s−N(1), so N(1)=−1. Potential 2s fails dpotential for dθ. | Equations exclude scale/sign errors; additive constants remain allowed. |
| Connected integral pullback component | Circle map θ↦2θ has class 2: full pullback has two components; on either component positive deck generator shifts lifted primitive by 2. | Must choose component/divisibility; README does. |
| Nonintegral period kernel | On T², α=dx+√2dy: period (a,b)↦a+√2b injective on ℤ²; zero only at (0,0), image dense. | Universal cover exact; no discretization allowed. |
| Cover H₁ exactness | Klein C: H₁(C)=ℤ→ℤ⊕C₂ is 0; next map identity, kernel 0=image 0, cokernel 0. | Exact at base H₁, first map noninjective. |
| Klein deck action | AB(s,y)=(s+1,−y−1), BA(s,y)=(s+1,−y+1), equal modulo 2; B² shifts by 2 and is identity. | Commuting C₂ generator; correct. |
| Klein action free/proper/quotient | AⁿBᵉ fixed point implies n=0 from s-coordinate, then e=0 mod2 from y. A fundamental strip has y-period 1 after B quotient and reflected edges after A. | Free proper ℤ⊕C₂ action, quotient Klein bottle. |
| Universal abelian cover identification | Relation [a,b]=b⁻² gives commutator subgroup ⟨b²⟩; quotient has a infinite, b order2. π₁(C) generator maps to b² of infinite order. | π₁ injection true, H₁ injection false. |
| Klein period-kernel distinction | P(n,e)=n: kernel {0}⊕C₂, not 0. Minimal cover subgroup ⟨b⟩; C subgroup ⟨b²⟩. | Correct two different covers. |
| Klein completed coefficients | t=A⁻¹ has N=1; g=B has N=0. (1−g)(1+g)=0, while coefficients of each at identity are 1. | Nov=ℤ[C₂]((t)), genuine zero divisors. |
| Companion `doubling` | n=0,1,−1 gives 0,2,−2; 2(a+b)=2a+2b. | Correct coordinate homomorphism, delete padding R08. |
| Companion `fiberMap` | n=0,1,−1 all give (0,0 mod2). | Correct; not a geometric homology theorem. R08. |
| Companion `doubling_injective` | 2a=2b implies a=b over ℤ; at a=0,b=1 outputs 0≠2. | True; R08. |
| Companion `fiberMap_eq_zero` | Both coordinates are 0 for every n because 2n mod2=0. | True definition-level arithmetic; R08. |
| Companion `fiberMap_not_injective` | Inputs 0≠1 share output (0,0). | True Check; R08. |
| `CriticalLiftData` | Adjacent circle lifts q=0,p=1/2 project to their critical points; shifting q to 1 preserves projection. Orientation ± of descending line gives two choices. | Lift/orientation data genuine, not a moduli-space axiom. |
| `flipOrientation` | At chosen source sign + becomes −; at every different critical point + stays +; applying twice yields +. | Definition preserves lifts. |
| `LiftedTrajectory` | Circle cosine gradient arc has endpoints max→min and nonconstant curve; constant path would meet flow equation but fails nonconstant. | Translation must exclude constants. |
| Translation setoid | Shifts 0, s,−s and s+t realize reflexive/symmetric/transitive relations; γ(u+2) and γ(u) represent one orbit. | Relation correct, but admitted proof in a definition violates the form, R03. |
| `TrajectoryOrbit` | One translated family {γ(·+s)} gives one quotient point; two circle arcs give two distinct orbits. | Quotient has intended distinction. |
| `trajectoryOrbitFlipOrientation` | Same curve/endpoints before/after; a shift s still witnesses equivalence with identical s. | Correct map; no orientation-dependent trajectory carrier. |
| `trajectorySign` and unit theorem | Oriented interval boundary contributes +1 or −1, never 0; unordered count would give +1 for both. | Needs determinant-line construction; R03. |
| Flip-source sign | One positive trajectory changes +1 to −1; right side −(+1)=−1. | Intended sign rule holds; R03. |
| Flip-target sign | Same calculation +1→−1; flipping both yields +1. | Two flips cancel; R03. |
| `trajectoryOrbit_finite` | Adjacent exact-circle lifts have one connecting arc at each of two deck classes, zero at other classes. | Fixed-class cardinal 1 or 0; R03. |
| `signedCount` | One + orbit gives 1; a +/− pair gives 0; empty sum 0. | Cancellations retained. |
| Nonzero count implies trajectory | Count 1 entails a nonempty singleton; count 0 could mean empty or a cancelling pair. | Only stated direction is valid. |
| Potential-drop support/compactification | Circle d=1−t has two nonzero deck coefficients; below cut 0:0, cut1:1, cut2:2. A compactified oriented interval has end count +1−1=0. | Checks finite cutoff and index-two boundary sign; full analytic compactification not established by examples. |
| `novikovComplex` | Two-term circle complex: ranks (1,1), d=1−t; adjacent compositions go through zero groups and equal 0. Critical-free circle ranks all 0. | Intended d²=0; data admission R03. |
| `novikovComplexBasis` | Degree 0 and1 free module on one critical point has rank1; degree2 free module on ∅ has rank0. | Dimension agreement, R03. |
| `signedCount_finite_below` | For d=1−t, cut1/2 gives support {0}, cut2 gives {0,1}. | Finite sizes1,2; R03. |
| Differential-coefficient theorem | At h=0 coefficient is +1=count(+arc); h=1 is −1=count(−arc); h=2 both0. | Correct coefficient direction, R03. |
| Lift/orientation chain isomorphism | q′=tq changes dp=(1−t)q to t⁻¹(1−t)q′; reversing q replaces coefficient by −(1−t). | Unit/monomial changes, torsion ambiguity retained. |
| Continuation identity/inverse/composition | Constant family has chain map1, composite1·1=1; orientation change −1 composed twice gives1. | Correct test; actual cutoff homotopies remain a target. |
| Generic path qualification | Birth f_t=x³/3+tx has df=x²+t: two critical points for t<0, degenerate one at0, none for t>0; metric scaling cannot remove df(0)=d²f(0)=0 at0. | Every-time Morse requirement would fail; README excludes it. |
| Cellular completed comparison | Circle cellular differential1−t: N=id makes it a unit and H*=0, matching nonzero-period CN. N=0 gives H₀=ℤ,H₁=0. | Correct chosen-cover comparison, not H*(base)⊗Nov. |
| Controlled singular model | Lifted points at n≤0 with f(n)=n meet {f>C} in finitely many points; points at every n∈ℤ meet {f>0} infinitely often. | First support allowed, second excluded. Finite prisms preserve a bounded shift. |
| Exact specialization | N=0 forces group-ring support; exact circle d=1−t has ker0 and cokernelℤ via t↦1. | Does not reduce to base homology tensored with group ring. |
| Large-gradient route | On S¹, α=dθ,f=cos(2πθ): α+Cdf coefficient 1−2πC sin(2πθ) has two simple zeros for C>1/(2π), none for C<1/(2π). | Large C gives max/min and no nonstationary circuit; threshold is essential. |
| Novikov inequalities | Nonzero circle has b_i^Nov=0≤c_i=0 (critical-free) or1 (perturbed); zero form on a point has b₀=c₀=1. | Uses actual field dimensions; rank0 handled. |
| Top-degree vanishing | Nonzero circle H₁^Nov=0; exact circle on identity cover H₁=ℤ; closed oriented S² exact form has H₂=ℤ. | [α]≠0 is essential; theorem not extrapolated to exact forms. |
| N4 `twoTermTorsion` | Over ℚ: a=2→1/2, a=0→0; over 𝔽₂: a=1→1 and a=2=0→0. | Total inverse handles zero; Check only. |
| `twoTermTorsion_mul` | a=2 gives (1/2)·2=1; a=0 gives0≠1 and violates hypothesis. | True padding R08. |
| `BasedFiniteComplex` | Zero complex has dimensions all0 and finite support ∅; two-term complex dimensions1 at0,1 and0 otherwise. | Real bundle; excludes infinite degree support. |
| `basedDifferentialMatrix` | Standard bases and d(x)=2x give matrix[2]; new bases3 and5 give[10/3]. | Source/target order correct. |
| `basedTorsion`, zero iff homology nonzero | d=2: H₀=H₁=0,τ=1/2≠0; d=0: H₀=H₁=ℚ,τ=0; zero complex H*=0,τ=1. | Intended equivalence correct, admitted data R03. |
| `twoTermChainComplex` | Degrees1→0 differential a, every further composite0; a=0 also gives d²=0. | Native complex but construction admitted, R03. |
| `twoTermBasedComplex` | At indices−1,0,1,2 dimensions are0,1,1,0; nonzero-degree support size2. | Correct intended finite support; basis admitted. |
| `twoTermBasedComplex_matrix` | a=2 matrix entry2; a=0 entry0. | Boundary-value/API padding R08. |
| `basedTorsion_twoTerm` | a=2 gives1/2=2⁻¹; a=0 gives0=0⁻¹. | Consistent convention; padding R08. |
| Determinant-line/boundary-lift independence | d=2: choose boundary basis1, lift1/2, or boundary basis3, lift3/2; ratio gives1/2 in both cases. | Keep; Milnor's reciprocal2 must be named, R10. |
| Direct sum/scalar extension | diag(2,3) gives det6 and τ1/6=(1/2)(1/3); embedding ℚ→ℝ retains1/6. | Compatible ordered bases; keep. |
| Acyclic exact sequence/general determinant comparison | Split acyclic d=2 and3 yields1/6. For 0→ℚ[0]→(ℚ→id ℚ)→ℚ[1]→0, middle τ1 but product of zero-extended outer torsions0. | README correctly requires determinant/homology correction generally. |
| Projected-minor formula | d:ℚ→ℚ², d(1)=(1,1), next map(x,y)↦x−y: projection of d onto first coordinate is1, though image is not first axis. | Projection essential; minor determinant1. |
| Basis-change formula | d=2,A₀=3,A₁=5: new d=10/3,τ3/10=(1/2)·3/5. | Sign exponent verified. |
| Cone/simple-homotopy qualification | Two acyclic two-term complexes d=1 and d=2 are chain equivalent, but torsions1 and1/2 differ. | Cone factor cannot be discarded. |
| `TotalQuotient`, field components | ℤ[C₂] maps to ℚ×ℚ via g↦(1,−1); 1−g↦(0,2), 2↦(2,2) with inverse(1/2,1/2). | Nonzerodivisors inverted, not all nonzero elements. |
| Group-ring-to-completion quotient map | ℤ[t,t⁻¹] element1−t maps to unit with inverseΣtᵏ; no nonzero Laurent polynomial becomes0. | Correct injection; torsion components remain separate. |
| Partial acyclicity | d=1−g has rational component matrices0,2 and torsions(0,1/2), not global0. | Correct explicit README example. |
| Quotient topology/inversion | a=1,b=1+tⁿ: 1/b−1=−tⁿ+… of order n, while a→0 may have inverse order→−∞. | Inversion continuous only off0. |
| Fixed-acyclicity cutoff limit | d=1+tⁿ tends1 and torsion1/(1+tⁿ) tends1. d=tⁿ tends0 but torsion t⁻ⁿ does not tend0. | Fixed component set including limit is essential. |
| Cyclic free basis/Norm/Tr | u=t², basis(1,t): multiplication by1−t is [[1,−u],[−1,1]], norm1−u, trace2; Tr(t)=0. | Rank2 and trace2·restriction verified. |
| Norm multiplicativity/log | Norm((1−t)⁻¹)=(1−u)⁻¹; Tr log(1−t)=−Σuʲ/j=log(1−u). | Characteristic-zero log identity correct. |
| Torsion-annihilation/nonzero norm | H=C₂,K=0: Norm(1−g)=0 despite1−g≠0. For H=ℤ⊕C₂, quotient from ℤ, each g=±1 component is a field extension and norm(2)=2ᵏ≠0. | Hypothesis correctly excludes failure. |
| `torsionRel`, setoid relation | x=0 has only y=0 in orbit; x=1 relates to−t, not0. Transformations compose (−t)(−t²)=t³. | Genuine action relation intended; admitted setoid R03. |
| `TorsionValue` | Representatives1 and−t have same class;0 and1 different. | Whole-ring quotient preserves zero components. |
| Subdivision/orientation/lift torsion | Splitting a circle edge adds an elementary d=±1 pair, torsion±1; lift shift multiplies by t. | Removes only declared ±t ambiguity. |
| N5 `AllIteratesNondegenerate` | A=[2]:1−2ᵏ≠0 for k≥1; A=[−1]: k=1 determinant2 but k=2 determinant0. Empty matrix determinant1 at every k. | All iterates and dimension0 correctly distinguished. |
| `returnSign` | A=[−2]: k1 sign(3)=+1,k2 sign(−3)=−1. Positive-dimensional k0 gives sign0; empty-matrix k0 gives1. | Total-function junk values understood; periodic multiplicities positive. |
| Return germ/conjugacy | P(x)=2x,h(x)=3x: hPh⁻¹=2x; derivatives2 and2; eigenvalue test1−2=−1. | Correct but duplicated owner, R05. |
| `FlowPeriodicPoint` | Circle unit-speed flow: return times1,2,3 positive; primitive time1, multiplicities1,2,3. A zero vector field fixes every time but fails nonstationary. | Time is not integer multiplicity in general. |
| `normalSpace` | Nonzero field on surface: ℝ²/span(1,0) has dimension1; circle quotientℝ/ℝ has dimension0. At zero field dimension would remain n. | Periodic-point condition excludes wrong zero-field quotient. |
| `normalReturn`, mk equation | Derivative diag(1,2) descends modulo first axis to multiplication2; class(3,4) maps to class(3,8), represented by8. | Normal derivative equation correct; admitted R03. |
| `AllPeriodicNondegenerate` | Normal multiplier−1 passes primitive determinant2 but second iterate determinant0; multiplier2 has determinants−1,−3. | Quantification over all return times excludes resonance. |
| Local fixed-point index, including degenerate cases | g(x)=2x index−1; g(x)=−2x index+1. g(x)=x+x³ index−1; g(x)=x+x² index0 (two perturbed roots with opposite signs). | Zero determinant alone does not determine degenerate index. |
| Dimension-zero/degree normalization | Point index1; on line x−(−2x)=3x has degree+1, x−2x=−x degree−1. | Source/target orientation changes cancel. |
| Index additivity and homotopy | x−g(x)=x²−ε has two roots for ε>0, signs−1,+1, sum0; ε<0 has no roots,sum0. | Boundary-avoiding homotopy conserves total0. |
| Continuous index/partial-domain commutativity | f(x)=(x,0),g(x,y)=2x: gf=2x gives index−1; fg=diag(2,0) gives det(I−fg)=−1. | Both fixed sets{0}; different dimensions okay. |
| Iterate eigenvalue-block formula | λ=1/2: εₖ=+1; λ=2:εₖ=−1; λ=−2:ε₁=+1,ε₂=−1. A rotation π/2 has det(I−A)=2 but fourth iterate0. | Matches formula; resonance excluded. |
| Primitive product parity | Attracting surface orbit λ=1/2 gives(1−t)⁻¹; repelling λ=2 gives1−t; λ=−2 gives1+t. | README correct; rt2 printed exponent wrong in even dimension. |
| Orbit cutoff/multiplicity | One primitive orbit with N=1: cutoff3 includes multiplicities1,2, not3; log coefficients1,1/2,1/3. | Positive support finite; period0 would break it and is excluded. |
| `dynamicalZeta`, integrality/unit | Attracting primitive orbit: exp(Σtᵏ/k)=1+t+t²+…, constant1; empty orbit set exp0=1. | Zero stand-in fails constant coefficient; R03. |
| Zeta pushforward/cyclic norm | Circle double cover u=t²: Norm((1−t)⁻¹)=(1−u)⁻¹. Base double iterate has weight1/2; trace doubles it to1 for one primitive lift. | Lift multiplicities correct; no torsion-killing assumption needed. |
| Period doubling identity | (1+x)/(1−x²)=(1−x)⁻¹: first coefficients1,1,1,1 on both sides. | Algebraic Check correct. |
| N6 `novikovTorsion` | Critical-free circle complex0→τ1; two-critical circle d=1−t→τ(1−t)⁻¹. | Stand-in zero misses both; R03. |
| `completedCellularTorsion` | Circle cellular d=1−t gives class(1−t)⁻¹; zero is a different orbit class. | Definition not constrained here, R03. |
| `criticalEuler` | Circle counts(1,1) give1−1=0; sphere counts(1,0,1) give2; critical-free circle gives0. | Correct alternating formula on Morse inputs; total ncard outside finite case not a geometric count. |
| `dynamical_torsion_eq_cellular` | Critical-free circle:1·(1−t)⁻¹=(1−t)⁻¹; perturbed circle:(1−t)⁻¹·1=same. Admitted all-zero interpretation yields0=0. | Intended theorem supported, encoding defective R03. |
| Invariance versus separate invariants | Same two circle forms give τ values1 versus(1−t)⁻¹, ζ reverse values; products equal. | Requires product, not either factor alone. |
| Birth/death normalized potential | f_t=x³/3+tx−Σxⱼ²/2: at t=−ε roots±√ε; Hessian first entries±2√ε, indices i,i−1; t=+ε no roots. | Quadratic factors and negative-flow direction agree. |
| Cancellation/distinct-point slides | Opposite trajectories add1−1=0; elementary matrix I+aE₁₂ has det1, so based torsion factor1. | Zeta unchanged for distinct-point slide. |
| Self-slide conjugation/sign | Index i=1,x=1+t: torsion factor x⁻¹, required zeta factor x; b₁=a₁=1 and product1. For i=0 factors x,x⁻¹,b₁=−1. | Parity matched in both degrees. |
| Cyclic families for h=(2,1)∈ℤ⊕C₂ | d=2; μ₃(a,e)=2a mod3 gives μ₃(h)=1; ν₂(a,e)=a mod4 gives ν₂(h)=2. ν₂(nh)=0 iff2 divides n. | Surjective, kill torsion; μ₂(h)=1 impossible, correctly excluded. |
| Twisted circulant/all-order cutoff | For k=2, shift S=[[0,u],[1,0]], S²=uI, det(I−S)=1−u. Cutoff2N(h) excludes h² but includes h. | Strict cutoff separates distinct-lift slides from self-slide. |
| Higher coefficient elimination | log z=c₂h²+…; d=2,k=2 gives coefficient of h² in log Norm z equal4c₂. Vanishing gives c₂=0 overℚ. General k gives dk c_k. | Does not infer all orders from linear term alone. |
| Split summand/zero-torsion branch | Isolated p in chain has H_i containing F; hence τ=0,0·ζ₊=0·ζ₋. Conjugation preserves this summand. | Correct noncancellation branch. |
| Birth/death return-chain series | One return weight u: new paths have weights1,u,u²,… and total(1−u)⁻¹; multiplying by1−u gives1. | Algebra correct; geometric oriented gluing remains unverified below. |
| Infinitely many events/cutoff limit | Event weights tⁿ have only⌊C⌋ possible exponents below fixed C, though infinitely many globally. Tails begin at arbitrarily high order. | Cutoff finiteness does not imply global finite event list. |
| Exact versus nonexact circle homology | N=0,d=1−t: H₀=ℤ,H₁=0. N=id: d unit,H₀=H₁=0. Ordinary H₀,H₁ tensored with Nov are both Nov. | README distinction correct. |
| Smooth Lefschetz headline | Reflection S¹: two contributions+1, sum2=1−(−1). Nontrivial rotation:0 fixed points,0=1−1. Point:1=1. | Missing statable theorem R04. |
| Mapping-torus determinant | Reflection of circle has H₀ map1,H₁ map−1: ζ=(1+t)/(1−t)=1+2t+2t²+…; Lefschetz numbers odd2,even0. | Homological zeta; the raw orbit sum needs an admissible perturbation since reflection squared is identity. |
| Signed-count limitation | Identity S¹ has infinitely many fixed points and det(I−dφ)=0; Lefschetz number0 still exists. | Use local-index extension or nondegenerate count, not literal sum of signs here. |
| Hopf simplex contribution | Reflected expanding 1-cell: derivative−2, index sign3=+1; (−1)^qε=(−1)(−1)=+1. Ordinary expanding1-cell derivative2 gives−1. | Both orientation parities correct. |
| Finite simplicial chain adapter | ∂[01]=[1]−[0]; ∂[012]=[12]−[02]+[01], ∂²=0 with each vertex coefficient1−1. Degenerate edge map has image boundary0. | Alternating signs/functorial degree0 agree. |
| Subdivision/last vertex/barycenter | Subdivided interval edges sum to[0,m]+[m,1], boundary[1]−[0]. Last-vertex sends first edge to[0,1], second to0. H₀ maps1 both ways. | Sd inverse orientation and affine realization comparison agree. |
| Hopf trace/homotopy invariance | Identity on acyclic two-term ℚ→id ℚ has chain alternating trace1−1=0; homology trace0. Reflection S¹ keeps total2 under boundary-avoiding perturbation. | Chain/homology trace bridge consistent. |
| Knot zero-surgery | Unknot Δ=1 gives1/(1−t)²; symmetric trefoil Δ=t⁻¹−1+t gives that numerator/(1−t)². Reversing t multiplies symmetric ratio by t². | Correct modulo ±t^ℤ; no torsion equation assumed from Δ definition. |
| N7 `EulerChain` | Interval z=[1]−[0] has chain[01], boundary z. A single point z=[0] cannot be a boundary (augmentation1≠0). | Boundary condition genuine; χ0 needed for geometric existence. |
| `EulerChain.Rel` | Difference∂[012] is related via S=[012]; on S¹ two cycles differing by one fundamental cycle are not related since H₁=ℤ. | Boundary quotient retains torsor information. |
| Poincaré–Hopf/local index | Sphere gradient has indices+1,+1,total2=χ(S²); circle min/max gives+1,−1,total0; torus counts1,2,1 give0. | Positive dual sign(−1)^Morse index correct. |
| H₁ action/nonemptiness | Circle zero-cycle0: cycles k give Euler classes indexed byℤ; translating k by1 changes it. Sphere χ2 forbids Euler chain bounding total zero-cycle2. | Torsor has no preferred origin generally. |
| Field-comparison cocycle | Shift from ξ₀ toξ₁ by a, thenξ₁ toξ₂ by b gives a+b; inverse shift−a gives0. | Correct identity/inverse/cocycle; geometric cobordism proof not inferred from arithmetic. |
| Zero-complex determinant volume | CN=0 has one literal empty basis but determinant line Nov. Volumes at ξ₀,ξ₀+1 are1,t; torsions differ by t. | README fixes source's lost Euler data. |
| Refined action/equality | Circle τcell(ξ₀)=(1−t)⁻¹; ξ₀+1 gives t/(1−t). Same multiplier on τNov·ζ; mod±1 the two remain distinct. | Correct H₁ action; do not remove sign without a separate comparison. |

Counts: 90 named signatures inspected; 29 admitted theorems probed with `simp`; 15 source-target groups read; 166 computed rows covering headlines, declarations and mathematical findings. Admitted data are not certified implementations.

## Not verifiable

- The worker's seeded 15 target identities were not supplied. The explicit replacement sample above is reproducible, but is not claimed to recover that random draw.
- `turaev-combinatorial-torsions`, *Introduction to Combinatorial Torsions* (2001): the source service's bibliographic search found no readable legal text. The README gives no chapter/page for N4/N7. Its contents were not certified; rt3 Appendix A/B checks do not certify the entire book.
- `turaev-euler-structures`, *Euler structures, nonsingular vector fields, and Reidemeister-type torsions* (1990), pp. 627–662: source-service lookup of DOI 10.1070/IM1990v034n03ABEH000676 timed out at MathNet. No claim is made to have read its proofs.
- `pajitnov-circle-valued`, *Circle-valued Morse Theory* (2006): bibliographic source-service search found no readable legal text. No chapter locator is supplied for the stronger controlled-chain comparison. The rt3 homology isomorphism is less than a certification of that full construction.
- The full oriented birth/death gluing in rt3 Proposition 3.13 is not certified: its proof explicitly suppresses orientations. The README owns that proof obligation. Likewise, the numerical subdivision and local-index tests do not certify every step of the new global Hopf construction.
- No exact locator is supplied for the README's general nonintegral coefficient-pushforward/completion universal property, controlled singular-chain model, or all the proposed local-index extensions. Their tested formulas and ownership are recorded, but a claim-level source audit is blocked by R09's missing locators.
- The new Klein example proves the failure of injectivity independently. It does not establish which unspecified “lecture notes” in the PR description made the faulty assertion; that attribution was not verifiable from a named text.

The three unavailable works are listed together in the scratch missing-reference request. Milnor was subsequently fetched from open AMS and removed from it. This is a completed review with the stated limitations.

## Source issues

- **Error** in hutchings-rt3 at §1.3, printed p. 212 (`line 189`): the source places orbit logarithms in the rational tensor of the integral completion; it should use the completion with rational coefficients, allowing unbounded denominators; affects the proof.
- **Error** in hutchings-lee-rt2 at equation (2), printed pp. 371–372 (`line 119`): the source uses the exponent −(−1)^i₀ in every dimension; it should use −(−1)^(i₊+i₋), equivalently (−1)^(dim X−i₀); affects a stated result.
- **Misprint** in hutchings-rt3 at Lemma 3.10 proof, printed p. 231 (`line 1363`): the source reverses divisibility for the lift-index difference; it should say k divides the lift-index difference; affects the proof.
- **Error** in hutchings-rt3 at Definition B.3, printed p. 241 (`line 2014`): the source identifies the zero complex's basis classes with H₁; it should use determinant-line volumes to retain Euler normalization, since literal zero-complex bases form a singleton; affects a stated result.
- **Gap** in hutchings-rt3 at Proposition 3.13 proof, printed p. 232 (`line 1443`): the source omits orientations while asserting orientation-preserving birth/death formulas; it should justify the displayed orientation factors in the gluing argument; affects the proof.
