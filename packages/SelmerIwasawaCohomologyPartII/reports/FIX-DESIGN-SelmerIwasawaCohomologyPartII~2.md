# Design repair: SelmerIwasawaCohomologyPartII

## F01 (P1) — applied

L-value premise → explicit definite period witness in `rankinSelbergSelmerRankZeroOfPeriod`, including compatible special levels, transferable even levels and the integral eigentest. Deleted `period-nonvanishing`. The L-value implication is a downstream application requiring independent period nonvanishing. Evidence: ltxzz lines 6548–6565 and 6571–6576. The additional CM span premise is recorded under F06.

## F02 (P1) — applied

L1–L5 refinement → `rankTwoThreeRankTheorems`, the n=2 specialization retaining L1–L7 and the period/regulator and uniform span premises. Deleted `rank-two-three-proof`. The H(N)-free domain in §8.3 is n=2 over every F⁺, or n≥3 with F⁺≠ℚ. Evidence: ltxzz lines 196–199 announce the other argument; lines 1273–1277 give the realization domains.

## F03 (P1) — applied

Deleted §1.2 and its private weak-semisimplicity API. Bound SelmerIwasawaCohomology §§0.12–0.13, including the general Noetherian surjectivity criterion and DVR lifting statement, in the supplier contract and §§3.2, 5.3, 6.3. The `cochain_sign` witness remains in Conventions. The supplier explicitly tests the unipotent block and the failed integral lifting dimension hypothesis.

## F04 (P1) — applied

Deleted §1.1 and its private exponent/order API. Bound EulerSystemsAndKolyvaginSystems §1.3 in §§5.6, 6.4, 7.2, 8.1–8.2. Its `expAt`, `ordAt`, reducibility depth and congruence calculations supply exactly the DVR objects consumed here. No remaining target consumes an arbitrary-ring ideal-power extension.

## F05 (P2) — applied

Deleted `selmer-detection`. Section 7.2 imports EulerSystemsAndKolyvaginSystems §§1.3, 1.6, 1.11 and 1.15: both restriction-injectivity criteria, θ_S, f(1)=1, f(2)=4, realised Frobenius sets and corrected abundance. These are explicit supplier statements, not new detection definitions here.

## F06 (P2) — applied differently

Added the realised Frobenius span hypothesis (v) to §7.2 and uniform versions to §§8.1–8.4. The detection loss is c, independent of m, rather than automatically f(r)rR. EulerSystemsAndKolyvaginSystems §§1.11, 1.15 identify the obstruction q(N^α). No extension/eigenspace argument for the particular tensor is asserted. Added zero-span and bounded-loss Checks.

## F07 (P2) — applied

Deleted `selmer-local`. Bound SelmerIwasawaCohomology §§2.6–2.7, 4.9–4.10, 4.24–4.25 and EulerSystemsAndKolyvaginSystems §1.2 at the affected consumers. Global reduced Selmer groups remain images of integral Selmer, rather than arbitrary finite-coefficient Selmer kernels; the source’s ramified coefficient and small crystalline-range restrictions remain visible.

## F08 (P2) — applied

Deleted `selmer-annihilation`. Bound SelmerIwasawaCohomology §§4.11, 4.24–4.25 and ArithmeticGaloisDuality §§R02.4.2–R02.4.3, D7.4, D7.7. Added the perfect rank-one pairing exponent Check in §7.3, including zero and nonperfect controls. For exponents a,b, unit-valued perfect pairing matrices give exponent max(0,a+b−m) directly from truncated valuations m−a,m−b.

## F09 (P2) — applied

Deleted `coefficient-algebra`. The pinned `Module.torsion_by_prime_power_decomposition` and `Module.free_iff_isTorsionFree` are now exact Mathlib supplier declarations, with their PID and finiteness hypotheses. The relevant source files were read at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. F03–F04 remove the duplicated definitions that consumed this gap.

## F10 (P2) — applied

Deleted `selmer-bipartite`. Section 7.3 owns `onePlaceAnnihilator` and `twoPlaceAnnihilator`, with dual coefficients, singular exponent bounds and nonsingular localizations. Evidence: ltxzz lines 6633–6638 and 6887–6892. The second class retains the actual detection loss c and the off-diagonal zero at p₁. The construction uses the two reciprocity laws and bound Selmer/duality interfaces.

## F11 (P2) — applied differently

