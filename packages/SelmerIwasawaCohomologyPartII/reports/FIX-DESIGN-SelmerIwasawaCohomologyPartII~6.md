# Design repair: SelmerIwasawaCohomologyPartII

## F01 (P2) — applied

§4.5: H(n),H(n+1) alone → those hypotheses plus absolute irreducibility of both attached Galois representations over ℚℓbar. Synchronized the statement, hypotheses, proof and negative-control Check in README and plan; §8.2 explicitly uses L4. Sections 4.3–4.4 and rank endpoint statements are unchanged. Evidence: ltxzz lines 1208, 1263–1272, 6373–6374 and 6805–6819.

## F02 (P2) — applied

Duplicate `rigidity` gap → LocalGaloisDeformationRings §§1.6, 2.3, 2.12, 2.20 and its named `IsRigidFor` API. Updated both supplier inventories, uses and layer dependencies. `rigid_of_levelRaisingSpecial` imports `IsRigidFor.mono`, retaining the Satake specialization and all numerical Checks. Fixed similitude, Fontaine–Laffaille, eigenpair and supplier coefficient hypotheses remain explicit. Evidence: supplier §2.20; ltxzz lines 5623–5632 and 5660–5661.

## Verification and checks

The legally cached arXiv v3 source defines H(N) as an implication, with Galois irreducibility in its antecedent (ltxzz lines 1259–1272). Proposition 3.2.4 supplies semisimplicity, not that antecedent (ltxzz lines 1204–1217). The two hypotheses now stated in §4.5 activate both implications. The negative control is conditional: it does not assert the existence of a reducible attached representation in this automorphic class.

L4 suffices for the endpoints: any proper invariant subspace over ℚℓbar is defined over a finite coefficient extension. Intersecting it with the extended stable lattice gives a nonzero proper saturated invariant sublattice. Its reduction injects as a nonzero proper residual subrepresentation, contradicting residual absolute irreducibility. L4 is exactly the two-factor condition at ltxzz lines 6373–6374, also ltxzz-published lines 7351–7352. Thus neither the rank-one endpoint nor the general rational regulator and Selmer-membership domains acquire a new restriction.

Read `TauCetiRoadmap/LocalGaloisDeformationRings/README.md` at independently verified open head `e18984688bc762ca5115bbabd7696f50a29e7cf6`: §§1.6, 2.3, 2.12 and 2.20, particularly lines 2114–2136. This is an eligible new-roadmap addition, absent from content main, with no deleted files or revision of an existing main-branch roadmap. Section 2.20 explicitly provides the predicate, its four projections and `IsRigidFor.mono`. Section 2.12 has the precise pair {q^(−N),q^(−N+2)} and fixed multiplier. Their coefficient restriction ℓ≥N is explicit in the specialization; L1 implies it for both ranks, so endpoint domains are unchanged. No supplier edit or merge-order decision is required.

The Satake specialization uses ltxzz Definition 3.1.5 and Remark 3.1.6, lines 1044–1057, and local–global compatibility at lines 1204–1217. The map a↦p^(1−N)a⁻¹ sends the simple pair {p,p⁻¹} to {p^(−N),p^(−N+2)}. Its roots are distinct under ℓ∤p(p²−1). Generic rigidity enlargement remains wholly with the supplier.

Read the main-branch LocalGaloisGroups and ComplexTori roadmaps for shape. Checked the scope and ownership of the five specified open siblings: CohomologyComparisonsPartII (`dd8d7e6fda7516b9ab6806d5d75f5202332851c7`), ColemanIntegrationPartII (`bd972d91ed7d5d8bd3dd2e7ee84b35853db32ba4`), QWittVectors (`4605fbb0a2d9279b561f9467ab5cce09d7f2469e`), ErdosProgressionPowers (`72b615703f7fc5d175e519ddbb6e589d3d744c6c`) and ArithmeticDynamics (`85e78c07dcc361ead6505c970a1181deee483819`). None supplies the two-factor automorphic multiplicity assertion or the polarized rigidity predicate. No new sibling dependency was introduced.

