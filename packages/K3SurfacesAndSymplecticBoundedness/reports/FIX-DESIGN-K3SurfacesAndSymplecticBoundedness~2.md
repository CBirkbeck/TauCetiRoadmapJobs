# K3 design repair findings

## F01 (P1) — applied differently

Six unowned proof gaps → six K3 theorem targets: §§2.1a, 6.1a, 6.2a, 6.3a, 6.4a, 6.8a, each before its consumer, with hypotheses, API and three Checks. Preserve Proposition 2.9’s p≠11 restriction by stating “p=11 or an invariant pencil”; do not import its stronger footnoted extension. Evidence: lang-nygaard line 93; dolgachev-keum lines 287,517,579; keum line 799.

## F02 (P1) — not actionable in this package: generic genus-one theory requires a supplier extension

The existing genus-one gap now names SchemeAndStackFoundations, proposed Part II §genus-one-fibrations, with its characteristic-2/3 cases and geometric root-lattice contract. Generic supplier mathematics cannot be added here. The K3 p-torsion assertion stays in §6.3a rather than being assigned to a generic surface supplier. Evidence: dolgachev-keum lines 391,424–443. No supplier theorem is presumed delivered.

## F03 (P1) — applied

Inventory gap with no prerequisites → deleted from README and plan. Downstream applications remain under Downstream consumers, with PeriodsAndSpecialValues the only named consumer and an explicit statement that no consumer supplies a premise. No mathematical prerequisite depended on the inventory.

## F04 (P2) — applied

Missing-GAGA gap → direct ComplexComparisonPartII contracts C−1.1, C1.9, C2.2, C5.1, C6.3 and C6.6. Rewired §§2.3, 3.1, 3.2, 3.4 to the sections they actually use. Checked `projectiveComplexGaga`, `properSchemeGagaEquivalence`, `projectiveGeometricDictionaries`, `artinComparison`, and `adicArtinComparison` in the supplier text; integral comparison is distinguished from coherent GAGA.

## F05 (P2) — applied differently

Duplicate relative-Picard and obstruction requests → imports from AlgebraicModuliForArithmeticGeometry §7.6.1/§7.6.1a, ComplexComparisonPartII C3.2d.2–C3.2d.5 and JacobianChallenge Layer D. Added universal functions and explicit sheafification in §2.1. Retained only ample-space and arithmetic-continuity/finite-field-Brauer gaps. The arithmetic extension is proposed Part III; no new Jacobian Part II is asserted. Pinned `littleWedderburn` supplies only finite-division-ring commutativity.

## F06 (P2) — applied differently

Duplicate crystalline/de Rham–Witt requests → explicit CR.2.3, CR.3.2–CR.3.3, CR.3:duality.1, CR.4.1, CR.4.6–CR.4.7 and CR.7.3 imports. The residual formal-Brauer gap excludes already-supplied FdV and completeness. Split the other residual gap into Gauss–Bonnet, degree-one Picard comparison and formal Chern derivative contracts. Evidence: nygaard-closedness line 286; deligne-lift line 29 and §2.

## F07 (P2) — applied differently

Integral topology request → AlgebraicTopology Stage 6 imports; the analytic gap retains only exponential/Chern/intersection comparison. Corrected the proposed torsion indexing: UCT uses Ext¹(H_(i−1),ℤ), and oriented duality relates its vanishing to torsion in H^(n−i+1), not H_(n−i+1). For a three-dimensional lens space, H² has torsion while H₂=0. Evidence: huybrechts lines 452–472.

## F08 (P2) — applied differently

Compound surface gap → quotient/resolution, tame ADE, rational transcendental comparison and ruled-two-form gaps. Mathieu gap → permutation models, explicit (W)→(E)→(M) recognition, and exceptional abstract embeddings. The K3 Sylow and exceptional-list deductions remain in §§6.10–6.11, avoiding a reverse supplier dependency. Recomputed every `neededBy`. Evidence: mukai lines 1503–1540; dolgachev-keum lines 793–808,833–840,1566; keum line 811.

## F09 (P3) — applied

Matsusaka–Mumford prerequisite for §5.3 → deleted from the target, layer dependencies and gap consumers. Its only consumer is §8.2. Graph-Hilbert finiteness needs the zero tangent and projective parameter space, not trait extension. Evidence: huybrechts lines 3376–3399; rizov line 1084.

## F10 (P3) — applied