Deleted `hecke-transfer`; bound transferability to EndoscopicTransferAndUnitaryTraceComparison §13.7 and Satake/double-coset operators to SmoothRepresentationsOfLocalGroups §§SR.4.1, SR.4.4. Reading §SR.4.4 also verifies that both §1.3 predicates and §1.4 scalar formulas duplicate its named targets. Deleted those sections and replaced all consumers with imports. Their normalization witnesses remain in Conventions.

## F12 (P2) — applied

Bound EndoscopicTransferAndUnitaryTraceComparison §§13.6–13.9 in §3.3. Narrowed `old-form-dimension` to Lemma 6.4.2: intertwiner-compatible restrictions of two minimally ramified lifts. Section 13.9 supplies the packet dimension formula, but does not state this comparison. Evidence: ltxzz lines 5739–5748 separately invoke the two results. Its proof remains a supplier obligation.

## F13 (P2) — applied differently

Replaced the GL₂ supplier by AutomorphicGaloisRepresentationsPartII AG2.1b, AG2.2, AG2.5–AG2.7. Contrary to the proposed residual, AG2.6 “Strong coefficient field” and “Uniform strong realization” explicitly supply Definition 3.2.5. Deleted `galois-realization`. Retained only the exact H(N) multiplicity/removal obligation: AG2.5 preserves its conditional status and unpublished input. Higher-rank F⁺=ℚ still carries H(N).

## F14 (P2) — applied

Deleted `cohomological-genericity`. Bound IgusaVarietiesAndTorsionConcentration §§IG.7.2, IG.7.5, IG.7.7 and AutomorphicGaloisRepresentationsPartII AG2.7 in §§1.6, 3.1, 7.4. The predicate quantifies over all enlarged exceptional sets, spaces and compatible levels. Eventual concentration retains F⁺≠ℚ. The dependency gate places the candidate after IgusaVarietiesAndTorsionConcentration without changing the order file.

## F15 (P2) — applied differently

Added PELModuli’s exact moduli, deformation and CM contracts. Deleted `grothendieck-messing` and `cm-reflex`; §M0.26 already supplies the published reflexive closure. Verified its intersection definition against legally fetched ltxzz-published lines 1542–1556 and corrected §§1.5–1.6. Definite sets bind EndoscopicTransferAndUnitaryTraceComparison §§13.1, 13.8. Residual gaps cover special-level models and Hasse classification, the latter on AdelicAlgebraicGroups §4.1.

## F16 (P2) — applied

Bound LefschetzPencilsAndVanishingCycles §§7a.7–7a.9. Narrowed `nearby-weight` to the integral/torsion two-component filtered-nearby-cohomology and filtered-inertia comparison, with explicit stratum parity vanishings and the link-induced monodromy map. Evidence: ltxzz lines 4122–4150 and 4187–4189. This is an induced filtration, not a claimed general equality with the monodromy filtration on cohomology.

## F17 (P2) — applied differently

Coinvariants → invariants in `weightComplex_singularSequence`, supported by ltxzz lines 4152 and 4190–4195. Added Frobenius 4 on ℤ₃: invariants 0, coinvariants ℤ/3. The suggested “non-unit scalar” cannot act as Frobenius on a free rank-one lattice, since Frobenius is an automorphism. The required nonunit is u−1=3.

## F18 (P2) — applied

Deleted the epsilon-sign conclusion from §8.2 and deleted `epsilon-from-cycle`. Scope states that the root-number consequence is not exported. Evidence: ltxzz lines 6773–6792 state the rank theorem; line 6793 is a separate remark without an argument in that passage.

## F19 (P2) — applied

Deleted `potential-map-notation`. Kept §5.4’s worded invariant-source/coinvariant-target carriers and `potential_invariants_coinvariants` Check. Evidence: ltxzz lines 5097–5126 give the kernels, cokernels, map direction and coinvariant factorization; no supplier theorem is needed to decide the notation.

## F20 (P3) — applied

Bound MotivesAndAlgebraicCycles §§7.16–7.18. Narrowed `chow-abel-jacobi` to the Oλ-coefficient arithmetic étale regulator and its pushforward, pullback and coefficient compatibilities on the domains used here. The supplier’s projective Chow/rank predicates and curve height map do not construct this integral higher-codimension arithmetic regulator. Evidence: ltxzz lines 6152 and 6767–6772.

## F21 (P3) — applied