Checked the library pins against the content manifest. GitHub object searches for `IsRigidFor` and Fontaine–Laffaille returned no matches in Mathlib or Tau Ceti; these searches alone are not evidence of absence at a pin. Read the pinned `Polynomial.reflect` and `Polynomial.coeff_reflect` in `Mathlib/Algebra/Polynomial/Reverse.lean` at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, and the actual `TauCeti.ContCohomology.d0` declaration in `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean` at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These are the polynomial and sign carriers used by the boundary checks; no replacement carrier or new Lean declaration is introduced.

Checks completed:

- Dependency gate: exit 0, with the exact output below; no UPWARD or CYCLE line.
- README/JSON consistency: exit 0. Eight layers, 40 unchanged target names, 46 API entries and 67 target Checks are represented. Changed statements and proofs agree. All local prerequisite references point backwards, every gap reference resolves, and definitions/constructions retain at least three Checks.
- Preservation: exit 0. Targets 4.3–4.4, rank endpoint statements, consumers, pinned baselines and every gap other than `rigidity` are unchanged. No new theorem target or renamed public target.
- Arithmetic checks: exit 0. For N=2,p=3 modulo 11, P′(3)=−1 and Frobenius pair {5,1}. For N=4,p=3 modulo 19, the repeated Satake pair produces {4,17} twice and P′(3)=0. Existing `rigid_special_simple_pair`, `rigid_special_double_pair` and `rigid_special_excluded_place` remain intact.
- Source manifest: exit 0. TOML parses with the same five certified entries; all necessary texts were available legally. No source fetch, manifest amendment or missing-reference request was needed.
- Whitespace: `git diff --check` exits 0.
- Lean elaboration: not run. This design package has no `Suggested.lean`, no Lean file was authorized for editing, and the brief specifies no permitted Lean command. The new negative control concerns the unformalized automorphic multiplicity interface and remains a README/plan Check.

```text
candidate: SelmerIwasawaCohomologyPartII is not in the merge order yet; checked as if placed after IgusaVarietiesAndTorsionConcentration (the intake inserts it when its design is accepted)
depcheck: 6 roadmaps, 58 edges, 0 problem(s)
```

## Adversarial mathematics pass

