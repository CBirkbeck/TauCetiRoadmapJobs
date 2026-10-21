# Repair report: SelmerIwasawaCohomologyPartII

## F01 (P2) — applied

Unlocalized definite-function intertwiners → intertwiners localized at mΠ, in both design files. The proof now restricts the rank comparison to Π-congruent standard pairs. Added `intertwiner_localization_required` in the README and plan, retaining both parity-dependent bad pairs and explaining the target-only constituent obstruction.

Evidence: ltxzz line 5221 states the localized maps; ltxzz line 5227 requires equal localized ranks; ltxzz line 5239 restricts the decomposition to Π-congruent pairs; ltxzz line 5242 excludes the bad pairs using P5. A constituent occurring only in the target gives a nonzero cokernel on its isotypic summand. Section 3.7 already uses localization and needs no mathematical change.

## F02 (P3) — applied

The q=2 polynomial Check → q=3 over 𝔽₁₁, with even roots {3,4} and odd roots {1,9,5}. Both design files now record the five factor evaluations and the tensor multiset {3,5,4,4,3,9}, exhibiting a double root at 3 and failure of PI7.

Evidence: ltxzz-published line 1552 requires an odd rational prime; ltxzz-published line 1553 imposes local degree one. The polynomial conditions are ltxzz line 1044 through line 1050. Direct arithmetic gives P₀(3)=0, P₀′(3)=10, P₀(−1)=9, P₁′(1)=10, P₁(−3)=1. Also 3·4=9·5=1 in 𝔽₁₁, so the required reciprocal pairing holds; 11∤3(3²−1).

## F03 (P3) — applied

Empty hypothesis arrays → one explicit sentence each in plan targets 3.7, 4.6, 7.1, 7.4 and 8.4, matching their README domains. These retain H(n₁) and genericity, compatible covers and concentration, L5-2, the two alternative families with F⁺≠ℚ, and all rank-(2,3) admissibility and span premises.

Evidence: ltxzz line 6489 through line 6506 for 3.7; ltxzz line 2488 through line 2514 and line 6767 through line 6772 for the graph and projected regulator used in 4.6; ltxzz line 918 through line 930 for 7.1; ltxzz line 6400 and line 6418 through line 6424 for 7.4; ltxzz line 1273, line 6568 and line 6773 through line 6792 for 8.4. Naturality additionally uses proper cycle pushforward and finite étale base change: the graph projects with the degree of its source cover, whereas pullback retains the full fibre product unless the stated Cartesian/component condition holds. No theorem domain was enlarged.

## F04 (P3) — applied

IG.7.2/IG.7.5/IG.7.7 and the compact-concentration claim → IG.7.2 with its actual predicate and decomposed-generic criterion. Updated the README supplier contract, three Needs lines, three layer dependency summaries, plan prerequisites and plan supplier record. The criterion retains F⁺≠ℚ and witnesses away from every prescribed finite enlargement.

Evidence: `TauCetiRoadmap/IgusaVarietiesAndTorsionConcentration/README.md`, §IG.7.2, at supplier commit `55adf550b90cc3a1981b197fd48b3a35217665cc`, explicitly treats standard indefinite signature (N−1,1) at one archimedean place. Sections IG.7.5 and IG.7.7 instead concern the signature-(n,n) setting and its Borel–Serre boundary. The package uses the former interface; it does not apply the latter statements to its varieties. Integral freeness in 3.1 still uses derived reduction as in ltxzz line 5206 through line 5208.

## Adversarial mathematics pass