Reassigned `hochshild-serre-adic` to SchemeAndStackFoundations §2.15, binding its `hochschildSerre_galois_covering` and EtaleCohomologyFoundations §F.4.6. The residual is the adic spectral sequence and single-row H²ⁿ≃H¹(F,H²ⁿ⁻¹) edge, once. Neither the finite-cover statement nor continuous geometric action alone proves that adic comparison.

## F22 (P3) — applied differently

Moved `rigid-r-equals-t` to GlobalGaloisDeformations and local representation obligations to EndoscopicTransferAndUnitaryTraceComparison. Kept `unitary-incidence` as an explicit new obligation. GlobalGaloisDeformations §5.2 expressly says “rank-two hypotheses”: its `IsCyclotomicAbsIrred` is bound only in that scope. Higher-rank L6/A7.2.2 retain literal cyclotomic-restriction absolute irreducibility. Primitive finite-field link cohomology remains a distinct residual comparison.

## F23 (P3) — not actionable in this package: the Liu–Tian theorem must be supplied by HilbertModularVarietiesAndShimuraCurves

The existing `hilbert-precursor` gap already names that supplier and the required Liu–Tian §4.1/Theorem 4.7 output. Its roadmap has no such section. Corrected Scope and §8.5 to call this a supplier obligation. Editing these files cannot add its theorem there; the existing gap is the reason the substantive ownership request cannot be completed here.

## F24 (P3) — applied differently

The exponent contradiction disappears with §1.1’s deletion. Reciprocity now uses pinned `Polynomial.reflect` in the supplier contract; §1.3 is imported from SmoothRepresentationsOfLocalGroups §SR.4.4, avoiding a duplicate definition. Added degree-one/two sign witnesses. The adversarial pass also corrected §5.4’s zero-boundary exponent from infinity to 0.

## F25 (P3) — applied

Replaced the unbound supplier table with “From TauCetiRoadmap.X” blocks naming actual sections and precise residual obligations. Removed absent-text/process claims and capitalized mathematical emphasis. Gaps have one named owner, a section or explicitly new obligation, and a one-sentence needs field. Source-version distinctions concern mathematical definitions rather than workflow history.

## F26 (P3) — applied

Separated §3.2’s E₂ concentration/freeness under A6.1.4 from its stronger eigenvalue/coinvariant conclusions under A6.1.4, A6.1.6 and H(N). Removed H(n),H(n+1) from §4.3’s cuspidal geometric vanishing and edge construction; §4.5 retains them for the representation identification. Evidence: ltxzz lines 5295–5312 and 6767–6772.

## F27 (P3) — applied

Deleted the nonexistent named arithmetic Gan–Gross–Prasad continuation from plan consumers. PeriodsAndSpecialValues is the sole named consumer; the arithmetic application is described without assigning a roadmap name. The downstream L-value implication separately requires the period theorem and every other premise of §8.1.

## Verification and boundaries

The required dependency gate completed with exit code 0 and exactly this output:

