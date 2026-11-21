# Review of LengthBoundsInPadicFamilies (pull request #2898 at 90a0424)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LengthBoundsInPadicFamilies/`
**Verdict:** accepted

**Summary.** Accepted. All five points of the previous review are repaired, and the repairs are correct. The `Suggested.lean` docstring's account of the third headline now matches the pinned libraries. 1.8e(4) holds under its wider hypothesis on `g`: I recomputed its valuation formula in three cases, and its Check and Example now fall inside it. The multivariate Gauss lemma and the cohomology citations are sound. One format note (an over-long docstring line) does not block. The human reviewers still have to decide the scope and licence questions about the unrefereed formal proof, the most-cited source.

## N01 — One line of the `Suggested.lean` module docstring runs to 125 characters

This is line 43, in the paragraph on the third headline ("coefficient module and the cocycles of the hypothesis. The coefficients …"). The rest of the file keeps to 100 characters. Rewrapping the paragraph would fix it.

## Previous findings

- R01 — repaired: the docstring now names `Z1`, `H1`, `H1pi`, `explicitH1AddEquivContinuousCohomology`, `ofDiscreteModuleRestrictScalarsIntEquiv`, `SelmerStructure.selmerGroup` and the polynomial laws. It names as missing "its specialisation along `λ_x : A → O`" and "the coefficient module and the cocycles of the hypothesis" (lines 30–49).
- C01 — repaired: "Let `g ∈ G` with `ε(g)^i ≠ 1` for `0 < i < t`", and "`v(δ_{A′}(π′)) = Σ_{0<i<t}v(1 − ε(g)^{−i})`, which is `Σ_{0<i<t}(s₀ + v_p(i))` when `ε(g) = 1 + p^{s₀}u`" (README lines 337, 345).
- C02 — repaired: the description reads "`Suggested.lean` states two of the three headline theorems, in three declarations with `sorry` proofs".
- N01 — repaired: "`H^i` is continuous cohomology (ProfiniteCohomology Layer 1) … for the lattice coefficients of 1.8e (Col) and (3a), continuous cochains into inverse limits are those of ArithmeticGaloisDuality §R02.1.2" (line 21).
- N02 — repaired: "(Gauss's lemma in `O[X_1, …, X_m]`) … the reductions of the `G_b` modulo `ϖ` are nonzero in `k[X_1, …, X_m]`, which is a domain" (lines 117–119).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.8e(4), `v(δ_{A′}(π′)) = Σ_{0<i<t}v(1 − ε(g)^{−i})` and its `s₀` case | `p = 3`, `ε(g) = 4`, `t = 4`; `p = 2`, `ε(g) = 5`, `t = 3`; `t = 1` | `v(3)+v(15)+v(63) = 4 = (1+0)+(1+0)+(1+1)`; `v(4)+v(24) = 5 = (2+0)+(2+1)`; empty sum `0`, `E′ = e_B`, `δ = 1` | holds | none |
| 1.8e(4), hypothesis `ε(g)^i ≠ 1` for `0 < i < t` | `ε(g) = −1`, `t = 3`; `ε(g) = ζ_6 ∈ ℤ_7`, `t = 3`; `ε(g) = 1 + pu` | roots `χ, −χ, χ` collide, so excluded; `1 − ζ^{−1}`, `1 − ζ^{−2}` units, `v_δ = 0`; never a root of unity, so admitted | exactly the distinctness of the `χ_c(g)` the route uses | none |
| 1.8e Check and Example on (4) | `p = 7`, `t = 2`, `ε(g) = 1 + 7u`; `p = 7`, `t = 3`, `ε̄(g) = 3`; `p = t = 3`, `ε̄(G) ⊆ 𝔽_3^×` | `v_δ = 1`; `1 − 5 = −4`, `1 − 4 = −3` mod 7, units, `v_δ = 0`; `i = 2`: `1 − ε(g)^{−2} ≡ 0`, non-unit | all inside (4) now | none |
| 1.8b route, Gauss's lemma in `O[X_1, …, X_m]` | `F_1 = ϖ(X_1+X_2)`, `F_2 = ϖ²X_1X_2`; `F_1 = X_1+ϖX_2`, `F_2 = X_1−ϖX_2`; `R_b` not of full rank | `c_1c_2 = ϖ³` = coefficient of `X_1²X_2`; coefficient of `X_1²` is `1`; `det ψ_b(Θ) = 0` always, right side infinite | holds | none |
| Cohomology citations (Conventions, 1.8d *Needs*, supplier contracts) | ProfiniteCohomology Layer 1, §§1.4–1.5, §3.2 and ArithmeticGaloisDuality §R02.1.2, on main | §1.4 `map φ f n`; §1.5 restriction for `S ≤ G`; §3.2 comparisons in degrees `1`, `2`; §R02.1.2 inverse limits, compact coefficients | each says what is cited | none |
| Headline 3, the `Suggested.lean` docstring | every declaration it names, opened at the pins; search for a base change of polynomial laws | every name found (lines below); no law over `S` built from a law over `R` in Mathlib or Tau Ceti | docstring true | none |
| 1.8e(4) against its consumer | CongruenceModulesOfThetaLifts §7.7a (open head): unit case, `χ_cyc(g)` a generator modulo `ℓ`, `ℓ > t + 1` | the factors `1 − χ_cyc(g)^{−i}`, `0 < i < t`, are units and `χ_cyc(g)^i ≠ 1`, so (4) now applies | consistent | none |

