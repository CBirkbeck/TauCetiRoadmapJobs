<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/96#issuecomment-6309888593 -->
Red team round 1 pass a (codex) of c2849a1

Verdict: needs_changes

1. **F01** (P2) The formal scalar-extension milestone is easy to state but omitted

   **Location:** `packages/ColemanIntegrationPartII/Suggested.lean:120`–123; `packages/ColemanIntegrationPartII/README.md:292`. “Their signatures use the domain and transport constructions specified in README Layer 2.”

   **Claim:** The coefficient-extension theorem is deferred together with analytic transport because its carriers are unavailable. This misses an easy formal milestone, a major headline defect under the review contract.

   **Witness:** At the Mathlib pin, `Mathlib/RingTheory/HahnSeries/Basic.lean:142`, `HahnSeries.map` applies a zero-preserving map coefficientwise. Both logarithmic-function pairs and `doubleIndex` already exist in this file; no annulus is needed.

   **Exact repair text:** Add the following declaration inside `namespace Annulus`, and change the docstring to defer only the analytic transport statements. In README §2.3 explicitly identify this signature as the formal coefficient-extension assertion.

   ```lean
   /-- Coefficient embeddings commute with the formal double index. -/
   theorem doubleIndex_scalarExtension
       {k l : Type*} [Field k] [CharZero k] [Field l] [CharZero l]
       (f : k →+* l) (F G : LogarithmicFunctions k) :
       f (doubleIndex F G) =
         doubleIndex (F.1.map f, f F.2) (G.1.map f, f G.2) := sorry
   ```

2. **F02** (P2) Global congruence creates a subsection dependency cycle

   **Location:** `packages/ColemanIntegrationPartII/README.md:935`: “after independence of global auxiliary choices in §6.2”.

   **Claim:** Section 6.1 contains `tripleIndex_congr`, whose stated proof requires §6.2; §6.2 in turn needs §6.1's construction. The shared §6.1 Needs list does not expose this forward dependency.

   **Witness:** `packages/ColemanIntegrationPartII/README.md:935`, `:937` and `:961` give the cycle: §6.1 congruence → §6.2 auxiliary independence → §6.1 end-sum construction. The external-roadmap dependency gate does not inspect this internal cycle.

   **Exact repair text:** Move `tripleIndex_congr` to §6.2, immediately after `tripleIndex_laws`, with the text: “Prove `tripleIndex_congr`: equal global Coleman functions give equal values, independently of the chosen global compatible auxiliary primitives, by `tripleIndex_laws`.” Keep §6.1 as the choice-dependent construction and its end-sum equation.

3. **F03** (P3) Statable residue and orientation Checks lack Lean mirrors

   **Location:** `packages/ColemanIntegrationPartII/README.md:234`, `:284`, `:302` and `:304`: “if b=0 it is −Res(g dF)”.

   **Claim:** Both residue-order reductions are Checks, but the examples quantify only the Laurent-first identity. The Laurent-second identity and the numerical degree/orientation witnesses B(1,2L)=2 and B(1,−L)=−1 have no proved examples. The full derivative equality for 2+3L is tested only through its residue.

   **Witness:** `packages/ColemanIntegrationPartII/Suggested.lean:88` tests the residue, not the full derivative equality. Lines 163 and 174 omit the Laurent-second universal identity and evaluations B(1,2L), B(1,−L).

   **Exact repair text:** Add the full equality `differential ((HahnSeries.single 0 2, 3) : LogarithmicFunctions ℚ) = HahnSeries.single (-1) 3` to the existing second logarithmic-function example, proved directly by simplification. Extend the existing second double-index example, keeping two example blocks, with the conjunct “for all `F : LogarithmicFunctions ℚ` and `g : LaurentSeries ℚ`, `doubleIndex F (g, 0) = -(g * LogarithmicFunctions.differential F).coeff (-1)`”. Prove it from coefficient calculus/integration by parts at the pins, without using an admitted local theorem. Include its two-Laurent specialization in the same conjunct or example. In the first double-index example add B(1,2L)=2 and B(1,−L)=−1 as conjuncts, proved directly from `doubleIndex`; these test the stated orientation convention without requiring an annulus-map carrier. If that proof needs unimplemented Laurent calculus, turn this universal Check into a named README/Lean theorem target and retain a proved nonconstant negative-control instance.