```text
candidate: SelmerIwasawaCohomologyPartII is not in the merge order yet; checked as if placed after IgusaVarietiesAndTorsionConcentration (the intake inserts it when its design is accepted)
depcheck: 4 roadmaps, 42 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The merge-order file was not edited.

Additional checks:

- JSON and TOML parse successfully. Structural checks: 40 targets, 20 owned supplier gaps, 4 certified sources, 0 errors. Target prerequisites point backwards; every gap’s neededBy agrees with its consumers. All kept definitions and constructions have at least three Checks. Every target, API and Check name, statement and changed proof sketch agrees between README and plan.
- Arithmetic controls passed: both Hecke scalar examples; rank/twist, cochain and incidence signs; all rank-one exponent pairs for 1≤m≤6; detection-loss and nonperfect-pairing controls. These are arithmetic checks, not substitutes for the source arguments.
- `git diff --check` passed. Changes are confined to the three authorized design/source files and this report. No commits, pushes, GitHub writes or Lean commands were performed.
- Lean elaboration is inapplicable: this design package has no `Suggested.lean`, and that file is outside the authorized edit list. No admitted data or Lean signatures were created.
- All cited source texts are legally readable. The existing three certified extractions were read; the sources service fetched the institutional published text as `ltxzz-published`, now fully recorded in the manifest. No missing reference request remains.

Supplier sections were read from main where present and otherwise from the new-roadmap branch snapshots: SelmerIwasawaCohomology `17f6056`, EulerSystemsAndKolyvaginSystems `4fb7ae9`, ArithmeticGaloisDuality `5b7027c`, AutomorphicGaloisRepresentationsPartII `c4cc6a1`, EndoscopicTransferAndUnitaryTraceComparison `f8f8c2b`, PELModuli `2d82d07`, LefschetzPencilsAndVanishingCycles `1b8f741`, IgusaVarietiesAndTorsionConcentration `55adf55`, MotivesAndAlgebraicCycles `c3dad31`, GlobalGaloisDeformations `29e415c`, SmoothRepresentationsOfLocalGroups `2880329` and HilbertModularVarietiesAndShimuraCurves `5db7b73`. Main examples read for shape were ProfiniteCohomology, EtaleCohomologyFoundations and StableReduction. ArithmeticDynamics and ErdosProgressionPowers were inspected at their new-roadmap heads; their dynamical/progression targets provide no missing arithmetic level-raising interface.

Pinned files read include Mathlib `Mathlib/Algebra/Polynomial/Reverse.lean`, `Mathlib/Algebra/Module/PID.lean`, `Mathlib/LinearAlgebra/FreeModule/PID.lean`, and continuous-cohomology `Basic.lean`/`Functoriality.lean`, and Tau Ceti `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean`. Pins remain those in the design’s baseline. The polynomial comparison uses `reflect` with the specified degree, not an invented Laurent carrier.

## Adversarial mathematics pass

Each target row covers its defining clauses and displayed API, as applicable. Imported definitions retain the supplier’s generality; their boundary controls below check the interfaces consumed here. The case analysis tests statements, not merely elaboration.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: coefficient ring, twists, weights | n=2; ramified Eλ; ℓ=2,3 | R has rank 6, twist 2, weight −1; admissibility excludes small ℓ, not ramified Eλ | Retained |
| Conventions: Frobenius and polarization | inert p=3; γ=(I,−1)c | arithmetic twist action 9, geometric 1/9; hγ=−I | Retained |
| Conventions: degree and coboundary | C₂ sign action, m=1; codimension n | d0(1)(c)=−2; degree 2n maps to H¹ of degree 2n−1 | Retained; pinned d0 read |
| Imported exponents and orders | zero module; π in O/π³; unit in O; ramified DVR | exponents 0,2,∞ respectively; rational-prime exponents are unsuitable in ramified O | Deleted duplicate §1.1 |
| Imported weak semisimplicity | trivial action; unipotent block over 𝔽₃; F=4 on ℤ₃ | identity passes; unipotent invariant line maps to zero; scalar action has unequal invariants/coinvariants | Deleted duplicate §1.2 |
| Imported reciprocal Satake predicates | q=1, repeated root; T−1 in characteristic 2; degree 1 and 2 over ℤ | derivative and intertwining exclusions discriminate; reflection sign is degree-dependent | Imported §SR.4.4; no duplicate §1.3 |
| Imported Hecke scalars | r=1,q=3,a=3 and a=2; q=0 excluded | even values 16,0; odd values 9/2,105/2; no inverse of q=0 | Imported §SR.4.4; no duplicate §1.4 |
| §1.5 specialInertPlace and API | ℚ(i) at 3,5,2; identity field isomorphism; Fᵣflx=F | 3 passes, 5 splits, 2 excluded; reflexive case agrees; transport preserves local degree | Published closure and supplier binding |
| §1.6 rankinSelbergAdmissible and API | n=2, ℓ=3; ξ=±1; basis conjugation | small prime and forbidden ξ fail; basis/polarization-unit changes preserve clauses | Bound predicates; no higher-rank GL₂ shortcut |
| §2.1 unitaryLevelRaisingDatum and API | m=0,1,2; empty raising set; level change | m=0 rejected; residual specialness does not imply λ² specialness; level change retains P6 as a hypothesis | Supplier references updated |
| §2.2 unitaryBasicCorrespondence and API | N=2,3; empty indexing scheme | fibre dimensions 0,1 and codimension 1; empty base gives empty correspondence | PEL deformation binding |
| §2.3 unitarySemistableStrata and API | N=2 node; N=3,p=3; invert p | xy=p gives two reduced branches; quartic normal degrees 16,−16; generic link disappears | PEL binding; normal orientations retained |
| §2.4 unitaryLinkAndIntersection | minimal relative-position dimension; ℓ divides p+1 | link index p+1 and fibre ℙ⁰; restriction isomorphism retains p+1 invertibility | Retained; excess-bundle formula read at ltxzz lines 3741–3743 |
| §2.5 weight complex, all three API statements | two-component node; p=3; Frobenius 4 on ℤ₃ | restriction (a,b)↦a−b; matrix entries −16 and 4; invariant term differs from coinvariant term | Corrected singular sequence; integral filtration gap |
| §2.6 unitaryProductResolution and API | n=2; empty centre; complement of centre | dimensions 3 and 1 for product and link centre; blowup is identity off centre | Retained native blowup carrier |
| §3.1 localizedUnitaryCohomology | zero localization; nonproper boundary | zero target is consistent; irreducibility, not properness, kills boundary | Genericity and Satake imports |
| §3.2 oddTateCycleComparison | A6.1.4 alone; stronger hypotheses; zero localization | concentration/freeness need only A6.1.4; Frobenius comparison still uses H(N) | Split hypotheses |
| §3.3 evenIntegralFreeness | zero definite localization; cyclotomic reducibility | nonzero and cyclotomic-irreducibility premises exclude these invalid inputs | R=T owner and residual intertwiner contract corrected |
| §3.4 evenFrobeniusExclusion | residual eigenvalues 1,p²; rank-two specialization | excluded values remain excluded by the stated Satake/constituent hypotheses | Local-packet binding; primitive link residual explicit |
| §3.5 evenSingularComparison | zero quotient; ground Frobenius exclusion | zero maps agree; invariants/coinvariants cannot be interchanged before the ground term vanishes | Retained quotient nΠ and actual inertia group |
| §3.6 evenCongruenceGaloisRealization | multiplicity 1,2; zero localized module | μ copies remain visible; μ≥1 requires nonzero input | Retained noncanonical multiplicity isomorphism |
| §3.7 oddSpecialLevelChange | P empty; one prime; two disjoint rational supports | empty comparison identity; two changes compose only on allowed levels | Retained |
| §4.1 diagonalUnitaryDatum and API | n=2; incompatible levels; identity transport | dimensions 1,2,3; no finite map for incompatible levels; identity preserves graph | Transfer and native-model bindings |
| §4.2 diagonalGraphCycle and API | zero cycle; degree-two cover; point graph | classes 0,2Δ,1 respectively | Chow/regulator boundary made explicit |
| §4.3 projectedDiagonalAbelJacobi and API | zero cycle; n=2; point on ℙ¹ | additivity; target H¹(F,H³(2)); arbitrary point class has no such edge image without concentration | Removed unnecessary H(N) |
| §4.4 rankinSelbergPurityAndSelmer | n=2 weights; w∤ℓ; w divides ℓ | weight −1; away-ℓ argument uses both dual invariant vanishings; above-ℓ argument uses actual smooth model | Bound local conditions, retained regulator gap |
| §4.5 diagonalMultiplicityRealization | AJ=0; multiplicities 1,2 | nonzero coordinate follows only from nonzero vector; no canonical coordinate | H(N) and conjugation retained |
| §4.6 diagonalRegulatorNaturality | identity; degree-two cover; coefficient extension | identity, multiplier 2, actual scalar extension | Geometric adic supplier correction |
| §5.1 firstReciprocityDatum and API | empty prior raising set; repeated tensor root over 𝔽₁₁ | individual simple roots do not imply tensor PI7 | Native/transfer bindings |
| §5.2 firstGeometricReciprocity | graph supported at one point; p=3 | actual correspondences retain all Hecke factors and fibre multiplicities | Imported Hecke formulas |
| §5.3 productCohomologyConcentration | zero localization; free tensor factors; bad product eigenvalue | freeness removes Tor; PI7 is still needed for Frobenius exclusion | Base weak semisimplicity imported |
| §5.4 potential map and all three API statements | zero boundary; O→O by π²; unipotent F over 𝔽₃ | zero exponent 0; class π has exponent 1; invariants→coinvariants is zero for unipotent F | Corrected negative control; deleted notation gap |
| §5.5 firstExplicitReciprocity | p=3; one-point test function; zero test | value 4a₀a₁, or zero; cannot drop either operator | Retained |
| §5.6 firstReciprocityExponentEquality | unit scalar; zero function | unit operators preserve exponent, including zero exponent | Imported exponent API |
| §6.1 secondReciprocityDatum and API | m=0,1,2; two source points over one image | m=0 excluded; λ² condition genuinely stronger; pushforward multiplicity 2 | Retained distinct second-law hypotheses |
| §6.2 secondGeometricReciprocity | zero cycle; identity specialization | both maps give zero; T⋆ and both correspondence legs remain | Retained |
| §6.3 oddSpecialFiberCoinvariants | trivial Frobenius; residual unipotent obstruction | trivial comparison passes; weak-semisimplicity lifting premise cannot be omitted | Base §§0.12–0.13 binding |
| §6.4 secondExplicitReciprocity | O/π²→O/π; zero class | exponents 2→1 show strict inequality; zero has exponent 0 | Retained inequality direction |
| §7.1 admissibleImageLift | m=1; ξ=±1; γ² | residual witness and prime-to-ℓ order retained; forbidden ξ rejected; hγ uses square | Published reflexive-closure convention |
| §7.2 auxiliaryPlaceDetection | trivial realised subgroup; rank 1 and 2 over A₅; c≥m | no positive detection from trivial span at bounded loss; diagonal values have exponents 3, or 4 and 3; large c is vacuous | Added (v), arbitrary uniform c, three Checks |
| §7.3 system and both annihilator targets | empty raising set; two detecting places; zero/perfect/nonperfect pairing | off-diagonal zero retained; perfect pairing exponent formula includes zero; extra π in pairing destroys bound | Owned c₁/c₂ constructions and pairing Check |
| §7.4 eventualAdmissibilityFamilies | A and B; arbitrary unrelated pair; small residue characteristic | only stated families receive eventual admissibility; tensor characteristic bound remains | Genericity import; no automatic span conclusion |
| §8.1 rank zero of period | nonzero period; zero period; saturated rank-one lattice; unbounded losses | only nonzero period has finite mper; contradiction needs uniform c | Explicit witness and uniform span hypothesis |
| §8.2 rank one | AJ=0; positive multiplicity; saturated rank-two lattice | lower bound fails for AJ=0; two-place contradiction needs uniform span | Removed epsilon conclusion; added span premise |
| §8.3 H(N)-free domains | n=2,F⁺=ℚ; n=3,F⁺=ℚ; F⁺≠ℚ | H(2),H(3) domain covers first; H(4) is not discharged in second; all ranks allowed in third subject to supplier proof | Domain and family conclusion corrected |
| §8.4 rank-(2,3) specialization | F⁺=ℚ; ℓ=11; ℓ=2,3 | L1 allows 11, excludes 2,3; remaining L2–L7 and span premises retained | Deleted unsupported L6/L7-free refinement |
| §8.5 hilbertPrecursorCompatibility | g=1,3; missing LIInd; wrong residual dimension | odd-degree statement retains Assumption 4.1 and Definition 4.5; neither omitted premise is silently inferred | Existing named supplier gap retained |

The case analysis does not prove missing supplier theorems. In particular, the H(N) removal, primitive-link comparison, normalized-intertwiner comparison, integral filtration, special-level models and integral regulator remain explicit supplier obligations. This package cannot add those statements to the other roadmaps.

## Maintainer consequences

`rankinSelbergSelmerRankZero` is replaced by `rankinSelbergSelmerRankZeroOfPeriod`. `rankTwoThreeRefinedRankTheorems` is replaced by `rankTwoThreeRankTheorems`. `rankinSelbergSelmerRankOne` and both H(N)-free exports retain their names but gain the appropriate uniform CM span premise. `onePlaceAnnihilator` and `twoPlaceAnnihilator` are new README/plan API names in §7.3; no Lean declarations were added.

Deleted private names are `lambdaExponent`, `lambdaExponent_le_iff`, `lambdaExponent_map_le`, `lambdaExponent_unit_smul`, `lambdaOrder_iso`, `lambdaExponent_reduction`; `isFrobeniusWeaklySemisimple`, `weaklySemisimple_iff_surjective`, `weaklySemisimple_subquotient`, `weaklySemisimple_lift`, `weaklySemisimple_iso`; `satakeLocalConditions`, `satakeConditions_map`, `satakeConditions_local_iff_residue`, `satakeConditions_split_iff`, `satakeTensor`; and `unitaryHeckeEigenvalues`. Consumers must use the supplier sections named in Scope instead of these duplicate target names. The surviving target numbers remain unchanged.

PeriodsAndSpecialValues must retain the new period and span premises. An L-value corollary needs the separate period nonvanishing theorem. Eventual admissibility alone no longer claims an all-but-finitely-many rank theorem without eventual uniform span hypotheses. All uses of Fᵣflx now mean the published intersection convention, matching PELModuli §M0.26.

No placement decision or supplier-file change was made here. The substantive Hilbert supplier request in F23 remains for its owner; the report does not count this repair as an independent acceptance.