The table records instance tests and hypothesis checks of the targets and their APIs. It does not discharge the supplier gaps. Existing mathematical domains and ownership remain in force except for the repairs above.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: coefficient domain, universes and finite sets | Ramified Eλ/ℚℓ; equal characteristic; zero ring; infinite exceptional set | Ramified coefficient fields are allowed; equal characteristic and the zero ring are outside the coefficient-field domain. Exceptional sets remain finite; no countability hypothesis is introduced. | None. |
| Conventions: ranks, twists and weights | n=2,3 | r₀+r₁=n; n=2 gives rank 6, twist 2, cohomology degree 3 and weight −1. | None. |
| Conventions: Frobenius, polarization and coboundary | Inert p=3; γ=(I,−1)c; sign action on ℤ | Arithmetic Frobenius on Eλ(1) is 9, inverse is 1/9; hγ=−I; d0(1) at the nontrivial element is −2. | None. |
| Conventions: reciprocal signs, Hecke factors and trace | Degrees 1,2; q=3; free C₂-orbit with coefficients 𝔽₂; q=1 | Reflection signs differ by parity; rank-2 I°=16 and (q+1)R°−I°=0; rank-3 T°=9/2 and I°=105/2. Orbit trace is 1 while total trace is 0; division by 2 is unavailable. q=1 is no residue cardinality. | None. |
| 1.5 specialInertPlace and transport/local-residue API | ℚ(i) at 2,3,5; local degree two | 3 is very special with residue size 9 in F; 2 and 5 fail; local degree two fails. Field transport preserves the CM involution and local degree. | None. |
| 1.6 rankinSelbergAdmissible and projections/invariance | n=0,1,2; ℓ=2,3,11; identity scalar; ξ=±1; basis change | Standing n≥2 and L1 exclude small cases; ℓ=11 meets L1 at n=2. Identity scalar does not satisfy L5-1's scalar branch, and ξ=±1 fails L5-2. Conjugation preserves the seven clauses. | F04 supplier reference. |
| 2.1 unitaryLevelRaisingDatum and reduction/ideal/level APIs | m=0,1,2; empty raising set; incompatible level; residual equation only | m=0 fails; empty raising set is allowed. A mod-λ root need not be a mod-λ² root. Quotient, localization and annihilator remain different; level change separately requires P6. | None. |
| 2.2 unitaryBasicCorrespondence and uniformization/base change | N=2,3; empty indexing scheme | Fibre dimensions 0,1 and codimensions 1,1 agree; empty base gives empty correspondence. The immersion remains local, with native quasi-isogeny data. | None. |
| 2.3 unitarySemistableStrata and generic-fibre/base-change API | xy=p; N=2,3; p=3 | Reduced branches have multiplicity one; in ℙ² the quartic normal O(4) has degree 16 and its dual degree −16; inverting p removes the link. Native-model comparisons remain supplier inputs. | None. |
| 2.4 unitaryLinkAndIntersection | ⌊N/2⌋−j=1; ℓ dividing p+1; C₂ orbit | Minimal index p+1 and fibre ℙ⁰; restriction isomorphism requires p+1 invertible. Orbit trace remains valid with 𝔽₂ coefficients. | None. |
| 2.5 unitaryIncidenceWeightComplex and matrix/singular APIs | Node; N=2; p=3; Frobenius 4 on ℤ₃ | Alternating restriction gives 1 and −1; odd diagonal −16, even corner 4; N=2 exceptional row/column retained. Frobenius invariants are 0 and coinvariants ℤ₃/3. Identity monodromy retains twist −1. | None. |
| 2.6 unitaryProductResolution and lifting/cycle/coefficient APIs | n=2; empty centre; exceptional ℙ¹ point | Dimension 3; exceptional degree-2 class retained; empty blowup is identity. A point on the exceptional divisor lifts without invertible inverse-image ideal, so the Cartier condition is sufficient, not necessary. | None. |
| 3.1 localizedUnitaryCohomology | Zero localization; target-only automorphic constituent; nonproper boundary | Zero maps are isomorphisms on zero localization. A constituent with source invariants 0 and target invariants nonzero obstructs unlocalized surjectivity. Residual irreducibility remains necessary for the boundary comparison used here. | F01; F04. |
| 3.2 oddTateCycleComparison | N=3; zero localization; A6.1.4 alone | Concentration/freeness uses A6.1.4; eigenvalue and coinvariant assertions additionally retain A6.1.6 and H(N). No even rigidity is imposed. | None. |
| 3.3 evenIntegralFreeness | Zero definite module; place in S_FL outside Σ⁺min | Source nonzero-module hypothesis excludes the first case. The second needs the existing old-form-dimension gap; residual concentration alone is not Hecke freeness. | None. |
| 3.4 evenFrobeniusExclusion | a=p⁻¹; p²=1 modulo λ | pa=1 is excluded; P2 excludes the root collision p²=1. Both forbidden values 1,p² remain explicit. | None. |
| 3.5 evenSingularComparison | m=1,2; quotient versus annihilator | Source is the actual quotient by nΠ; replacing it by an annihilator changes the assertion. Increasing filtration and singular comparison agree. | None. |
| 3.6 evenCongruenceGaloisRealization | μ=1,2,0 | Positive μ is required. Two copies permit a choice of coordinate, not a canonical projection; conjugation c and twist remain. | None. |
| 3.7 oddSpecialLevelChange | P empty; one special place | Empty change is identity; one-place proof uses a unit after localization and the same local constituent. | F03. |
| 4.1 diagonalUnitaryDatum and refinement API | n=2; incompatible levels; source-only degree-d refinement | Dimensions 1,2,3 give graph codimension 2; incompatible levels define no map. Refining only the source gives a commutative, non-Cartesian square for d>1. | None. |
| 4.2 diagonalGraphCycle and class/pushforward API | Zero cycle; degree-2 cover; point graph | Zero maps to zero; graph pushes to 2Δ; point Gysin class and trace equal 1. No nonzero Chow class is presumed. | None. |
| 4.3 projectedDiagonalAbelJacobi and edge/reduction API | n=2; degree-1 point on ℙ¹; reducible residual boundary | Target coefficient degree is 3, twist 2. A point on ℙ¹ cannot be sent to H¹(F,H¹)=0 as an arbitrary Abel–Jacobi construction. Rational cuspidal concentration and integral residual boundary exclusion retain distinct hypotheses. | None. |
| 4.4 rankinSelbergPurityAndSelmer | Weight formula; ℓ ramified in F versus Eλ ramified | Weight is −1 in both parities; ramification in F fails L1. Ramified Eλ remains allowed. Finite regulator input above ℓ is retained, without H(N) on Wλ. | None. |
| 4.5 diagonalMultiplicityRealization | Reducible attached representation; saturated sublattice; μ=0,2 | H(N) does not discharge a false irreducibility antecedent. L4 rules out a proper saturated invariant sublattice after scalar extension. A nonzero tuple has some nonzero coordinate; μ=0 cannot contain it. | None. |
| 4.6 diagonalRegulatorNaturality | Identity; degree 2; source-only refinement; coefficient extension | Trace scales by source degree; pullback gives the full fibre product. The chosen refined graph requires the Cartesian/component hypothesis, and scalar extension changes the actual multiplicity space. | F03. |
| 5.1 firstReciprocityDatum and extraction/pairing/reduction APIs | q=3 over 𝔽₁₁; singleton and two-point graph; zero quotient | Factor values 0,10,9,10,1 satisfy PI4/PI5; tensor root 3 is double, violating PI7. Pairings are 1 and 2 without averaging; zero quotient fails PI6. | F02. |
| 5.2 firstGeometricReciprocity | Singleton graph; degree-p+1 fibres | Positive source trace and the two legs retain multiplicities; at p=3 the squared degree factor is 16. No arithmetic rigidity hypothesis is added to the geometric identity. | None. |
| 5.3 productCohomologyConcentration | Tensor collision from 5.1; three even columns | PI7 separately excludes collisions. Tensoring the odd middle row gives the three asserted positions; freeness removes Tor terms. | None. |
| 5.4 diagonalCycleBoundaryComparison and presentation/naturality APIs | Zero cycle; O→O via π²; unipotent Frobenius over 𝔽₃ | Class of π in the cokernel has exponent 1. For F=[[1,1],[0,1]], invariants→coinvariants is zero despite both lines having dimension 1. Invariants and coinvariants cannot be interchanged. | None. |
| 5.5 firstExplicitReciprocity | p=3; one graph pair | Pairing is 4φΠ₀(I°)φΠ₁(T°); a bare graph value loses normalization. Quotients and test annihilators remain distinct. | None. |
| 5.6 firstReciprocityExponentEquality | Zero class; π-torsion; a nonunit multiplier | Zero exponent is 0; multiplying by a unit preserves exponent, while multiplying 1 in O/π² by π lowers it from 2 to 1. PI2, PI5, PI4 supply the three units separately. | None. |
| 6.1 secondReciprocityDatum and graph/reduction APIs | Two source points over one pair; m=0,1,2 | Pushed function is 2 on that pair; image-set characteristic function would give 1. m=0 fails; no PII5/PII6 or first-law rigidity is inserted. | None. |
| 6.2 secondGeometricReciprocity | Graph multiplicity; degree and twist | Two correspondence legs and T⋆ remain in degree 2r₀, twist r₀. Specialization applies to the absolute cycle class on its native smooth-model domain. | None. |
| 6.3 oddSpecialFiberCoinvariants | n₁=3; zero localization | Special-fibre concentration A7.3.2, A7.1.1 and H(n₁) remain; zero localization is harmless. Nearby-cycle concentration is not substituted for this input. | None. |
| 6.4 secondExplicitReciprocity | O/π²→O/π; zero function | Image exponent 1 is less than source exponent 2. Zero right-hand element forces zero left-hand class; equality does not follow. | None. |
| 7.1 admissibleImageLift | m=1,2; ξ=±1 | m=1 is the residual premise; lifting is through the actual finite image. ξ=±1 fails invertibility of ξ²−1. Prime-to-ℓ order and γ² remain essential to the fixed-line argument. | F03. |
| 7.2 auxiliaryPlaceDetection | c=0; 0<c<k; c≥k; D=[[π,1],[0,π]] over A₅ | C=[[π,−1],[0,π]] gives DC=CD=π²I but is not a basis matrix. Primitive t=(−1,π) kills the first row and has second exponent 3. For c≥k the zero C meets the zero lower bound. Actual Frobenius span remains a premise. | None. |
| 7.3 rankinSelbergLevelRaisingSystem and annihilator/rigidity APIs | Same D,t; perfect and π-scaled pairings; N=2,p=3 mod 11; double pair mod 19; other places above p₁; w dividing ℓ | Exponents 4,3 pair to exponent 2 over A₅, but to 1 for a π-scaled pairing. Simple Satake pair gives Frobenius {5,1}; the doubled pair fails. Other-place nonsingularity needs cycle specialization; above ℓ both arguments need the torsion crystalline condition. Bounds retain mlat, uniform c and the inverse different. | None. |
| 7.4 eventualAdmissibilityFamilies | CM or isogenous elliptic curves; absent supercuspidal component; F⁺=ℚ | These are outside the relevant family hypotheses. Eventual admissibility says all but finitely many coefficient places, not every place, and supplies no automatic uniform span. | F03; F04. |
| 8.1 rankinSelbergSelmerRankZeroOfPeriod | Zero Selmer; zero period; m growing | Zero Selmer meets conclusion; zero period supplies no finite valuation witness. For nonzero period, the contradiction uses m>m₀+c+mper+mlat+mdif, with constants independent of m. | None. |
| 8.2 rankinSelbergSelmerRankOne | AJ=0; multiplicity two; positive loss c | Nonzero AJ is necessary for this lower bound. A nonzero coordinate survives multiplicity; upper bound uses primitive kernel and total loss 2c, not a diagonalizing basis. | None. |
| 8.3 rankTheoremsTotallyRealBase | n=2,F⁺=ℚ; n≥3,F⁺=ℚ; eventual families | H(N) is discharged only on the stated small-rank or F⁺≠ℚ domain. Families do not remove the span premise; automorphic-multiplicity remains a supplier gap. | None. |
| 8.4 rankTwoThreeRankTheorems | n=2,F⁺=ℚ,ℓ=11; ℓ=2,3 | H(2),H(3) are discharged, but L1–L7, the appropriate geometric witness and uniform span remain. ℓ=2,3 fail L1; ℓ=11 alone certifies no other clause. | F03. |
| 8.5 hilbertPrecursorCompatibility | g=1,3; even g | Twist (g+1)/2 is integral on the odd-degree domain; even g is excluded. LIInd, residual dimension equality and the prime conditions remain supplier premises. The comparison does not replace the unitary singular theorem. | None. |