Each target row includes its subsidiary API and Checks. “Unchanged” records the result of testing the stated domains and mathematical boundary cases; it does not claim implementation or proof of supplier gaps.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: ranks, twists, weights and shifts | n=2,3; zero module; codimension n | r₀+r₁=n; at n=2 tensor rank 6, twist 2, weight −1 and coefficient degree 3. Zero coefficients give zero groups. | Unchanged. |
| Conventions: Frobenius, polarization and differential | Inert p=3; γ=(I,−1)c; C₂ sign action on ℤ | Tate actions 9 and 1/9; GL component of γ² is −I; d0(1) at the nonidentity element is −2. | Unchanged. |
| Conventions: coefficients, torus trace and topology | Ramified Eλ; zero ring; equal-characteristic DVR; free two-point orbit over 𝔽₂ | Ideal powers retain ramification. Zero/equal-characteristic rings are outside the coefficient domain. Orbit trace is 1 on (1,1), total trace 0. Non-discrete adic comparison remains a contract. | Unchanged. |
| Conventions: Satake and Hecke normalization | Degrees 1,2; r=1,q=3; q=1 | Reflection signs −,+; even I°=16, (q+1)R°−I°=0; odd T°=9/2, I°=105/2. q=1 is outside the residue-cardinality domain. | Unchanged. |
| 1.5 `specialInertPlace` | ℚ(i) at 3,5,2; residue degree 2; identity transport | Only 3 passes these inert-place tests, with residue size 9. Degree 2 fails. The published reflexive closure uses an intersection (ltxzz-published line 1542). | Unchanged. |
| 1.6 `rankinSelbergAdmissible` | n=0,1,2; ℓ=2,3,11; identity scalar; ξ=±1; conjugate bases | Small n and ℓ excluded; identity and ±1 do not supply image witnesses. L4 activates both H(N) antecedents; L1 exceeds the rigidity supplier rank bound. | Import supplier rigidity API; no clause changed. |
| 2.1 `unitaryLevelRaisingDatum` | m=0,1,2; empty raising set; infinite exclusions; nonneat level | m=0, infinite exclusions and nonneat levels fail. Residual specialness need not lift modulo λ². Empty raising set is permitted; changed levels require P6. | Unchanged. |
| 2.2 `unitaryBasicCorrespondence` | N=2,3; empty index scheme; residue extension | Fibre dimensions 0,1 and codimension 1; empty source remains empty. Local immersion does not become an arbitrary global embedding. | Unchanged. |
| 2.3 `unitarySemistableStrata` | xy=p; N=3,p=3; invert p | Multiplicity-one branches; normal degrees +16 and −16 on the quartic link. Generic fibre is smooth. | Unchanged. |
| 2.4 `unitaryLinkAndIntersection` | Minimal link fibre; ℓ dividing p+1; two-point orbit | p+1 indices and ℙ⁰ fibres. Geometric counts survive; the stated restriction isomorphism requires p+1 invertible. Orbit trace uses no averaging. | Unchanged. |
| 2.5 `unitaryIncidenceWeightComplex` | Node; N=2; p=3; Frobenius 4 on ℤ₃ | Alternating map a−b; entries −16 and 4; monodromy twist −1. Invariants 0 differ from coinvariants ℤ/3. | Unchanged. |
| 2.6 `unitaryProductResolution` | n=2; empty center; exceptional point; off-center identity | Dimension 3 and exceptional degree-2 class retained. Empty center gives identity. An exceptional point pulls the center back to the noninvertible zero ideal, so the Cartier universal property is only sufficient. | Unchanged. |
| 3.1 `localizedUnitaryCohomology` | Zero localization; nonproper model; nonunit intertwiner | Zero comparison is consistent. Ordinary/compact equality needs boundary localization; a nonunit does not prove an integral isomorphism. | Unchanged. |
| 3.2 `oddTateCycleComparison` | A6.1.4 alone; zero localization; eigenvalue-one Jordan block | Concentration alone supplies neither the eigenvalue assertion nor coinvariant identification; residual irreducibility activates H(N). Jordan blocks test weak semisimplicity. | Unchanged. |
| 3.3 `evenIntegralFreeness` | N=2; zero definite module; exceptional transferable level | Nonzero support and rigid R=T remain necessary. Levels beyond the transfer supplier domain consume the existing gap. | Unchanged. |
| 3.4 `evenFrobeniusExclusion` | N=2; root p⁻¹; p²=1 modulo λ | The simple raising pair is removed by the stated comparison; P2 excludes collision of 1 and p². | Unchanged. |
| 3.5 `evenSingularComparison` | m=1,2; zero module; quotient versus annihilator | Congruence quotient is retained; replacing it with the annihilator changes the carrier. Zero case is consistent. | Unchanged. |
| 3.6 `evenCongruenceGaloisRealization` | Multiplicity 0,1,2; conjugation; changed coordinates | Nonzero support forces positive multiplicity. Residual irreducibility supplies the lattice and H(N) antecedent; conjugation and choice of coordinate remain visible. | Unchanged. |
| 3.7 `oddSpecialLevelChange` | Empty raising set; one place; disjoint rational supports | Empty change is identity; local changes retain intertwining and cohomological genericity. Even rigidity is not added. | Unchanged. |
| 4.1 `diagonalUnitaryDatum` | n=2; incompatible levels; identity transport; source-only degree-2 refinement | Dimensions 1,2,3; incompatible levels give no map. Source-only refinement commutes but is not Cartesian. | Unchanged. |
| 4.2 `diagonalGraphCycle` | Zero cycle; degree-2 cover; point graph | Zero remains zero; pushforward is 2Δ; point class and trace are +1. Graph codimension is n. | Unchanged. |
| 4.3 `projectedDiagonalAbelJacobi` | n=2; zero cycle; ℙ¹ point; nonproper reducible residual system | Target uses H³ with twist 2. A nontrivial ℙ¹ point class has no arbitrary H¹ edge regulator. Rational cuspidal concentration and integral residual boundary contracts remain distinct. | Unchanged; no new irreducibility hypothesis. |
| 4.4 `rankinSelbergPurityAndSelmer` | Bad places away from ℓ; ramified Eλ; ℓ ramified in F | Weight −1 and the stated crystalline regulator domain are retained. Ramification in F violates L1; coefficient ramification alone does not. | Unchanged; no H(N) or residual hypothesis added. |
| 4.5 `diagonalMultiplicityRealization` | Reducible attached representation; residual absolute irreducibility; multiplicity 0,1,2 | Conditional H(N) supplies no identification in the reducible case. L4 rules that case out by saturated lattice reduction. A nonzero tuple has a nonzero chosen coordinate. | Add both absolute-irreducibility hypotheses and negative control. |
| 4.6 `diagonalRegulatorNaturality` | Identity; degree-2 cover; zero cycle; non-Cartesian square | Trace has source degree. Pullback retains every component and multiplicity; the refined graph requires the specified Cartesian/component identification. | Unchanged. |
| 5.1 `firstReciprocityDatum` | n=2; m=1,2; empty localization; tensor collision over 𝔽₁₁ | Nonzero support is required. With even roots {2,6}, odd roots {1,4,3}, eigenvalue 2 occurs twice in the tensor, so PI7 cannot follow from factor genericity. | Unchanged. |
| 5.2 `firstGeometricReciprocity` | Singleton graph; two-point fibre; p=3 | Multiplicities are 1 and 2; the coefficient (p+1)² is 16. Transpose Hecke directions and positive trace remain. | Unchanged. |
| 5.3 `productCohomologyConcentration` | Tensor collision; zero terms; nonproper strata | PI7 excludes the unwanted product eigenvalues; freeness removes Tor. Support comparison remains an explicit hypothesis. | Unchanged. |
| 5.4 `diagonalCycleBoundaryComparison` | Zero cycle; differential π²; reduction modulo π; Jordan Frobenius over 𝔽₃ | Class π in O/π² has exponent 1. The Jordan invariants-to-coinvariants map is zero, so the potential map cannot interchange those spaces. | Unchanged. |
| 5.5 `firstExplicitReciprocity` | p=3; singleton test; quotient versus annihilator | Value is 4φΠ₀(I°)φΠ₁(T°), retaining the precise Hecke factors and target quotient. | Unchanged. |
| 5.6 `firstReciprocityExponentEquality` | Zero class; π-torsion; nonunit scalar | Equality uses all three unit proofs; multiplication by π can lower exponent and cannot replace them. | Unchanged. |
| 6.1 `secondReciprocityDatum` | m=0,1,2; two-to-one correspondence; absent extra labels | m=0 fails and residual equations do not imply λ² equations. Pushforward counts 2. No intertwining/rigidity field is added to the datum. | Unchanged. |
| 6.2 `secondGeometricReciprocity` | Zero cycle; singleton; two-point fibre | Both legs and T⋆ remain in the equality; fibre multiplicity is counted. No unnecessary automorphic rigidity condition enters the geometric identity. | Unchanged. |
| 6.3 `oddSpecialFiberCoinvariants` | Odd rank 3; zero localization; special fibre versus nearby cycles | Zero comparison is consistent; A7.1.1 activates H(n₁). The carrier is special-fibre cohomology, with its separate concentration premise. | Unchanged. |
| 6.4 `secondExplicitReciprocity` | O/π²→O/π; zero source function | Image exponent 1 can be smaller than source exponent 2; zero source forces zero image. No equality or singular-regulator identification is inferred. | Unchanged. |
| 7.1 `admissibleImageLift` | m=1,2; ξ=±1; ℓ=2,3 | Prime-to-ℓ lifting retains the simple fixed line and γ². ±1 and small ℓ are excluded by admissibility. | Unchanged. |
| 7.2 `auxiliaryPlaceDetection` | r=1,2; c=0, 0<c<k, c≥k; D=[[π,1],[0,π]] | With C=[[π,−1],[0,π]], DC=CD=π²I. Its columns need not be a basis. For v=e₂, t=(−1,π) kills the first row and has second exponent 3 in A₅. | Unchanged. |
| 7.3 `rankinSelbergLevelRaisingSystem`, including `rigid_of_levelRaisingSpecial` | Empty vertex; simple N=2 pair mod 11; repeated N=4 pair mod 19; excluded places; p²=1 | Simple pair {5,1} passes; repeated {4,17} fails; collisions and minimal/ℓ-adic places cannot be added by this inference. Fixed similitude and regular Fontaine–Laffaille clauses survive via supplier projections. | Replace duplicate gap by `IsRigidFor.mono`; retain Satake computation and numerical Checks. |
| 7.3 local finiteness and pairings | Other places above detecting rational prime; ℚ₁₁ uniformizer Kummer class; ramified coefficients; zero pairing argument | Extending-cycle specialization is needed away from ℓ. At ℓ both arguments must be finite; the uniformizer class paired with an unramified ℤ/11 character has order 11. Perfect rank-one pairing exponent is max(0,a+b−m); the inverse-different loss persists. | Unchanged. |
| 7.4 `eventualAdmissibilityFamilies` | Geometrically isogenous or CM elliptic factors; absent supercuspidality; small coefficient primes | These fail the relevant family hypotheses. Eventual rigidity and image independence remain separate contracts, not conclusions for every pair. | Unchanged. |
| 8.1 `rankinSelbergSelmerRankZeroOfPeriod` | Zero Selmer; zero period; unbounded m; F⁺=ℚ | Nonzero period and uniform span are required; fixed losses permit the large-m contradiction. Conditional rational-base case remains included. | Unchanged. |
| 8.2 `rankinSelbergSelmerRankOne` | AJ=0; multiplicity 2; positive detection loss; ramified coefficients | Zero AJ supplies no lower bound. L4 activates repaired §4.5. Primitive-kernel detection retains total loss 2c and the crystalline different bound. | Make the existing L4 use explicit in the proof. |
| 8.3 `rankTheoremsTotallyRealBase` | n=2,F⁺=ℚ; n≥3,F⁺≠ℚ; absence of uniform span | H(N) removal follows the specified source domain; it does not remove its irreducibility antecedent or the independent span premise. | Unchanged. |
| 8.4 `rankTwoThreeRankTheorems` | n=2,F⁺=ℚ,ℓ=11; ℓ=2,3 | ℓ=11 meets only the numerical L1 range. L2–L7, period/regulator and uniform span remain; L4 discharges both H(N) antecedents. | Unchanged. |
| 8.5 `hilbertPrecursorCompatibility` | g=1,3; even g; missing LIInd or dimension equality | Odd degree and both residual conditions remain indispensable; this is the native unramified precursor comparison, not a replacement for the unitary theorem. | Unchanged. |

## Maintainer notes

Only `packages/SelmerIwasawaCohomologyPartII/design/README.md`, `packages/SelmerIwasawaCohomologyPartII/design/plan.json` and this requested report changed. The manifest is unchanged. No commit, push, pull-request edit, source copy or change outside the permitted scope was made.

Public target names are unchanged. Consumers of `diagonalMultiplicityRealization` must supply both absolute-irreducibility hypotheses; admissible consumers already have L4. The removed `gap:rigidity` is replaced by the existing supplier contract, with no new obligation on LocalGaloisDeformationRings. Other supplier gaps, including `automorphic-multiplicity`, retain their existing meaning. No merge-order move or downstream roadmap edit is needed for these repairs.