The rows for 1.7a, the statement of 1.8b, 1.8c, 1.8d and 1.8e(1)–(3a) stand as in the previous review, of `f59066d`. The three Lean statements are unchanged.

- Source locators checked against the text: none new. The changed passages cite only [FormalProof], which could not be read. [Ribet76] and [BC09] for the unit case of (4) are unchanged.
- Library declarations opened at the pins, Mathlib (6): `continuousCohomology` (`RepresentationTheory/Homological/ContCohomology/Basic.lean:131`), `ContinuousCohomology.map` (`ContCohomology/Functoriality.lean:148`), `TopRep` (`RepresentationTheory/Continuous/TopRep.lean:31`), `MvPolynomial.map` and `MvPolynomial.coeff_map` (by `#check`), and the `IsDomain (MvPolynomial σ R)` instance (`Algebra/MvPolynomial/Basic.lean:201`). The polynomial-law directory holds only `RingTheory/PolynomialLaw/Basic.lean`.
- Library declarations opened at the pins, Tau Ceti (10): `TauCeti.ContCohomology.Z1`, `H1`, `H1pi` (`ContCohomology/LowDegree.lean:506, 829, 834`), `explicitH1AddEquivContinuousCohomology` (`CohomologyComparison.lean:145`), `ofDiscreteModuleRestrictScalarsIntEquiv` (`RestrictScalars.lean:656`), `SelmerStructure` and `selmerGroup` (`SelmerStructure.lean:69, 97`), `TauCeti.ofDiscreteModule` (`SmoothDiscrete/Basic.lean:223`, discreteness and action as instances), `PolynomialLaw.IsMultiplicative` (`RingTheory/PolynomialLaw/Multiplicative.lean:71`), `PolynomialLaw.IsHomogeneousOfDegree` (`Homogeneous.lean:73`).
- Cross-roadmap citations resolved (10): on main, ProfiniteCohomology Layers 1, 2, §§1.4, 1.5, 3.2 and ArithmeticGaloisDuality §§R02.1.2, R02.4.2; at open heads, SelmerLengthBoundsAndLocalLifting §§4.10b–4.10f and CongruenceModulesOfThetaLifts §7.7a. All exist and say what is cited.
- Dependency check: `depcheck: 171 roadmaps, 1992 edges, 0 problem(s)`, so there is no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: three `sorry` warnings and nothing else. The Lean statements did not change, so the earlier `#check` comparison and one-tactic probe stand.
- Automatic checks: all passed at this head. My own run flagged two items, set aside below. Nothing changes outside the folder.
- Overlap check: read CongruenceModulesOfThetaLifts, SelmerLengthBoundsAndLocalLifting, HeckeIdealsAndTaylorWilesRelations, UniformWildKernelBounds, WachLatticesOverTheCyclotomicTower (open), and PadicFamilies, IntegralHeckeAndGaloisDeterminants, EulerSystemsAndKolyvaginSystems (main). Nothing is shared. The change adds no owned object; continuous cohomology with discrete coefficients is now cited to its owner, ProfiniteCohomology Layer 1.

Source independence: changed passages only. I compared 9 changed passages: the Conventions sentence, the 1.8b route, the 1.8d *Needs*, the statement and route of 1.8e(4), its Check and Example, the Dependencies, the Scope, the supplier contracts and the `Suggested.lean` docstring. Their only cited source, [FormalProof], could not be read, so no source text was available. They are the author's computations and citations of roadmaps and libraries, and none follows the wording of Hida, BC09 or the announcement. Largest share: [FormalProof], 4 of 9 locators, as before. No layer was added, removed or reordered, so the arrangement was not compared again.

Research link: 1.7a extends Hida's congruence modules of Hecke algebras (Hida 1986, §§0 and 6). 1.8c–1.8e put Ribet's construction of unramified extensions (Ribet 1976) into length form, using the generalized matrix algebras and reducibility loci of Bellaïche–Chenevier (2009, Chapter 1). The bounds feed CongruenceModulesOfThetaLifts within the family built on Alpöge's announced formal proof (2026). This rests on the README and the sources read in the previous review.

## Not verifiable

- [FormalProof] (Lean repository): the sources service has no licence class for the GitHub host. Its support for the changed statements 1.8b, 1.8d and 1.8e(4) is unchecked.
- [Ribet76] §§2–4: the EuDML record points to a GDZ viewer page from which the service extracted no text (unchanged).

Automatic checks set aside as false positives: the dependency check reported that this roadmap is not yet in the merge order, but a roadmap the order does not list is placed after its last supplier. The check for changes outside the folder reported the three family-index files directly under `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/`, which are this pull request's own.

## Source issues

- none

## For the human reviewers

- Scope: the most-cited source of this roadmap, [FormalProof] (README References, line 480), is an unrefereed Lean formalization of the Riemann hypothesis announced on 20 November 2026. Its own targets rest on refereed work (Hida 1986, Ribet 1976, Bellaïche–Chenevier 2009).
- Not tested: [FormalProof], the source with the largest share of locators (4 of 9), could not be read. Wording and arrangement were not compared with it.
- Licence: the licence of the formal-proof repository was not read; the sources service has no licence class for its host.
