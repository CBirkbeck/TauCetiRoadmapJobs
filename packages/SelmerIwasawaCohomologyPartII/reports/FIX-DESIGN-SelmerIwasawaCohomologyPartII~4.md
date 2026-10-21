# Design repair report

## F01 (P2) — not actionable in this package: native model and specialization supplier extension required

Implicit nonsingularity input → explicit unramified projected module, extending graph cycle and specialization comparisons in §7.3, including other places above auxiliary rational primes. Expanded `native-shimura` in both files and connected §§8.1–8.2. The native model/comparison extension belongs to ShimuraVarieties; declaring its contract here cannot prove it there.

Evidence: ltxzz lines 1744–1754, 2754–2768, 6700–6701 and 6901–6902. PELModuli §§M2.8, M4.3 supplies smooth models on its stated domain; nonproper specialization and the other-place native models require the enlarged gap. Proper/smooth base change is EtaleCohomologyFoundations §§F.2.1–F.2.3, with adic passage in §§F.4.1, F.4.6; the suggested §F.4.0 instead concerns lattices. The new Check distinguishes the generic edge argument outside the enlarged Σ⁺I from the stronger final (8.14), whose proof uses the additional models. Unramified coefficients alone do not make every local H¹ class nonsingular.

## F02 (P2) — applied differently

Implicit added-place rigidity → named `rigid_of_levelRaisingSpecial` in §7.3, explicitly tied to the actual automorphic polarized residual representation. Added three discriminating Checks and invoked the inference before the p₂ edge in §§7.3 and 8.2. The plan carries its hypotheses, normalization, proof and consumers.

Evidence: ltxzz lines 1044–1057, 1204–1217, 5623–5632, 5660–5661 and 6896–6897. The arithmetic-Frobenius roots are p^(1−N) times the inverse Satake roots. The simple pair {p,p⁻¹} therefore becomes {p^(−N),p^(−N+2)} exactly once. Rigidity clauses (1),(3) persist, and clause (4) only loses p. This requires the automorphic identification; a polynomial attached to an unrelated Π would prove nothing about an arbitrary r̄. The existing `rigidity` gap supplies the predicate, not this newly owned inference.

## F03 (P2) — applied differently

Membership with L2 and H(N) → membership on Wλ with explicit L1/L2, independently of H(N). Kept H(N) in §4.5. Added the PEL model input and ramified-prime Check. The Check records failure of the supplied domain, avoiding the unsupported assertion that every smooth model is impossible.

Evidence: ltxzz lines 6370–6374, 6484–6488 and 6794–6800; PELModuli §§M2.8, M4.3 and the `purity-crystalline-regulator` contract. On the source minimum containing Σ⁺bad, ramification in F also violates L2 (ltxzz lines 434, 1038–1039); that is explicitly acknowledged. L1 additionally supplies the coefficient-prime bound and oddness. Ramification of Eλ/ℚℓ remains allowed.

## F04 (P3) — not actionable in this package: full native rational concentration needs a supplier extension

Unowned concentration → precise AG2.1b reference on its compact ST/END domain and `diagonal-concentration` for the full native domain. The gap names AutomorphicGaloisRepresentationsPartII and its section in the plan and the required README contract line. Integral nonproper boundary comparison additionally carries A7.1.1; rational AJ retains its source-supported generality.

Evidence: ltxzz lines 6767–6772 state the rational cuspidal vanishing independently of H(N). The actual supplier AG2.1b, “Weight separation into the middle degree” and “The archimedean packet multiplicity,” retains compact ST/END hypotheses. Merely citing it cannot enlarge that domain. The existing `boundary-cohomology` contract is integral and assumes residual absolute irreducibility (ltxzz lines 5255–5258). Requiring that assumption for rational AJ would unnecessarily narrow the source statement. The new gap requests the rational cuspidal boundary specialization, while a Check separates the two domains. Its supplier implementation cannot be settled by editing this package.

## F05 (P3) — applied

`c=f(r)rR` → `c=𝔣(r)·d_R`, identifying d_R as EulerSystemsAndKolyvaginSystems §1.3 reducibility depth and ltxzz r_R. Updated §7.2 and the plan, preserving arbitrary uniform c and 𝔣(1)=1, 𝔣(2)=4. Evidence: that supplier §§1.3, 4.4; ltxzz lines 865–890.

