## F01 (P2) — applied differently

Away-from-ℓ nonsingularity alone → torsion crystalline finite localizations at every w|ℓ for both annihilators. Extended `gap:purity-crystalline-regulator` to §7.3, synchronized both rank proofs and added the ℚ₁₁ Kummer control. The definition and coefficient-map compatibility belong to base §4.8; §4.10 supplies rational comparison. Evidence: ltxzz lines 600–623, 6637–6649, 6681–6693, 6891–6910.

## F02 (P3) — applied

AG2.5 “local–global compatibility” → “Unramifiedness and the good-prime polynomial; Published RACSDC comparison specializations” in §7.3, Layer 7 dependencies and the plan prerequisite. Synchronized the supplier inventories. Both headings and their relevant normalized comparison statements were read in `TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md` at `c4cc6a16ac58b17b7da0ce4b7b9707d0fafda39f`.

## F03 (P3) — applied

§2.2 locator “pp. 38–41” → “pp. 39–41” in the README and plan; recorded the precise range in the source manifest. Evidence: ltxzz line 1782 marks page 39, before Definition 4.3.1 at ltxzz line 1788.

## Checks and evidence

The prescribed dependency command exited 0 with exactly this output:

```text
candidate: SelmerIwasawaCohomologyPartII is not in the merge order yet; checked as if placed after IgusaVarietiesAndTorsionConcentration (the intake inserts it when its design is accepted)
depcheck: 5 roadmaps, 48 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The merge order was not edited.

- JSON and TOML parsing: passed. All 40 target IDs and names are unchanged. The changed targets are §2.2 (locator), §7.3 (conclusions, geometric inputs, API, proof, prerequisites and Check), and §§8.1–8.2 (proof chains and their references). Every target, API and Check name occurs in the README; all target and gap references resolve. Section 7.3 has eight Checks, including the new `system_coefficient_place_finite`.
- Supplier contract synchronization: passed. The top-level gap has supplier `ArithmeticGaloisDuality`, its existing new-obligation section, the expanded one-sentence `needs`, and `neededBy = ["4.4", "7.3"]`. The matching `What ArithmeticGaloisDuality must provide (gap:purity-crystalline-regulator): ...` line occurs under Exact supplier contracts. Section 7.3 and Layer 7 dependencies explicitly consume that gap.
- Source verification: the five manifest sources remain certified at their legal origins. No new work, fetch, waiver or missing-reference request was necessary. Cache provenance is unchanged; `sources.toml` adds exact locators into the existing ltxzz text. F01 uses Definition 2.2.5 and Lemma 2.2.7 (ltxzz lines 600–623), L1–L2 (ltxzz lines 6370–6371), the actual quotient-to-lattice map (ltxzz lines 6681–6693) and both local pairing arguments (ltxzz lines 6646–6649, 6907–6910). F03 uses ltxzz lines 1782–1800 and 1871–1890. Additional convention/domain controls were read at ltxzz-published lines 1533–1556, ltxzz-deformation lines 1444–1456, stacks-blowup lines 3750–3765 and liu-tian lines 1496–1500.
- Supplier verification: read SelmerIwasawaCohomology §§4.8–4.11, 4.24–4.25 at `17f60560d7f66aeca01e445f995e3172473fbf0f`; PELModuli §§M2.8, M4.3 at `2d82d078308ce615a612ad359f23208a95cd4359`; ArithmeticGaloisDuality §§R02.4.2, D7.7.6 at `5b7027c11722984edb77acf2dc885be67aa4998a`; and both AG2.5 subsections identified in F02. These supply the finite-condition predicate, its coefficient-map API, smooth hyperspecial model domain, and defined Tate pairings; they do not discharge the newly expanded integral regulator obligation by themselves.
- Pinned library verification: matched the content manifest to Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searched by the continuous-cohomology, crystalline and Selmer objects, then read `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean`, `Functoriality.lean` and `Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean`, and `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean` at those commits. The first two Mathlib files give `TopRep` cohomology and compatible-pair coefficient maps; the Dedekind-domain Selmer object is a multiplicative valuation condition. Tau Ceti gives the explicit `d0`, `H1`, `H1pi` and coefficient exponent theorem. None of these declarations supplies the geometric integral crystalline regulator repaired here. A search result for the newer elliptic Selmer file was absent at the Tau Ceti pin and was not treated as a pinned supplier.
- Sibling scope and shape: read the main-branch ComplexTori, LocalGaloisGroups and PadicMeasuresIwasawaAlgebras roadmap openings and contracts; read the scope of the open ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics roadmaps at their fetched heads. Their integration, Witt, progression-power and dynamical theories do not own the torsion crystalline graph-regulator conclusion. No new sibling dependency or duplicated target was added.
- Lean agreement: this design package contains no `Suggested.lean`. Its creation or modification is outside the permitted files. The new Check uses the arithmetic finite-condition and Tate-pairing carriers supplied by roadmaps, rather than an easy existing pinned signature. No Lean declaration changed, no Lean command was run, and no elaboration or proof result is claimed.
- `git diff --check`: exited 0, with no output.
- Edit-scope and path checks: passed. Only the three permitted design/source files and this requested report changed. No machine path was added to those files. No commit, push, issue, pull-request or comment write was made.

## Adversarial mathematics pass

The table covers all 40 targets, their API and Check clauses, and the standing conventions. The instances test the mathematical statements and their hypothesis boundaries; they do not prove the proposed geometric constructions. Unchanged targets retain their stated supplier gaps.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: ranks, twist, dual, weight | n=2,3; rank zero coefficient module | Ranks 2 and 3 give tensor rank 6 and twist 2; in either parity r₀+r₁=n and total weight −1; the zero module contributes zero cohomology | None |
| Conventions: Frobenius, polarization and coboundary | Inert p=3; γ=(I,−1)c; sign action of C₂ on ℤ | Arithmetic/geometric Tate actions 9 and 1/9; GL component of γ² is −I; coboundary of 1 at the nontrivial element is −2 | None |
| Conventions: finite supports, coefficients and trace | Empty exceptional set; infinite exclusion; ramified Eλ; free two-point C₂-orbit over 𝔽₂ | Finite enlargement preserves auxiliary supply; infinite exclusion is outside the domain; ideal powers retain coefficient ramification; orbit trace 1 versus total trace 0 | None |
| Conventions: reciprocal Satake and Hecke formulas | Degrees 1,2; r=1,q=3,a=3 or 2 | Reflections have signs −,+; even I°=16 and (q+1)R°−I°=0; odd T°=9/2 and I°=105/2 | None |
| 1.5 specialInertPlace and API | ℚ(i) at 3,5,2; degree-two F⁺ completion; identity transport | 3 is very special inert with residue size 9; split 5, ramified/even 2 and wrong local degree fail; identity transport preserves the data | None |
| 1.6 rankinSelbergAdmissible and API | n=0,1,2; ℓ=2,3,11; scalar 1; ξ=±1; conjugate bases | Small n outside domain; small ℓ fail L1; identity scalar and ±1 fail the image witnesses; basis changes preserve all clauses; ℓ=11 only tests the numerical L1 bound | None |
| 2.1 unitaryLevelRaisingDatum and API | m=0,1,2; empty raising set; nonneat levels; infinite exclusion; level change | Positive m and finite support essential; residual congruence alone fails at m=2; P6 must be checked after level change | None |
| 2.2 unitaryBasicCorrespondence and API | N=2,3; empty indexing scheme; residue-field extension | Fibre dimensions 0,1 and codimension 1; empty indexing gives empty source; local immersion is not promoted to an arbitrary global embedding | Locator only, F03 |
| 2.3 unitarySemistableStrata and API | N=2 node; N=3,p=3; invert p | Special branches have multiplicity one; quartic link normals have degrees +16,−16; generic fibre is smooth | None |
| 2.4 unitaryLinkAndIntersection | Smallest relative-position fibre; ℓ divides p+1; free two-point orbit | p+1 index points and ℙ⁰ fibre; geometric counts require no inversion, but restriction comparison requires p+1 a unit; orbit trace is retained | None |
| 2.5 unitaryIncidenceWeightComplex and API | Node; N=2 exceptional matrix; p=3; Frobenius 4 on ℤ₃ | Restriction a−b; matrix scalars −16 and 4; identity monodromy has target twist −1; invariants 0 versus coinvariants ℤ/3 | None |
| 2.6 unitaryProductResolution and API | n=2; empty center; exceptional point; identity off center | Product dimension 3; exceptional ℙ¹ adds a degree-2 class; a map from an exceptional point has zero pulled-back center ideal, so unrestricted uniqueness does not follow | None |
| 3.1 localizedUnitaryCohomology | Zero localization; nonproper model; nonunit intertwiner | Zero comparison is consistent; boundary and intertwining hypotheses remain necessary | None |
| 3.2 oddTateCycleComparison | N=3; zero localization; unipotent eigenvalue-one block | Zero maps compare 0 with 0; concentration alone does not supply H(N)-dependent eigenvalues or identify arbitrary invariants with coinvariants | None |
| 3.3 evenIntegralFreeness | Zero definite localization; S_FL outside Σmin; insufficiently small level | Nonzero support and the rigid R=T hypotheses are retained; transfer outside the supplier domain uses its declared gap | None |
| 3.4 evenFrobeniusExclusion | N=2; p²=1 modulo λ; residue characteristics 2,3 | A root p⁻¹ would produce 1; the special pair is excluded from the remaining ground part; collided roots are outside P2 | None |
| 3.5 evenSingularComparison | m=1,2; zero module; quotient versus annihilator | Congruence quotient is the stated carrier; quotient, eigensubmodule and rational projection cannot be interchanged | None |
| 3.6 evenCongruenceGaloisRealization | μ=1,2; zero localization; change of multiplicity coordinate | μ≥1 uses nonzero support; conjugation c and the chosen isomorphism remain; no canonical summand follows | None |
| 3.7 oddSpecialLevelChange | P empty; one place; two distinct rational supports | Empty change is identity; successive intertwiners require a unit at each place; no even rigidity hypothesis is added | None |
| 4.1 diagonalUnitaryDatum and API | n=2,3; incompatible levels; source-only degree-2 refinement | Dimensions 1,2,3 at n=2; incompatible levels give no map; a commuting refinement square need not be Cartesian | None |
| 4.2 diagonalGraphCycle and API | Zero cycle; singleton graph; degree-2 cover | Class of zero is zero, point trace is +1, and refined graph pushes forward to 2Δ | None |
| 4.3 projectedDiagonalAbelJacobi and API | Zero cycle; n=2; degree-one point on ℙ¹; nonproper reducible residual system | Target coefficient degree is 3 with twist 2; arbitrary point classes cannot pass through a nonexistent edge; rational cuspidal and integral residual boundary hypotheses remain distinct | None |
| 4.4 rankinSelbergPurityAndSelmer | Ramified ℓ in F; ramified Eλ; bad reduction away from ℓ; H(N) absent | L1 rules out ramified coefficient places of F; it does not rule out ramified coefficient fields Eλ; membership uses actual projected cohomology and the regulator gap | Gap extended for its §7.3 consumer |
| 4.5 diagonalMultiplicityRealization | Multiplicity 0,1,2; nonzero tuple | Multiplicity zero cannot carry a nonzero regulator; a nonzero tuple has a nonzero coordinate after a chosen isomorphism | None |
| 4.6 diagonalRegulatorNaturality | Identity degree 1; degree 2; source-only refinement; zero cycle | Trace has source degree; pullback retains all components unless the graph square is Cartesian or a specified component is selected | None |
| 5.1 firstReciprocityDatum and API | n=2,3; m=1,2; singleton graph; tensor eigenvalue collision over 𝔽₁₁ | Sum pairing counts multiplicity; PI7 is independent of the factor predicates; zero support fails PI6 | None |
| 5.2 firstGeometricReciprocity | Singleton and p+1-point fibres; p=3 | Trace counts every fibre; factors (p+1)²=16 and the specified Hecke directions remain | None |
| 5.3 productCohomologyConcentration | Tensor collision; zero localization; nonproper supports | PI7 excludes collisions; freeness removes Künneth Tor terms; boundary comparison remains an input | None |
| 5.4 diagonalCycleBoundaryComparison and API | Zero cycle; differential π² and class π; reduction; unipotent block over 𝔽₃ | Cokernel class has exponent 1; boundary values commute with reduction; invariants-to-coinvariants can be zero between one-dimensional spaces | None |
| 5.5 firstExplicitReciprocity | p=3; singleton support; multiplicity two | Value is 4a₀a₁ for one graph point and doubles with multiplicity; no Hecke or degree factor is suppressed | None |
| 5.6 firstReciprocityExponentEquality | Zero class; π-torsion; nonunit p+1 | Unit multiplication preserves exponent; without all three unit arguments equality does not follow | None |
| 6.1 secondReciprocityDatum and API | m=0,1,2; two source points over one pair; altered extra labels | Zero exponent rejected; function value is 2; datum has only its five specified place clauses | None |
| 6.2 secondGeometricReciprocity | Singleton graph; fibre multiplicity two; zero cycle | Both correspondence legs and T⋆ remain; pushforward is additive and preserves multiplicities | None |
| 6.3 oddSpecialFiberCoinvariants | n₁=3; zero localization; eigenvalue-one Jordan block | Zero case consistent; weak semisimplicity is needed for the comparison; special-fibre concentration is separate from nearby concentration | None |
| 6.4 secondExplicitReciprocity | O/π²→O/π; zero function | Source exponent 2 can map to exponent 1; only the stated inequality follows; zero right side forces zero left side | None |
| 7.1 admissibleImageLift | m=1,2; ξ=±1; identity component; ℓ=2,3 | The required unit and conjugate-component witness are indispensable; admissibility excludes the small characteristics | None |
| 7.2 auxiliaryPlaceDetection | r=1,2; c=0,2,≥k; k=5; D=[[π,1],[0,π]] | Positive loss gives a submodule, not a basis; v=e₂ and t=(−1,π) give first pairing 0 and second exponent 3; zero realized span cannot detect | None |
| 7.3 annihilators, finite condition and lattice-map API | n=2,ℓ=11,m=1; zero class; ramified and unramified Eλ; rationalization of finite coefficients | Width 3≤9/2; both local finite conditions give the inverse-different bound; rationalization of a finite module is zero and cannot certify its crystalline extension | F01: state integral finite outputs, geometric origin and supplier obligation |
| 7.3 new system_coefficient_place_finite Check | K=ℚ₁₁; nonzero unramified ℤ/11 class; Kummer class of 11 | Pairing has order 11 by local reciprocity; valuation 1 excludes the Kummer class from the finite unit condition; dλ=Oλ would require zero | F01: explicit negative control |
| 7.3 rigid_of_levelRaisingSpecial | N=2,p=3 modulo 11; doubled pair at N=4 modulo 19; p in an excluded set | Simple Satake pair gives arithmetic-Frobenius pair {5,1} once; doubled roots fail derivative and rigidity; excluded place cannot be adjoined by this argument | F02: exact AG2.5 locator |
| 7.4 eventualAdmissibilityFamilies | Geometrically isogenous or CM curves; missing supercuspidal factor; F⁺=ℚ | These fail the stated family hypotheses; eventual admissibility does not assert admissibility at every prime | None |
| 8.1 rankinSelbergSelmerRankZeroOfPeriod | Zero Selmer; c=0 or positive; mdif=0 or positive; m at the threshold | Only a strict m>m₀+c+mper+mlat+mdif forces contradiction; at ℓ both arguments are finite by §7.3 and base reduction | F01: explicit coefficient-place pairing chain |
| 8.2 rankinSelbergSelmerRankOne | AJ=0; multiplicity two; positive loss; primitive kernel vector | Nonzero coordinate gives the lower bound; upper contradiction uses loss 2c and zero first-place term, with finite conditions on both arguments at ℓ | F01: explicit coefficient-place pairing chain |
| 8.3 rankTheoremsTotallyRealBase | n=2,F⁺=ℚ; n≥3,F⁺≠ℚ; missing uniform span | H(N) discharge has exactly the stated supplier domain; admissibility alone does not supply uniform span | Inherits strengthened §7.3 output |
| 8.4 rankTwoThreeRankTheorems | n=2,ℓ=11; ℓ=2,3; L6 or L7 absent | Small-rank H(N) discharge does not delete L1–L7, nonvanishing or uniform span; small coefficient primes fail L1 | Inherits strengthened §7.3 output |
| 8.5 hilbertPrecursorCompatibility | g=1,3; even g; zero localized module | Odd-degree twist is integral; even g is outside the theorem; a zero map onto zero is consistent but supplies no unitary replacement | None |

For the new local boundary Check, choose the unramified character sending arithmetic Frobenius to a generator of ℤ/11. Local reciprocity pairs it with the Kummer uniformizer to a generator of the order-11 subgroup of ℚ₁₁/ℤ₁₁, up to the fixed cup-order sign. Its order is independent of that sign. The finite Kummer condition comes from units, whose valuation is zero modulo 11. This proves the negative control without assuming that every arbitrary localization violates the bound.

For the repaired pairing chain, the factor weights after twists are [−r₀,r₀−1] and [−r₁,r₁]; their tensor interval is [−n,n−1]. Thus a=−n<0≤n−1=b and b−a=2n−1. L1 supplies both unramified F_w/ℚℓ and the half-width inequality. The inverse different dλ⁻¹/Oλ is killed by dλ, so it supplies precisely the fixed mdif needed by both contradictions. The stronger annihilation assertion in the base supplier is not needed here.

## Maintainer consequences

The implementation of the expanded ArithmeticGaloisDuality obligation is **not actionable in this package**: it must supply the integral good-smooth-reduction regulator theorem, including the nonproper projected domain and compatibility with Hecke quotients and Oλ[ΓF]-linear maps. This package declares that residual work through the existing gap; it does not assert an existing supplier target or re-plan its general theory. The source construction makes cᵢ the image of the graph regulator under the actual lattice map, so rational Selmer membership alone is insufficient for this obligation.

No target or API name cited by downstream roadmaps changed. `onePlaceAnnihilator` and `twoPlaceAnnihilator` have stronger local conclusions; §§8.1–8.4 retain their generality and use those conclusions. The only new Check name is `system_coefficient_place_finite`. No merge-order placement or scope change is requested. A fresh independent review remains necessary; these checks are not acceptance.