4. **F04** (P2) Branch exports unnecessarily discard the closed-field generality

   **Location:** `packages/ColemanIntegrationPartII/README.md:1043` and `:1071`: “K/ℚ_p finite”.

   **Claim:** `branchTransport` and `properHolomorphic_branchIndependent` are exported only for finite p-adic fields, although the supplied natural theory and geometric abelian logarithm cover every closed subfield of ℂ_p. These are not semistable-model or compactness assertions requiring finiteness.

   **Witness:** `colmez1998 line 2957` supplies the closed-field scope; `colmez1998 line 3147` identifies invariant-form primitives with abelian logarithms. README §§4.0 and 4.0c already construct those general inputs, including transcendental-j elliptic curves over ℂ_p.

   **Exact repair text:** In §7.1 replace “K/ℚ_p finite” by “K is a closed subfield of ℂ_p, with its induced topology”, retaining λ,λ′∈K. In §7.2 use the same closed-field hypothesis and endpoints in a finite extension inside ℂ_p. Prove the identity after geometric base change using §4.0, §4.0b and §4.0c, then descend; use §4.0e only for its finite-field specialization. Add the transcendental-j curve of §4.0 as a branch-independence Check. Retain finite K for compactness, semistable realizations and finite-field trace assertions.

## Verified sound

Read all 1,221 README lines and all 250 Suggested.lean lines. The inventory contains **186 target-bearing paragraphs in 45 numbered subsections**, including their embedded named assertions; **26 Lean declarations** (6 real-bodied definitions/abbreviations, 14 theorem targets, 6 proved example blocks); and **164 Check bullets**. Checks were tested mathematically against their hypotheses and negative controls, not by running Lean. The source table below records **62 distinct locator anchors** read across all 6 cited works. Checked **11 roadmap supplier contracts** and **2 sibling application citations**.

The declared coefficient fields, characteristic-zero hypotheses and relevant scalar towers are present in the Lean signatures. There are no section variables that could silently disappear. The zero ring is permitted by the affine ring statements and satisfies them; the formal Laurent statements require a field. In positive characteristic, the nonconstant zero-derivative monomial is explicitly a negative control, not an instance of the characteristic-zero kernel theorem. No false Lean identity was found.

The package uses one `import Mathlib`, no admitted data, no admitted examples, no `set_option`, and `theorem` declarations. Its formal double-index and polynomial-specialization definitions have real bodies. The affine specialization is described as an algebraic ingredient, so its docstring does not claim to construct natural integration. No forced analytic headline was found; R01 records the omitted easy formal milestone. The source manifest covers all cited works; no additional source fetch or missing-reference request was necessary. No new finding reopens a previous repair marked not actionable.

**External dependency check.** The prescribed command exited 0 and printed:

```text
depcheck: 3 roadmaps, 20 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. This is the gate's reported scope, not a claim that it checks internal subsection order; R02 concerns that separate check. The named suppliers are on main or earlier in the merge order. No notion was moved to a later supplier. The diff against origin/main contains only the package folder. The review changed only this report and scratch notes; no Lean build, package repair, git write or external post was performed.

**Supplier and ownership checks.**

| Supplier | Checked contract and witness | Result |
| --- | --- | --- |
| AlgebraicCurves | `TauCetiRoadmap/AlgebraicCurves/README.md:643`, `:887`: Layers 5 and 9 completion, expansions and traced residues | General residue-field completion and characteristic-zero proper residue theorem match the consumed scope. |
| FormalLaurentPuiseux | `TauCetiRoadmap/FormalLaurentPuiseux/README.md`, L1–L3 | Formal substitution, derivation, residue and primitive calculus are imported; the new logarithmic pairing is additional. |
| ColemanIntegration | `TauCetiRoadmap/ColemanIntegration/README.md:304`, `:395`, `:466`, `:577`, `:1024`, `:1052`, `:1076`, `:1433` | L0 analytic carriers/branches and L1 Coleman functions, algebraic coefficient extension and restricted pullback match. Full analytic coefficients are owned by this package. |
| PadicPeriodRings | `TauCetiRoadmap/PadicPeriodRings/README.md:74`, `:88` | §§1.1–1.2 own the continuous action and fixed-closure theorem. The specified-closed-field adapter is an explicit local target. |
| AnabelianGeometryAndNonabelianChabauty | `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:6829` | §5.8 is finite-K abelian logarithms, with C_p points of the same variety. The arbitrary-C_p-variety extension is owned here. |
| PadicDifferentialEquationsAndRigidCohomology | `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:8422`, `:8444`, `:8469`, `:11016`, `:12254`, `:14508`, `:14548`, `:14636` | RD.4.31–33, RD.5.76, RD.6.1/86/88/92 provide the stated comparisons, linear Frobenius and weights. The residue-field iteration distinction is preserved. |
| ResolutionOfSingularitiesCharacteristicZero | `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:770` | §6.2 supplies quasi-projective SNC compactification. Extension of the Albanese map to the whole smooth variety is a local target. |
| RigidAnalyticGeometry | `TauCetiRoadmap/RigidAnalyticGeometry/README.md:235`, `:355`, `:479`, `:690` | §§1.3, 2.3, 6.2 and 8.1 supply coefficient extension, reduction, rigid geometry and analytification with the indicated scope. |
| StableReduction | `TauCetiRoadmap/StableReduction/README.md:295`, `:469`, `:491`, `:550`, `:615` | Layers 0–2, 4–5, 7 and 9 supply models, common resolutions, all-genus reduction and marking separation; no genus-zero use of an unpointed stable genus-at-least-two theorem. |
| JacobianChallenge | `TauCetiRoadmap/JacobianChallenge/README.md:448` | Layers D–F supply the Jacobian and pointed universal map; no rational point is manufactured. |
| EllipticCurves | `TauCetiRoadmap/EllipticCurves/README.md:885` | Layer 4 supplies point uniformization. Differential and annular-chart comparisons remain local targets. |
| ArithmeticDynamics sibling | `TauCetiRoadmap/ArithmeticDynamics/README.md:5006` | Current §3.58 and `noRationalFiveCycle` consume the named ED.3 rank-one and ED.4 genus-two targets. The README treats this as a consumer. |
| ErdosProgressionPowers sibling | `TauCetiRoadmap/ErdosProgressionPowers/README.md:20`, `:276` | Rational-point finiteness is the cited application input; no index-supplier edge is asserted. |

Object searches covered main and Completed roadmaps and both pinned library trees. Available library Lean files were checked against their pinned tree blob hashes: 9,160 Mathlib files and 10,906 Tau Ceti files, with zero missing files or mismatches. Relevant positive hits were also read through GitHub at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The checked native interfaces include `LaurentSeries.derivative`, `HahnSeries.map`, `Graph`, `SimpleGraph.lapMatrix`, multiplicative `SimpleGraph.FirstCohomology`, `Algebra.trace_trace`, `trace_eq_sum_embeddings`, `IsAlbanese`, `PadicComplex` and the restricted-series Gauss norm. The supplied simple-graph coboundary is head minus tail after additive translation; the package explicitly negates its chain comparison. No additional duplicate implementation target was identified.

**Source locator checks.** Numbers below denote source-extraction lines, not machine paths. Repeated citations to the same anchor count once. Derived extensions, such as rational graph lengths and trace descent, were checked as stated consequences, not mislabelled as verbatim source theorems.

| Source | Verified anchors | Scope checked |
| --- | --- | --- |
| vologodsky2001 | vologodsky2001 line 51; vologodsky2001 line 195; vologodsky2001 line 1806 | Preprint p>2 restriction, finite-extension naturality and identification with Colmez. |
| besser-zerbes2017 | besser-zerbes2017 line 88; besser-zerbes2017 line 99; besser-zerbes2017 line 108; besser-zerbes2017 line 130; besser-zerbes2017 line 218; besser-zerbes2017 line 245 | Harmonic realization, ramified refinement, rational logarithms and the Tate cycle. |
| besser2017 | besser2017 line 402; besser2017 line 421; besser2017 line 435; besser2017 line 449; besser2017 line 492; besser2017 line 503; besser2017 line 528; besser2017 line 553; besser2017 line 586; besser2017 line 605; besser2017 line 625; besser2017 line 658; besser2017 line 671; besser2017 line 700; besser2017 line 738; besser2017 line 747; besser2017 line 807 | Local/global double index, graph decomposition, Cech comparison, corrected pairing, Frobenius/monodromy and point sums. |
| besser-dejeu2012 | besser-dejeu2012 line 2232; besser-dejeu2012 line 2243; besser-dejeu2012 line 2251; besser-dejeu2012 line 2277; besser-dejeu2012 line 2299; besser-dejeu2012 line 2327; besser-dejeu2012 line 2413; besser-dejeu2012 line 2430; besser-dejeu2012 line 2529; besser-dejeu2012 line 2546; besser-dejeu2012 line 2576; besser-dejeu2012 line 2591; besser-dejeu2012 line 2769; besser-dejeu2012 line 2776 | Polynomial logarithms, labelled primitive choices, local triple laws, constant terms, global cancellation, Frobenius vanishing and actual-form relations. |
| colmez1998 | colmez1998 line 225; colmez1998 line 246; colmez1998 line 602; colmez1998 line 1938; colmez1998 line 2095; colmez1998 line 2957; colmez1998 line 2982; colmez1998 line 2986; colmez1998 line 2996; colmez1998 line 3079; colmez1998 line 3102; colmez1998 line 3147; colmez1998 line 3169; colmez1998 line 3193; colmez1998 line 3213; colmez1998 line 3376; colmez1998 line 3399; colmez1998 line 3950 | Closed coefficient fields, geometric algebraic scope, Albanese, abelian logarithms, difference rigidity, natural integration and universal branch normalization. |
| besser2005 | besser2005 line 355; besser2005 line 358; besser2005 line 365; besser2005 line 369 | Principal-divisor reciprocity and its finite-map/rational-line reductions. |

**Lean declaration and instance inventory.** Every `Type*` below is universe-polymorphic. All instances are explicit on the declaration; there are no hidden section assumptions. Locations are in `packages/ColemanIntegrationPartII/Suggested.lean`. The result is mathematical signature inspection, not elaboration.

| Line | Layer/namespace | Declaration | Variables and instances | Adversarial result |
| --- | --- | --- | --- | --- |
| 32 | 2 / Annulus | LogarithmicFunctions | k : Type*; Field k | LaurentSeries k × k; constants and L independent. |
| 37 | 2 / Annulus.LogarithmicFunctions | differential | Field k; F | f' + a z⁻¹; dL=z⁻¹, d(constant)=0. |
| 43 | 2 / Annulus.LogarithmicFunctions | toPolynomial | Field k; F | C(f)+C(a)X; X² cannot be in the image. |
| 49 | 2 / Annulus.LogarithmicFunctions | formal_primitive | Field k; CharZero k; w | Coefficient integration except exponent -1; that coefficient becomes a. |
| 54 | 2 / Annulus.LogarithmicFunctions | differential_eq_zero_iff | Field k; CharZero k; F | Residue forces a=0; nonzero exponents force constant f. F_2 counterexample excluded. |
| 59 | 2 / Annulus.LogarithmicFunctions | differential_residue | Field k; CharZero k; F | Derivative has zero coefficient at -1; logarithmic coefficient survives. |
| 65 | 2 / Annulus.LogarithmicFunctions | residue_zero_iff | Field k; CharZero k; F | Equivalent to second component zero, not vanishing of F. |
| 70 | 2 / Annulus.LogarithmicFunctions | toPolynomial_injective | Field k | Polynomial coefficients 0 and 1 recover both components; no CharZero needed. |
| 75 | 2 / Annulus.LogarithmicFunctions | example | Field k; CharZero k | Nonzero dL and scalar kernel; no admitted proof. |
| 88 | 2 / Annulus.LogarithmicFunctions | example | Concrete Q and ZMod 2 | Residue 3; polynomial constants/X; degree-two exclusion; nonscalar derivative-zero control. |
| 124 | 2 / Annulus | doubleIndex | Field k; F,G | Real-bodied coefficient formula; characteristic-zero laws have explicit additional binders. |
| 130 | 2 / Annulus | doubleIndex_self | Field k; CharZero k; F | Res(f df)=0 and the two logarithmic terms cancel. |
| 135 | 2 / Annulus | doubleIndex_add_left | Field k; CharZero k; F,F',G | Coefficient linearity; zero and mixed logarithmic inputs checked. |
| 141 | 2 / Annulus | doubleIndex_laurent_first | Field k; CharZero k; f,G | Differential is in the second argument; B(z,z⁻¹)=-1. |
| 147 | 2 / Annulus | doubleIndex_ext | Field k; CharZero k; bilinear B; alternation and Laurent rule; F,G | Expand f+aL and g+bL; alternation supplies the missing L,L value. Hypotheses do not contain the conclusion. |
| 155 | 2 / Annulus | doubleIndex_add_constants | Field k; CharZero k; F,G,a,b | Difference a*G.2-b*F.2; shift in first input against L gives +1. |
| 163 | 2 / Annulus | example | Concrete Q | 1,L order, L,L and arbitrary scalar pair; missing orientation conjuncts recorded in R03. |
| 174 | 2 / Annulus | example | Concrete Q; universal f,G conjunct | Nonconstant pair -1, Laurent-first identity and +1 shift; R03. |
| 197 | 7 / SingleIntegral | UniversalAffine | k : Type* | Pair carrier; no field, topology or integration theory claimed. |
| 202 | 7 / SingleIntegral.UniversalAffine | specialize | CommRing k; I,lambda | A+B*lambda; zero ring and B=0 valid. |
| 206 | 7 / SingleIntegral.UniversalAffine | specialize_zero | CommRing k; I | Value A. |
| 210 | 7 / SingleIntegral.UniversalAffine | specialize_add | CommRing k; I,J,lambda | Pair addition and ring distributivity. |
| 216 | 7 / SingleIntegral.UniversalAffine | specialize_tower | CommRing k,l; ring hom f; I,lambda | Both coefficients and lambda mapped; no extra scalar-tower instance needed. |
| 221 | 7 / SingleIntegral.UniversalAffine | example | CommRing k; a,lambda | Exact and zero pairs; valid in zero ring. |
| 227 | 7 / SingleIntegral.UniversalAffine | example | Concrete Q | Slopes 1 and 1/2 give changes 2 and 1. |
| 243 | 7 / SingleIntegral | branchTransport_affinePolynomial | CommRing k; I,lambda,lambda' | Difference order is lambda'-lambda; commutativity gives the displayed factor order. |

**README adversarial pass.** Each row covers every target-bearing paragraph in that numbered subsection. Names are listed explicitly; the scratch inventory retains the individual statement and local hypothesis text. “None” means no repair found in the listed tests, not that an implementation has been proved. Empty objects, characteristic changes and inseparability were applied only where the carrier permits them; field and characteristic-zero hypotheses correctly exclude the zero ring and inseparable coefficient extensions from the analytic/index theories.

| Section and statement inventory | Instances tried | Result | Change |
| --- | --- | --- | --- |
| §1.1: `Graph.LengthCochains`; `LengthCochains.mk`; `LengthCochains.ext`; `LengthCochains.div_d_adjoint`; `LengthCochains.map`; `LengthCochains.simple_laplacian`; `LengthCochains.simpleCochainsEquiv` | empty graph; isolated vertices; one edge of length 1/2; one loop; two parallel edges | df=-3 versus supplied coboundary +3; pairing 12; divergence (4,-4); both loop flags cancel. Finite actual sets and rational positive lengths are explicit. | None |
| §1.2: `Graph.harmonic_exact_decomposition`; `harmonicProjection`; `harmonicProjection_changePotential`; `rationalLaplacian_rank`; `harmonicProjection_simpleCohomologyEquiv` | triangle (3,0,0); tree; two isolated vertices; triangle in characteristic 3 | Projection is (1,1,1), exact part (2,-1,-1); two constants on disconnected graph. Characteristic 3 counterexample is excluded; rational rank proof survives extension to Q_3. | None |
| §1.3: `Graph.harmonic_subdivision`; `harmonic_subdivision_comp`; `harmonic_subdivision_residue` | one edge split into two equal or unequal lengths; loop subdivision; identity refinement | Increments are proportional to length; sum and weighted energy are preserved. Repeating the full jump on each subdivision would fail. | None |
| §2.0: `Annulus.residueTransport`; `residueTransport_degree`; `residueTransport_germ` | identity; z=t²; z=t⁻¹; degree-zero constant map; annular series unbounded below | Residues scale by oriented degree; positive-degree and germ convergence restrictions prevent false formal-series identifications. | None |
| §2.1: `Annulus.LogarithmicFunctions`; `LogarithmicFunctions.mk`; `LogarithmicFunctions.ext`; `LogarithmicFunctions.residue_zero_iff`; `LogarithmicFunctions.changeParameter`; `LogarithmicFunctions.toPolynomial`; `LogarithmicFunctions.toPolynomial_injective`; `LogarithmicFunctions.differential`; `LogarithmicFunctions.formal_primitive`; `LogarithmicFunctions.differential_eq_zero_iff`; `LogarithmicFunctions.differential_residue` | 0, constants, L, 2+3L, L²; z² over F_2; residue-zero Laurent input | Primitive division uses characteristic zero; residue extracts a; polynomial degree-two coefficient separates L². Explicit pair carrier matches the stated constant logarithmic coefficient. | None |
| §2.1a: `AnnulusLogRing.generalCoefficients`; `generalCoefficients_primitive`; `generalCoefficients_base` | Q_2 and L²/2; Q_3 and L³/3; closed versus open annulus; equal-characteristic-zero valuation | Inverse-integer growth is absorbed by an interior radius; no claim of convergence on a closed boundary. Characteristic p is explicitly excluded. | None |
| §2.2: `Annulus.doubleIndex`; `doubleIndex_self`; `doubleIndex_ext`; `doubleIndex_add_left`; `doubleIndex_reverse`; `doubleIndex_add_constants`; `doubleIndex_laurent_first` | B(1,L)=1; B(L,1)=-1; B(z,z⁻¹)=-1; B(L,L)=0; constant shifts | Signs, alternation, characterization and scalar corrections agree with coefficient calculus. Laurent-second universal Check has no example. | R03 |
| §2.3: `Annulus.doubleIndex_pullback`; `doubleIndex_scalarExtension`; `doubleIndex_shrink` | identity; degree two; orientation reversal; coefficient embedding; coefficient trace | Formal scalar extension needs only existing Hahn-series maps. Degree and reversal have easy scalar witnesses absent from examples. | R01, R03 |
| §3.0a: `Semistable.colemanCover`; `colemanCover_restrict`; `colemanCover_refinement` | good reduction; self-node; two components with parallel intersections; nonsplit nodes | Flag charts and regular subdivision avoid the simple-graph loss. Finite splitting and markings are owned by StableReduction. | None |
| §3.0b: `ColemanWideOpen.fullAnalyticExtension`; `fullAnalyticExtension_ker`; `fullAnalyticExtension_integrate`; `fullAnalyticExtension_map` | finite coefficient extension; full C_p coefficients; nonalgebraic analytic coefficients; zero function | Full analytic algebra is a separate target; no tensor-product equality with only algebraic Coleman coefficients is asserted. | None |
| §3.0c: `Curve.semistableDeRhamComparison`; `semistableDeRhamComparison_exact`; `semistableDeRhamComparison_cup`; `semistableDeRhamComparison_operators`; `semistableDeRhamComparison_baseChange` | one component; one loop; zero residue; q=1; residue extension of degree f | Cech signs give jump c; chi N=N and N²=0 have the graph interpretation. q=1 is excluded; geometric Frobenius over an enlarged residue field is the f-th iterate. | None |
| §3.1: `ColemanWideOpen.doublePairing`; `doublePairing_eq_sum`; `doublePairing_constant_independent`; `doublePairing_restrict`; `wideOpen_residue_sum_zero` | constants; exact differentials; reversed end; empty boundary | Residue theorem kills global constant shifts; end sums have the primitive-first order and alternate. Finite boundary is explicit. | None |
| §3.1a: `ColemanWideOpen.doublePairing_reciprocity`; `doublePairing_analyticExact`; `doublePairing_logUnit`; `doublePairing_qRadical` | proper curve; punctured rational curve; nonsplit boundary; eigenvalue q times a root of unity | Boundary weights remain q*zeta until splitting; no false blanket q-eigenspace assertion. Exact forms and analytic units give the specified zero classes/pairings. | None |
| §3.2: `Semistable.HarmonicPrimitiveData`; `HarmonicPrimitiveData.mk`; `HarmonicPrimitiveData.ext_mod_constant`; `HarmonicPrimitiveData.linear`; `HarmonicPrimitiveData.jump_change`; `HarmonicPrimitiveData.jump_class` | one-component model; cyclic triangle; adding component constants; disconnected negative control | c changes by -da; harmonic projection is unchanged; uniqueness has one scalar only for the connected curve. | None |
| §3.3: `Semistable.auxiliaryDoubleIndex_formula`; `auxiliaryDoubleIndex_edgeReverse`; `auxiliaryDoubleIndex_changeConstants` | c=2,d=3,Res(eta)=5,Res(omega)=7; reversal; zero residue | Correction is 2*5-3*7=-11; reversing all four signs preserves -11. Both sides change together under a component constant shift. | None |
| §3.4: `Semistable.correctedDoublePairing`; `correctedDoublePairing_eq_aux`; `correctedDoublePairing_cup`; `correctedDoublePairing_refinement`; `correctedDoublePairing_ext` | second-kind forms; exact form; genus zero; one-component model; subdivision | Corrected pairing has proper cup order, kills exact classes and preserves the fixed rational metric. Open-curve pairing is not identified with an ordinary H² cup product. | None |
| §3.5: `Semistable.correctedDoublePairing_phi_N`; `correctedDoublePairing_phi_iterate` | zero monodromy; graph class; q-Frobenius; ramified valuation rescaling | Frobenius scales the alternating pairing by q; N is skew. N is geometric monodromy, not branch-parameter differentiation. | None |
| §4.0: `NaturalIntegration.abelianLogCp`; `abelianLogCp_openQuotient_torsion`; `abelianLogCp_unique`; `abelianLogCp_functorial`; `abelianLogCp_ofFiniteModel` | zero abelian variety; arbitrary C_p elliptic j; finite-model variety; noncompact C_p-points | Torsion open quotient suffices for uniqueness; no compactness of A(C_p) is assumed. Finite-model agreement is stated separately. | None |
| §4.0a: `NaturalIntegration.abelianPrimitive`; `abelianPrimitive_differenceSplitting`; `abelianPrimitive_square`; `abelianPrimitive_invariant`; `abelianPrimitive_descent` | invariant form; exact form; dimension zero; n=1 cocycle; quadratic descent | Invariant primitives are abelian logarithms; exact primitives are endpoint differences. Normalized trace, not raw trace, descends the primitive. Arbitrary locally constant functions fail the required rigidity. | None |
| §4.0b: `NaturalIntegration.albaneseReduction`; `albaneseReduction_rationalForms`; `albaneseReduction_removeApparentPoles`; `albaneseReduction_functorial`; `albaneseReduction_primitiveDescent`; `descendedLogForms_add`; `descendedLogForms_smul`; `descendedLogForms_split`; `descendedLogForms_tower`; `NaturalIntegration.descendedLogForms` | A¹; G_m; point; proper curve; dt/(t²-2) over Q_3; transcendental pole over C | Tr((1/(2alpha))dlog(t-alpha))=dt/(t²-2). The logarithmic span over an algebraic closure is distinguished from the smaller algebraic-coefficient span over a transcendental overfield. | None |
| §4.0c: `SingleIntegral.naturalIntegration`; `singleIntegral_universalAffine`; `singleIntegral_baseChange`; `singleIntegral_goodReduction`; `singleIntegral_exact_log`; `singleIntegral_cp`; `singleIntegral_closedFieldFixed`; `singleIntegral_geometricPrimitiveDescent`; `singleIntegral_abelianOpenQuotient` | p=2,3; K=C_p; completed unramified field; a=b; exact and logarithmic forms | Closed-field fixed-point adapter is owned here; universal values are affine. Uniqueness is of a natural theory, with torsion open quotients replacing compactness. | None |
| §4.0d: `Curve.naturalIndexReciprocity`; `naturalIndexReciprocity_principal`; `naturalIndexReciprocity_constants`; `naturalIndexReciprocity_finiteDegree`; `naturalIndexReciprocity_projection`; `naturalIndexReciprocity_rationalLine` | principal divisor of a constant; map to P¹; finite non-Galois map; zero differential | Projection uses traced whole values and rational-line evaluation; supports avoid poles. Reciprocity is not inferred merely from local derivatives. | None |
| §4.0e: `Curve.jacobianIntegrationBridge`; `jacobianIntegrationBridge_natural`; `jacobianIntegrationBridge_compact`; `jacobianIntegrationBridge_moving` | P¹; elliptic curve; curve without K-point before extension; open subgroup of finite-K points | Finite-K compactness is used only after a temporary point and Abel-Jacobi comparison; no assertion of a rational point on the original curve. | None |
| §4.1: `Semistable.dlog_residue_is_exact`; `dlog_residue_orthogonal_harmonic` | f=x at xy=pi; f constant; dlog of a unit; principal vertical order | Residue is ord_head-ord_tail=-d(ord), equal to 1 for x. Harmonic normalized logarithms have zero jumps. | None |
| §4.2: `Semistable.harmonicPrimitive_eq_singleIntegral`; `harmonicPrimitive_divisor_eq`; `harmonicPrimitive_goodReduction` | good reduction; smooth residue disc; connecting annulus with nonzero jump | Equality is restricted to smooth residue domains; the valuation correction is retained on annuli. | None |
| §4.3: `Semistable.singleIntegral_on_annulus`; `singleIntegral_annulus_reverse`; `singleIntegral_annulus_baseChange` | F_tail=2,c=6,t=1/3; reversed parameter; c=0; ramified subdivision | Both orientations give 4. The same rational metric makes subdivision and ramified comparison compatible. | None |
| §4.4: `Semistable.globalDoublePairing_eq_pointSum`; `globalDoublePairing_exact`; `globalDoublePairing_constants` | second-kind pair; exact form; empty poles; residue-bearing logarithmic terms | Point-double sum is independent of global constants and matches the corrected pairing; exact and proper cup specializations have the stated order. | None |
| §5.1: `Annulus.TripleIndexData`; `TripleIndexData.mk`; `TripleIndexData.ext`; `TripleIndexData.changeConstant`; `TripleIndexData.pullback`; `TripleIndexData.linearCombination` | three labelled equal functions; opposite auxiliary shifts; L²/2; characteristic 2 negative control | Labels preserve independent auxiliary choices; diagonal half-square normalization uses characteristic zero, including Q_2. | None |
| §5.2: `Annulus.tripleIndex`; `tripleIndex_unique`; `tripleIndex_symm`; `tripleIndex_threeTerm`; `tripleIndex_meromorphic` | one Laurent second input; three pure logarithms; cyclic permutation; repeated labels | Reduction and cyclic relation match the source; pure-log half-square value is zero. Trilinearity is with transported compatible data, not arbitrary independently fixed choices. | None |
| §5.3: `Annulus.tripleIndex_changeConstant`; `tripleIndex_changeBoth` | increase I(G dH) by 1 with F=L; opposite shift; unused FG pair | Change is -1; compensating symmetric primitive shifts retain compatibility. Local auxiliary independence is not claimed. | None |
| §5.4: `Annulus.tripleIndex_simplePoles`; `tripleIndex_simplePoles_zeroConstantPrimitives` | constants; simple-pole logarithms; a higher-order pole; constant-term extraction | Constant-term formula retains the simple-pole hypotheses; auxiliary constants remain visible. Higher-order poles do not satisfy this specialization. | None |
| §5.5: `Annulus.tripleIndex_pullback`; `tripleIndex_pullback_comp` | degree one and two; reversal; change of logarithmic lift; untransported auxiliary constants | Degree scales the whole transported datum; omitting auxiliary transport breaks the identity by the explicit residue error. | None |
| §6.0: `ColemanWideOpen.formSymbolRelations`; `formSymbolRelations_kernel`; `formSymbolRelations_restrict` | zero actual form; symbol relation with analytic coefficients; constant Coleman coefficient | The product-kernel relation concerns actual analytic forms and de Rham classes, not a free symbol space declared equal to them. | None |
| §6.1: `ColemanWideOpen.tripleIndex`; `tripleIndex_eq_endSum`; `tripleIndex_globalChoices`; `tripleIndex_congr` | no ends; equal Coleman functions with different auxiliary primitives; global versus local choices | End-sum construction is meaningful; congruence is placed before its required global choice-independence result. | R02 |
| §6.2: `ColemanWideOpen.tripleIndex_laws`; `tripleIndex_add_const_second`; `tripleIndex_const_third`; `tripleIndex_restrict` | global constant shift; Laurent-second constant C; third argument constant; shrinking | Global residue sums cancel auxiliary shifts. T(F,C;H)=C B(F,H); a constant third argument gives zero globally. | None |
| §6.3: `ColemanWideOpen.tripleIndex_frobenius_vanishing`; `tripleIndex_frobenius_iterate` | q=1; nonsplit boundary eigenvalues q*zeta; q=2; two q-eigenclasses | q=1 excluded; the weight argument excludes the reciprocal eigenvalue needed for a nonzero functional. Vanishing is not asserted for arbitrary classes. | None |
| §6.4: `ColemanWideOpen.colemanFormPairing`; `colemanFormPairing_unique`; `colemanFormPairing_relation`; `colemanFormPairing_restrict` | two presentations of one actual form; dH=1*dH; zero form; exact argument | Relation theorem is used before descent to forms; P(F,dH)=B(F,H), and a free-symbol pairing alone would not suffice. | None |
| §7.0: `TateCurve.uniformizationDifferential`; `uniformizationDifferential_pullback`; `uniformizationDifferential_charts` | q=p³; n=1 loop; n=2 parallel edges; q=1; p=2 | q=1 is excluded and the small-n graph retains its period; dlog(z/q)=dz/z. Point uniformization and analytic chart comparison have distinct owners. | None |
| §7.1: `SingleIntegral.branchTransport`; `SingleIntegral.UniversalAffine k`; `branchTransport_comp`; `branchTransport_exact`; `UniversalAffine.specialize`; `UniversalAffine.specialize_zero`; `UniversalAffine.specialize_add`; `UniversalAffine.specialize_tower`; `SingleIntegral.branchTransport_affinePolynomial` | branch 0 to 2; ramified uniformizer e=2; unit; identity branch; zero ring for affine algebra | Changes are 2 and 1; units give zero. Affine ring identity holds even in the zero ring. Integration export unnecessarily retains finite K. | R04 |
| §7.2: `SingleIntegral.properHolomorphic_branchIndependent`; `properHolomorphic_universalCoefficient_zero` | P¹; elliptic curve; G_m; elliptic curve with transcendental j over C_p | Proper holomorphic branch independence agrees with abelian logarithms; G_m is the negative control. Closed-field generality is omitted. | R04 |
| §7.3: `SingleIntegral.coefficientTrace`; `coefficientTrace_tower`; `singleIntegral_galois`; `primitive_galois_average` | identity extension; quadratic extension; finite tower; exact form; no rational basepoint initially | Trace is linear; Tr(algebraMap x)=[L:K]x. Normalized Galois averaging is valid in characteristic zero. Finite separability is automatic for these coefficient fields. | None |
| §7.4: `Curve.divisorSingleIntegral`; `divisorSingleIntegral_split`; `divisorSingleIntegral_ext`; `divisorSingleIntegral_add`; `divisorSingleIntegral_baseChange` | zero divisor; quadratic closed point minus twice a rational point; changing basepoint | Degree weights closed points by residue degree; basepoint term cancels precisely at degree zero. No rational point on X is required. | None |
| §7.5: `Curve.tracedLocalIndexSum`; `tracedLocalIndexSum_split`; `tracedLocalIndexSum_tower`; `tracedLocalIndexSum_congr`; `tracedLocalIndexSum_bilinear`; `tracedEndIndexSum` | quadratic closed point t²-pi; rational point; empty poles; alpha²=pi | Local index 1 traces to 2; infinity contributes -2. Tr(alpha²)=2pi whereas Tr(alpha)²=0; only the whole index is traced. | None |
| §7.6: `Curve.integrationRealization_descent`; `integrationRealization_commonExtension`; `integrationRealization_divisor`; `wideOpenIndex_galoisDescent` | good reduction; two realization fields; further ramification; quadratic constant field | Common extension and fixed-metric refinement preserve intrinsic values. A quadratic constant field contributes trace 2 to scalar 1. No whole-curve triple pairing is inferred. | None |
| §7.7: `TateCurve.singleIntegral_normalization`; `TateCurve.singleIntegral_q_periodic`; `TateCurve.singleIntegral_branch` | q=p³; n=1,2; z mapped to qz; branch change; degree-zero endpoints | F=log(z)-nu(z)log(q)/n is q-periodic and branch independent; normalized jump is -log(q)/n. No division by n=0 occurs. | None |

## Not verifiable

- Lean elaboration and execution of the six example proofs were not run: this pass forbids Lean builds and supplies no authorized elaboration command. The proposed R01 signature was checked against the pinned carrier/map definitions but has not been elaborated.
- Most analytic, geometric and cohomological carriers are roadmap targets rather than existing Lean objects. Their implementation, convergence proofs and all future comparison diagrams cannot be certified by this statement review. Their mathematical hypotheses, source support, ownership and listed boundary cases were reviewed as recorded above.
- No cited text remains unreadable or uncertified for this pass. No missing-source request is pending.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c2849a1810770207f7c5dce18bcce24dc3c9469b", "job": "RT-ColemanIntegrationPartII~1a", "model": "gpt-6-astra", "worker": "chris-2"} -->