## Checks and evidence coverage

The prescribed dependency command exited 0 with exactly this output:

```text
candidate: SelmerIwasawaCohomologyPartII is not in the merge order yet; checked as if placed after IgusaVarietiesAndTorsionConcentration (the intake inserts it when its design is accepted)
depcheck: 4 roadmaps, 42 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. No merge-order edit was made.

- JSON and TOML parsing: passed. All 40 target IDs/names are unchanged; all target, API and Check names occur in the README; every prerequisite gap resolves. The two expanded/new residual contract lines match the plan's supplier, section and needs.
- `git diff --check`: exited 0, no output.
- Source access: all five manifest works are certified legal cached texts; no new work or missing reference was required. Added explicit ltxzz locators without changing cache provenance. The additional source controls used ltxzz-published lines 1533–1556, ltxzz-deformation lines 1444–1456, 1761–1767, 1880–1896, stacks-blowup lines 3750–3765 and liu-tian lines 1407–1413, 1477–1500.
- Pinned APIs: confirmed the content manifest's Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; searched the cohomology, rigidity, Satake-specialness and Selmer/regulator objects and read `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean` and `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean` at those GitHub commits. Their continuous-cohomology carriers do not supply the arithmetic comparisons repaired here. No replacement carrier was introduced.
- Sibling check: read main-roadmap shapes in ComplexTori, LocalGaloisGroups and PadicMeasuresIwasawaAlgebras, the main EtaleCohomologyFoundations contracts, the relevant open supplier sections, and the QWittVectors, ErdosProgressionPowers and ArithmeticDynamics scope/interfaces. No ownership overlap requiring a new dependency was found in the repaired statements.
- Lean agreement: this design package has no `Suggested.lean`, and creating/editing one is outside the permitted files. No Lean declaration changed and no Lean command was run. The added arithmetic theorem and Checks remain README/plan statements on supplier objects; no elaboration result is claimed.
- Scope/path check: only the three permitted design/source files and this requested report changed; no machine paths were added. No commit, push, issue, pull-request or comment write was made.

## Adversarial mathematics pass

The table covers the 40 target statements, their associated API clauses, and the conventions. The computations are mathematical checks, not proofs of the roadmap's proposed heavy constructions. Supplier-dependent conclusions retain their stated hypotheses and gaps.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: coefficients, twist, duality, Frobenius, coboundary | n=2; inert p=3; γ=(I,−1)c; sign action of C₂; ramified Oλ | Rank 6, twist 2, weight −1; arithmetic/geometric actions 9,1/9; γ² has GL component −I; coboundary −2; ideal powers retain coefficient ramification | None |
| Conventions: torus carrier and support | Free two-point C₂-orbit with L=𝔽₂; nonfree action; nonproper models | Invariants form one diagonal line; orbit trace 1 versus total trace 0; free-component and support conditions essential | None |
| 1.5 specialInertPlace and API | ℚ(i), p=3,5,2; local degree two; identity transport | Inert 3 has residue size 9; split 5, ramified/even 2 and wrong local degree rejected | None |
| 1.6 rankinSelbergAdmissible and API | n=0,1,2; ℓ=2,3,11; ξ=±1; homothety | Small n outside domain; small ℓ fail L1; ±1 fail image witness; homothety preserves clauses | None |
| 2.1 unitaryLevelRaisingDatum and API | m=0,1,2; empty/infinite exceptional configurations; level change | m positive; residual condition need not lift to λ²; finite enlargement preserves supply; P6 rechecked after level change | None |
| 2.2 unitaryBasicCorrespondence and API | N=2,3; empty indexing set; field extension | Fibre dimensions 0,1 and codimension 1; empty source stays empty; native base-change domain retained | None |
| 2.3 unitarySemistableStrata and API | N=2 node; N=3,p=3; invert p | Reduced branches; quartic link normal degrees +16,−16; smooth generic fibre | None |
| 2.4 unitaryLinkAndIntersection | Smallest relative-position fibre; ℓ divides p+1; two-point orbit | p+1 index points and ℙ⁰ fibre; restriction needs p+1 a unit; invariant carrier retained | None |
| 2.5 unitaryIncidenceWeightComplex and API | Two branches; N=2,4; p=3; Frobenius 4 on ℤ₃ | Restriction a−b; incidence entries −16 and 4; link monodromy generator maps to 1 with twist −1; invariants 0 versus coinvariants ℤ/3 | None |
| 2.6 unitaryProductResolution and API | n=2; empty center; exceptional point; complement | Dimension 3; graph codimension 2; exceptional ℙ¹ contributes degree-2 class; Cartier lifting has no unrestricted converse | None |
| 3.1 localizedUnitaryCohomology | Zero localization; nonproper model; nonunit intertwiner | Zero case consistent; boundary and intertwining hypotheses cannot be suppressed | None |
| 3.2 oddTateCycleComparison | N=3; zero localization; unipotent Frobenius | Surjectivity, concentration and stronger coinvariant claims retain their different hypotheses | None |
| 3.3 evenIntegralFreeness | Zero definite support; cyclotomic reducibility; S_FL boundary | Nonzero support and cyclotomic irreducibility required; existing old-form-dimension gap retained | None |
| 3.4 evenFrobeniusExclusion | N=2; eigenvalues 1,p²; p²=1 modulo λ | Exclusion uses the stated even hypotheses; P2 prevents collision | None |
| 3.5 evenSingularComparison | m=1,2; quotient versus annihilator | Actual congruence quotient and filtered inertia remain distinct carriers | None |
| 3.6 evenCongruenceGaloisRealization | μ=1,2; homothety; conjugate coefficient | Multiplicity is not a canonical coordinate; c-conjugation retained | None |
| 3.7 oddSpecialLevelChange | Empty P; one place; colliding rational supports | Empty change is identity; distinct supports and unit intertwiners remain necessary | None |
| 4.1 diagonalUnitaryDatum and API | n=2; incompatible levels; identity; proper source-only refinement | Dimensions 1,2,3; level compatibility necessary; compatible refinement need not be Cartesian | None |
| 4.2 diagonalGraphCycle and API | Zero cycle; point graph; source degree 2 | Classes 0 and 1; graph trace 2Δ; source degree is essential | None |
| 4.3 projectedDiagonalAbelJacobi and API | Zero cycle; n=2; point on ℙ¹; nonproper reducible residual system | Degree-3 coefficient at n=2; arbitrary nontrivial geometric class has no single-row edge; rational and integral boundary inputs differ | F04 contract and Check |
| 4.4 rankinSelbergPurityAndSelmer | Weight calculation; bad w∤ℓ; ℓ ramified in F; ramified Eλ | Weight −1; rational local vanishing requires both dual invariants; coefficient-prime crystalline route needs explicit good-model domain | F03 hypotheses and Check |
| 4.5 diagonalMultiplicityRealization | μ=0,1,2; conjugation twice | Nonzero tuple forces a nonzero coordinate; no canonical projection | None |
| 4.6 diagonalRegulatorNaturality | Identity; degree 2; nonunit covering degree; source-only cover | Trace uses source degree; full inverse-image cycle controls pullback; no division by degree | None |
| 5.1 firstReciprocityDatum and API | m=0; zero congruence quotient; q=2 over 𝔽₁₁ | First two rejected; individual roots {2,6} and {1,4,3} produce tensor root 2 twice, so PI7 is independent | None |
| 5.2 firstGeometricReciprocity | Singleton graph; fibre multiplicity 2; p=3 | Positive sums count multiplicity; (p+1)²=16 retained with actual correspondences | None |
| 5.3 productCohomologyConcentration | Free versus torsion factors; tensor Frobenius collision | Freeness removes unwanted Tor; PI7 and the full first-law hypotheses control the surviving positions | None |
| 5.4 diagonalCycleBoundaryComparison and API | Zero cycle; differential π²; unipotent Frobenius over 𝔽₃ | Class of π in O/π² has exponent 1; invariant-to-coinvariant map can be zero despite equal dimensions | None |
| 5.5 firstExplicitReciprocity | p=3; one graph pair; zero function | Value 4 times the two Hecke scalars; zero and fibre multiplicities respected | None |
| 5.6 firstReciprocityExponentEquality | Zero class; unit and nonunit scalars | Unit factors preserve exponent; nonunit case is outside the stated equality hypotheses | None |
| 6.1 secondReciprocityDatum and API | Empty raising set; m=0,2; two-point fibre; extraneous rigidity witness | Empty allowed; m=0 rejected; multiplicity 2 retained; no extra PII5/PII6 imposed | None |
| 6.2 secondGeometricReciprocity | Zero class; p=3; both parities | Zero respected; T⋆ and both correspondence legs retained | None |
| 6.3 oddSpecialFiberCoinvariants | n₁=3; zero localization; unipotent block | Special-fibre and nearby cohomology differ; weak semisimplicity is essential | None |
| 6.4 secondExplicitReciprocity | O/π²→O/π; zero right-hand class | Exponents 2→1 show strict inequality possible; zero right side forces zero left side | None |
| 7.1 admissibleImageLift | m=1,2; ξ=±1; ℓ=2,3 | Residual exclusions persist under allowed lifting; small coefficient primes rejected by admissibility | None |
| 7.2 auxiliaryPlaceDetection | r=1,2; c=0,2,≥k; triangular D,C over A₅ | DC=CD=π²I; t=(−1,π) has first evaluation 0 and second exponent 3; scaled-inverse columns need not form a basis | F05 notation only |
| 7.3 rigid_of_levelRaisingSpecial | N=2,p=3 mod 11; N=4,p=3 mod 19; excluded places | Simple roots 3,4 give Frobenius 5,1; repeated roots 3,13 give pairs 4,17 twice and derivative zero; minimal/FL places cannot be relabelled | F02 inference and three Checks |
| 7.3 onePlaceAnnihilator | Other w above p; nonproper smooth model; zero period | Same-rational-prime places need specialization; smoothness alone is insufficient nonproperly; zero period outside construction | F01 explicit input and gap |
| 7.3 twoPlaceAnnihilator and system | Other w above p₁; Σ⁺I enlarged; t in first kernel | Added-place rigidity and Remark 5.2.8 required; first pairing zero; perfect pairing gives max(0,m−m₀−mper−2c−mlat) | F01/F02 |
| 7.4 eventualAdmissibilityFamilies | Isogenous/CM elliptic curves; absent supercuspidal factor | These fail the respective family hypotheses; eventual admissibility does not imply the uniform CM span condition | None |
| 8.1 rankinSelbergSelmerRankZeroOfPeriod | Zero Selmer; positive loss c; F⁺=ℚ | Contradiction threshold m>m₀+c+mper+mlat+mdif; all other local terms need the good-model input | F01 dependencies |
| 8.2 rankinSelbergSelmerRankOne | AJ=0; μ=2; positive loss; added p₁ | Nonzero AJ gives lower bound only; upper bound uses transported rigidity, nondetecting-place inputs and total loss 2c | F01/F02 |
| 8.3 rankTheoremsTotallyRealBase | n=2,F⁺=ℚ; n≥3,F⁺≠ℚ; eventual admissibility alone | H(N)-removal only on its supplied domain; span premise persists | None |
| 8.4 rankTwoThreeRankTheorems | n=2; ℓ=2,3,11; rational real base | Small primes fail L1; ℓ=11 passes L1 when unramified but needs every other admissibility clause | None |
| 8.5 hilbertPrecursorCompatibility | g=1,3; even g; excluded p | Twists 1,2 respectively; odd degree and source exclusions essential; no replacement of the unitary singular law | None |

## Maintainer consequences

F01 and F04 require supplier work outside this package; their exact residual obligations are declared, not certified by this repair. The maintainer must settle those supplier extensions. The existing old-form-dimension disposition from the previous repair is unchanged and is not re-raised.

No exported target was deleted or renamed, and the rank endpoints retain all CM base fields, ramified coefficient fields, nonproper cases and uniform span premises. `rigid_of_levelRaisingSpecial` is the sole new named theorem interface; its mathematical objects depend on the existing rigidity supplier. Consumers of §4.4 must carry the explicit L1/L2 membership domain; admissible-λ endpoints already do. Consumers of rational §4.3 must retain `diagonal-concentration`, while integral nonproper edges retain their residual boundary hypotheses. No ownership moved across the merge order.