Injective cycle map → explicit `picardCycle_saturated` API with torsion-free cokernel and rank-22 integral isomorphism Check. §6.7 consumes that name. If ℓⁿy=c₁(x), finite-level injectivity gives x=ℓⁿz; freeness gives y=c₁(z). Thus no ℓ-primary index survives at equal rank. Evidence: huybrechts lines 14002–14006; rizov lines 296–300.

## F11 (P3) — applied differently

Unspecified all-characteristic vanishing → explicit positive-characteristic Terakawa and characteristic-zero Kodaira–Ramanujam branches in the gap and §7.4. The nef-and-big statement has its precise name; Kodaira is its ample case. Evidence: terakawa lines 183–191,375–376; huybrechts Chapter 2 Theorem 1.8, p.25, lines 815–818. Both branches retain full surface generality.

## F12 (P3) — applied differently

Cross-realization owner → CrystallineCohomology proposed Part II, with both §§6.5 and 6.8a as consumers. Preserve the source’s arbitrary-automorphism polynomial equality and restrict the semisimplicity inference to finite order. Added IntegralLattices Layer 1 (1I) and a σ=11 Check. At p=2 the rescaled evenness is explicit crystalline input. Evidence: keum line 271; huybrechts lines 14339–14342.

## F13 (P3) — applied

Access/process language → source-status metadata only in `sources.toml`; references retain mathematical version information. Characteristic-zero vanishing locator → Huybrechts Chapter 1 §3.3, p.16, lines 488–493. Updated source consumers and locators, including removal of §5.3 from Matsusaka–Mumford’s consumers. No access waiver was reopened.

## F14 (P3) — applied

Topological Lefschetz input in an étale gap → MorseNovikov N6’s mapping-torus fixed-point formula, explicitly consumed by §6.2 and its cyclic arithmetic milestone. The residual gap is positive-characteristic étale trace only. The isolated holomorphic local sign is +1 because det_R(1−dg)=|det_C(1−dg)|²>0. Evidence: keum lines 336–341; MorseNovikov N6.

## Verification outcomes

The required dependency check exited 0 with this exact output:

```text
candidate: K3SurfacesAndSymplecticBoundedness is not in the merge order yet; checked as if placed after JacobianChallengePartII (the intake inserts it when its design is accepted)
depcheck: 3 roadmaps, 12 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. JacobianChallengePartII is mentioned to delimit existing ownership; no theorem from it is a premise. Its earlier placement makes the gate’s conservative edge harmless. Neither merge order nor tooling was edited.

Structural checks exited 0:

- JSON and TOML parse; 56 targets in dependency order and 25 nonempty gaps with named suppliers.
- Every target, API and Check name occurs in the README; all target dependencies point backward; gap references and `neededBy` lists agree exactly.
- Each of the six new K3 proof targets has at least three Checks.
- Small arithmetic checks agree: cyclic orbit identities, ADE determinants 121 and 225, order-7/order-21 invariant averages, Mathieu values for orders 1–8, the zero-denominator boundary and the index-24 Mathieu group-order relation.
- `git diff --check` exited 0 with no output. Edited deliverables contain no machine paths.
- There is no `Suggested.lean` in this design package. No Lean file was created or changed, and no Lean command was run. The heavy K3, analytic and cohomology carriers remain README targets.

The main-branch comparison texts read were `TauCetiRoadmap/JacobianChallenge/README.md`, `TauCetiRoadmap/IntegralLattices/README.md`, `TauCetiRoadmap/MorseNovikov/README.md` and the relevant `TauCetiRoadmap/AlgebraicTopology/README.md` sections. ArithmeticDynamics and ErdosProgressionPowers were inspected read-only and supply no K3 premise.

Supplier branch texts were inspected at these repository commits:

| Supplier | Commit |
| --- | --- |
| ComplexComparisonPartII | `c9ccfac82885efe9b0ba23cc8df12ddb5512af37` |
| CrystallineCohomology | `2c8b22a1737d1660f1baf397926b41e90139a80d` |
| AlgebraicModuliForArithmeticGeometry | `98fd03823a4797777f298cf65d50ff0cafb51c43` |
| CohomologyComparisons | `67130cb48c5d02c3c0b04068b310ffda00c09746` |

The first three are new-roadmap additions absent from main, so their earlier supplier contracts are eligible. CohomologyComparisons was read to verify its p-adic comparison scope; its supplier edge was deleted. Library checkout heads match both manifest pins. GitHub code search located `Mathlib/RingTheory/LittleWedderburn.lean`, which was then read at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; the actual declarations are `littleWedderburn` and `Finite.divisionRing_to_field`. Object searches and reads at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` confirm the native differential, line-bundle-class and integral-lattice carriers; no K3 or supersingular Picard theorem was found in their algebraic-geometry directories.