## Checks and maintainer notes

- Required dependency gate: exit code 0. Exact output:

```text
candidate: SelmerIwasawaCohomologyPartII is not in the merge order yet; checked as if placed after IgusaVarietiesAndTorsionConcentration (the intake inserts it when its design is accepted)
depcheck: 6 roadmaps, 58 edges, 0 problem(s)
```

- No UPWARD or CYCLE line. No order file or tooling was edited.
- JSON/TOML parsing passed: 8 layers, 40 targets, 20 gaps and 5 certified sources. The five repaired hypothesis arrays each contain one sentence. The localization statement, proof and both changed Checks agree between the plan and README. No IG.7.5/IG.7.7 reference or compact-concentration claim remains in either design file.
- Independent finite-field arithmetic passed: factor values [0,10,9,10,1], tensor multiset [3,5,4,4,3,9], multiplicity 2 at 3 (and at 4).
- Read the five legally cached source texts at the relevant locators; no additional source or missing-reference request was required. `sources.toml` is unchanged. Roadmap shape was compared with main's ComplexTori, LocalGaloisGroups and completed HodgeStructures. The named sibling packages CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ArithmeticDynamics and ErdosProgressionPowers were read for ownership boundaries; these repairs introduce no dependency on them.
- Pinned API verification used GitHub code search followed by file reads at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`: `Mathlib/Algebra/Polynomial/Eval/Defs.lean` (`Polynomial.eval`), `Mathlib/Algebra/Polynomial/Derivative.lean` (`Polynomial.derivative`), and `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean` (`TauCeti.ContCohomology.d0_apply`). The repairs introduce no polynomial evaluation/derivative API or replacement cochain carrier.
- No Lean elaboration was run: this design package contains no `Suggested.lean`, none was authorized for editing, and no Lean signature changed. The new localization Check concerns native Shimura and automorphic carriers supplied by roadmaps; it remains a README/plan Check.
- Whitespace validation with `git diff --check` passed. Machine-path scans passed. Changed tracked files are only `packages/SelmerIwasawaCohomologyPartII/design/README.md` and `packages/SelmerIwasawaCohomologyPartII/design/plan.json`, plus this required report.
- No exported target was renamed or deleted. Consumers of `localizedUnitaryCohomology` must retain mΠ-localization. The plan now records the README's existing hypotheses in the five specified targets. All 20 supplier gaps remain; no supplier obligation was invented, moved or silently discharged. There is no external decision needed to apply these four repairs. No commit or GitHub write was made.