All works cited by the repair are existing manifest works with cached legal texts or settled source status. No new source fetch or missing-reference request was needed. Rudakov–Shafarevich §8 Proposition 3, Nygaard Lemma 3.3 and Matsusaka–Mumford Theorem 2 retain their waived status and are cited by locator, not described as independently text-certified. The vector-field reduction additionally has the readable secondary locator lang-nygaard lines 101–103.

## Adversarial mathematics pass

This table records mathematical boundary analysis of statements and their APIs, not Lean proof verification. Results depending on a supplier contract remain conditional on that contract being supplied; the table is not independent acceptance.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: fields, dimensions, coefficients | Empty scheme; imperfect field; p=2,3; ℓ=p | Nonempty geometric integrality and relative smoothness retained; étale ℓ=p excluded | None |
| Conventions: forms and inverse pullback | Two basis vectors; composition f∘g; characteristic 2 | e₁↦e₂*, e₂↦−e₁*; inverse pullback is a left action | None |
| Conventions: discriminant and twists | Gram [4]; curve square −2; signature (1,21) | Half-norms 2,−1; rank-22 determinant negative; positive cup-trace | None |
| 1.1 K3 predicate and API | Empty scheme, P², E×E, quartic | Reject first three; quartic is the positive control; no chosen volume form | None |
| 1.2 field-extension equivalence | Identity, purely inseparable extension, rescaled volume form | Base-change/descent hypotheses cover all three | None |
| 1.3 projectivity | Smooth quartic; imperfect base; dimension three | Full surface supplier required; no higher-dimensional claim | Gap retained |
| 1.4 RR and contraction | O; quartic H; p=2; alternating frame | 2χ(O)=4; χ(H)=4; contraction signs agree | None |
| 1.5 numerical/torsion kernel | O; p-torsion; effective rational curve | RR excludes nontrivial kernel including p-torsion; curve square −2 is nonzero | None |
| 1.6 quartics | t=0,1; Fermat in characteristic 2 and 3 | χ=2,4; characteristic-2 equation nonreduced; characteristic-3 partials do not vanish together | None |
| 2.1 relative Picard and API | Closed field; jumping divisor; nonreduced test base | Fibres are étale; relative space need not be flat; universal functions must survive arbitrary base change | Imported representability; explicit sheafification and universal functions |
| 2.1a infinite-height kernel | Zero kernel witness; p=2; finite-height branch | Zero alone cannot contradict injectivity; retain vector-field hypothesis and separate finite height | New owned proof target |
| 2.2 closedness | Zero form; p=2; nonzero dual differential | FdV and V-separation force injectivity only in the contradiction branch | Explicit earlier kernel milestone |
| 2.3 no vector fields | E×E; p=2; characteristic-zero projective analytic surface | K3 H¹(O)=0 excludes the torus; contraction and duality give the stated tangent vanishings | Exact complex locator and comparisons |
| 2.4 Hodge/crystalline ranks | Degrees outside 0–4; p=2; torsion versus rational rank | Diamond gives Euler number 24; freeness requires derived reduction, not dimension alone | Imported generic control; residual rank-comparison gaps |
| 2.5 marked deformations | Dual numbers; nontrivial global stabilizer | Tangent dimension 20; marking distinguishes the prorepresented functor | None |
| 2.6 line deformation divisor | L=O; p∣2d; p∤2d | Trivial class is excluded; bad degree gives flatness, not smoothness | Formal Chern derivative gap isolated |
| 2.7 polarized lift | p=2; fixed versus chosen deformation | Existence of a possibly ramified trait, not extension along every trait | None |
| 3.1 analytic predicate and API | Empty manifold; two-torus; projective quartic | Nonemptiness and H¹(O) distinguish the controls | Correct analytification supplier |
| 3.2 algebraization | O; rescaled volume; nonprojective analytic K3 | Coherent comparison preserves the data; projectivity is essential to the algebraic image | Imported ideals/sections algebraization |
| 3.3 integral topology | Rational ranks with torsion; quartic; exponential loop | Pic torsion and UCT control integral freeness; square integrates to 4; loop lift increment +1 | Correct topology owner and torsion indices; normalization Check |
| 3.4 integral étale ranks | ℓ=p; ℓ=2≠p; geometric point class | Exclude first; include second; trace of point is 1 | Integral Artin comparison imported |
| 4.1 Picard base change | Identity; algebraically closed extension; invariant class with obstruction | Injectivity holds; integral descent still retains Brauer obstruction | Existing obstruction sequence consumed |
| 4.2 Picard lattice and API | O; [4]; rational curve; k-ample class | Norms and sign agree; arbitrary-field pairing is not defined by geometric numerical equivalence | None |
| 4.3 rank definitions and API | Closed field; rank 0; positive characteristic rank 22 | Geometric rank independent of closure; rank 0 excluded; h¹¹ is not Picard rank | None |
| 4.4 cycle map | Multiplication by ℓ on ℤ_ℓ; geometric rank 22 | Injectivity alone allows index ℓ; saturation forbids it and gives integral isomorphism at full rank | Added saturated API and Check |
| 4.5 odd congruence kernel | Rank 0; −1 at ℓ=2,3; I+3E₁₂ | Rank 0 trivial; −1 defeats ℓ=2, not ℓ=3; unipotent example has infinite order | None |
| 4.6 bounded descent | Closed k; finite k; missing rational point | Degree 1 in first case; finite-field Brauer vanishing supplies integral classes; rank descent alone otherwise | Narrowed arithmetic supplier gap |
| 5.1 symplectic predicate and API | Identity; composition; changing generator; p=2 | Kernel independent of generator and uses inverse pullback | None |
| 5.2 polarized stabilizer and API | Identity; scalar choices on L; symplectic intersection | Scalar line isomorphisms are discarded; genuine surface arrows remain | None |
| 5.3 finite étale polarized group | Identity tangent; nontrivial finite stabilizer; infinitude of full Aut | Zero tangent and finite-type polarized graph argument suffice | Unused extension premise deleted |
| 5.4 Wehler action | Gram matrix; individual involutions; product | Determinant −12; individual scalar −1; product trace 14 and determinant 1 gives infinite order | Quotient input separated |
| 6.1 tame quotient | G=1; involution; wild order | Root rank 0 and determinant 1; 8A₁ determinant 2⁸; no wild linearization | Generic quotient inputs split |
| 6.1a cyclic arithmetic | C₂; C₄; candidate orders 11,15 | 24=8·3; 72=4·15+2·2·3; rank-20 determinants 121,225 excluded separately | New owned proof target |
| 6.2 fixed-point table | Identity; orders 2,7; cyclic exceptional candidates | Identity excluded; counts 8 and 3; arithmetic cannot simply assume the table | Consumes earlier arithmetic target |
| 6.2a wild fixed loci | Empty p=2 locus; κ=0 versus 1; D²=2,d=1 | Enriques branch retained; negative definite versus fibre radical distinguished; inequality becomes 0≤2 | New target; explicit zero-denominator negative control |
| 6.3 wild quotient | Empty locus; Enriques H²; K3 exceptional curves | Enriques invariant dimension 10; nontrivial exceptional lattice increases rank | Owned fixed-locus target and rational quotient comparison |
| 6.3a wild refinements | p=11; quasi-elliptic p=2,3; p=13 | p=11 disjunction sufficient; small-characteristic pencils retained; p=13 invariant-pencil case impossible | New target retaining source restriction |
| 6.4 wild-prime bound | Trivial group; p=13; order-p element | Vacuous premise for trivial group; p=13 finite groups tame; Cauchy supplies reduction | Owned fixed-divisor refinements |
| 6.4a supersingular Picard faithfulness | Identity; p=2; fixing a single polarization | Full rank-22 geometric Picard action required; a fixed ample class alone is insufficient | New owned theorem; waived primary locator retained |
| 6.5 étale faithfulness | Infinite-order unipotent matrix; Enriques branch; ℓ=p | Characteristic polynomial alone insufficient; finite order established first; dimension-10 branch retained | Correct cross-realization owner and local Picard theorem |
| 6.6 uniform finite bound | G=1; characteristic 3; wild finite group | Order 1 allowed; choose ℓ=5 at p=3; no averaging in group order | None |
| 6.7 supersingular discriminant | σ=0,11; p=2; rank-22 integral cycle index | Milgram forbids even unimodular signature (1,21); dyadic rescaled evenness is separate input | Saturation, Milgram and scaled-evenness Check |
| 6.8 Artin-one predicate and API | Rank22 with discriminants −9,+9,−81; rank20 | Only −9 at p=3 and rank22 qualifies | None |
| 6.8a invariant dimension | G=1; C₇; nonabelian order21; both Artin-one | Dimensions 24,6,6; no universal five-invariant claim in the last case | New owned theorem with elliptic/formal-Brauer refinements |
| 6.9 Mathieu character | Orders 1 through 8; wild element | Values 24,8,6,4,4,2,3,2; no wild trace formula | Earlier invariant-dimension theorem consumed |
| 6.10 characteristic-zero bound | Trivial group; cycle type 1⁸2⁸; 23-cycle | 24,16,2 orbits; five-orbit condition excludes the last | Finite-group contract explicit; K3 Sylow deduction local |
| 6.11 tame exceptional bound | Both Artin-one; p=2; nonclosed field | Four-invariant branch retained; odd tame order at p=2; base-change injection valid | Abstract exceptional embeddings separated |
| 7.1 primitivity and API | Zero class; divisible class; squarefree d | Zero fails; divisibility forces n²∣d; primitive is a geometric condition | None |
| 7.2 Picard multiplication | n=0; n=3 at p=3; primitive locus | n=0 excluded; no division by 3; finitely many divisibilities at fixed degree | Relative Picard supplier imported |
| 7.3 polarized families and API | d=0; locally represented class; scalar line automorphism | d>0 essential; Picard sections allow local representatives; scalar arrows excluded | None |
| 7.4 power cohomology | m=0; m=1; p=2; characteristic zero | Vanishing excludes m=0; h⁰(L)=d+2; both characteristic branches justified | Characteristic-zero vanishing explicit |
| 7.5 cube embedding | d=1,2; p=2; possible obstruction divisor | Section ranks 11,20; projective dimensions 10,19; evenness excludes D²=1 | General positivity contract retained |
| 7.6 K3 Hilbert locus and API | Singular degeneration; rank equality of two line bundles | Smooth locus required; equal ranks cannot replace equal canonical Picard classes | Representability/equality-locus supplier imported |
| 7.7 Hilbert atlas and API | p=3 cube root; different frames; local-only representative | Closed [3] locus valid without dividing by 3; frames differ; no universal global root line | None |
| 8.1 moduli stack and API | Nontrivial stabilizer; primes dividing 2d | Stabilizers retained; atlas is over all ℤ | None |
| 8.2 trait extension | Identity trait; ruled special fibre; punctured family | Identity extends; K3 two-form excludes ruledness; no properness of moduli follows | Two-form and ample-space gaps separated |
| 8.3 coarse space | Stabilizers; twisted k-forms | Coarse geometric points classify geometric isomorphism classes only | None |
| 8.4 smooth open base | d=1; p∣2d | Base ℤ[1/2] in degree 2; no bad-prime smoothness claim | None |
| 8.5 finite-field finiteness | Fixed k,d; twists; coarse rational points | Actual line representative and frame cover every k-object; twists counted | Genuine Brauer and ample-space residual contracts |
| Remaining generic gap contracts | Trivial quotient; ℓ∣|G| but ℓ≠p; quasi-elliptic fibres; odd rescaled dyadic lattice | Quotient comparison is rational; quasi-elliptic cases kept; index and parity inputs explicit | No unowned gap or assumption containing an endpoint conclusion |

## Maintainer notes

The six new names are `IsK3.infiniteHeightDifferentialKernel`, `IsK3.tameCyclicFixedPointArithmetic`, `IsK3.wildFixedLocusAlternatives`, `IsK3.wildPrimeBound_fixedLocusRefinements`, `IsK3.supersingularPicardFaithfulness`, and `IsK3.tameInvariantDimension_ge_five`. New API names include `relativePicardSpace.universalFunctions` and `picardCycle_saturated`. Existing endpoint names and subsection numbers are preserved; inserted subsections use letter suffixes.

The deleted gap slugs are replaced by named local milestones or actual supplier imports. Split surface, crystalline and Mathieu gaps have new slugs with exact consumers in the plan. Supplier extensions remain requests, not assumed theorems; F02 specifically requires an external ownership decision and general-library work. Nothing was moved from a later supplier, and no merge-order change is requested. No commit, push, pull-request edit or message to another service was performed.
