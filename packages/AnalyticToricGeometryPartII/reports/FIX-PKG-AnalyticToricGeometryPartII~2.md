# AnalyticToricGeometryPartII repair report

## F01 (P2) — applied

Redundant SchemeAndStackFoundations valuation gap → ClassicalAdicEtaleCohomology §6.2 proper specialization and EtaleCohomologyFoundations §F.2.3 smooth ULA. The latter has no noetherian-base restriction. Deleted the gap; updated exact contracts, §§4.1–4.2 routes and Needs, Layer 4 dependencies, and the nondiscrete ℙ¹ Check. SCH12 line 2452 identifies the required specialization step.

## F02 (P2) — applied

Compound intersection gap → separate ample-degree-positivity (§§5.3–5.4) and ample-generic-cuts (§4.13) contracts, identical in README and plan gaps. Localized support → existing §5.5 `Chow.gysin`, zero-section homotopy invariance and `excess_intersection`. Updated §§6.1–6.4 dependencies and Layer 6; expanded the repeated-line Check to compute its degree-one class in CH₀(L).

## F03 (P3) — applied

Closed-stratum face projections cited as localization → C0.9 open face immersions and C0.16 gluing. Corrected scope, supplier contract, §§0.3/1.1 routes, §§0.3/1.1/1.3 Needs and Layer 0 dependencies. C0.6–C0.7 now serve §0.1 orbit ideals. Its new Check distinguishes t↦0 from adjoining t⁻¹; the respective targets are k and k[t,t⁻¹].

## F04 (P3) — applied

P7.1–P7.4 completed-colimit locator → P7.11 and AdicSpacesPartII R0.20.1. Residue-field conversion → P7.15. Updated the supplier contract, §§3.2/3.5 routes, §3.2 Needs and Layer 3 dependencies. §3.2 distinguishes chart-density from SCH12 Definition 7.14's weaker relation (SCH12 line 2317), retaining qcqs locally noetherian finite levels and integral-lattice detection.

## F05 (P3) — applied

Identically rendered toric spaces → (TΣ,K)♭≅TΣ,K♭ in §3.1. This states tilting of the untilted space, as SCH12 line 2414 requires. The existing perfected-disc, Laurent and rank-zero Checks retain the correct interpretation; no acceptance-test substitute was introduced.

## F06 (P3) — applied

Implicit sign conversion → explicit u(ρ)=−m_ρ translation in §6.1. FS94 line 235 then gives m_ρ′−m_ρ=c(σ)b_(ρ,σ). Repointed this equation's locators in Conventions and §6.1 to line 235. The ℙ¹ witness remains 1−0=1 and degree +1; its frames, divisor weights and worked example keep the same convention.

## F07 (P3) — applied

Unused homogeneous-approximation gap in §§2.1/2.4/3.1 → perfected-cone gap alone; Layer 2 dependencies agree. §2.4's route verifies the estimate's hypotheses and leaves its application in §5.2. Missing compactness input → AdicSpacesPartII R0.19.1–R0.19.3 in the supplier contract, §5.1 route/Needs and Layer 5 dependencies. No Layer 4 prerequisite was added.

## F08 (P3) — applied

AdicSpaces §§3–5 → §§2–5 in the supplier contract and Layer 1 dependencies. Proposition 8.7's statement/proof → p. 306 in both §5.3 citations: SCH12 line 2458 through line 2492 precede the p. 307 marker. FS94 manifest coverage → Conventions, §0.6 and Layer 6. Existing source keys and version metadata remain unchanged.

## F09 (P3) — applied

Repeated trailing paragraphs → deletion in all twelve cited subsections, and §§2.1–2.3, 3.2–3.4, 3.7, 5.1–5.2. Kept every Check and API list. The powered nonzero-degree observation in §0.6 is retained in its ℙ¹ Check; its general form remains in §5.3's route. Unique caveats and §6.1's basis-independence statement remain.

## Validation outcomes

- Required absolute-path elaboration of `packages/AnalyticToricGeometryPartII/Suggested.lean`, from the content checkout: **exit 0, no output**. No TauCeti module is imported, so no object-file build was required. No Lean process remains running.
- Mechanical declaration inventory and binder audit: **zero declarations**. Generated one scratch signature-check module with `import Mathlib` and one `#check @name` per declaration (there are none); elaboration: **exit 0, no output**. Comparison with README is empty on both sides. No binders, docstrings, Lean names or headline signatures changed. There are no one-tactic sorried declarations to remove.
- The headline inventory in the module docstring still covers Layers 0–6, including all five comparisons and the approximation endpoints. Their missing carriers were rechecked at the pins; no headline became statable through these prose/citation repairs.
- Dependency direction check, with the requested name, order and `--movable`: **exit 0**, exact output:

```text
depcheck: 48 roadmaps, 537 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The change introduces no later supplier.

- Citation resolver: **exit 0**; cross-roadmap citations found nowhere: **None**; Lean names found nowhere: **None**. It checked main b41e47b and the 352-head index dated 2026-10-25T02:57:03Z. Its message that pinned Lake packages were unavailable to the resolver was treated as a tool limitation: library declarations were separately inspected in the pinned checkout, not certified by that message.
- README/plan contract audit: **8 gaps**, each with exactly one identical “What Supplier must provide” sentence and the same slug. Both superseded slugs are absent from README and the top-level gaps. Every other top-level plan value is identical to its starting value.
- Final structural audit: **29 target subsections, each with at least three Check bullets**; all eight gap sentences match; JSON and TOML parse; no forbidden path or option was added; `git diff --check`: **exit 0**. Only README, sources, the plan gaps and this report changed.
- No gate failures were supplied in this brief. No source is missing or needs fetching: all four cited works have certified legal cached texts and their existing manifest keys were reused.

## Evidence and ownership audit

Mathlib HEAD and the manifest agree at 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti HEAD and the manifest agree at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Main is b41e47bc34e30def0db01d84cc92062ed72c6e68. The three cited new-roadmap heads are ClassicalAdicEtaleCohomology dfcb6b7, ShimuraCompactifications 63e3f03 and WeilConjectures d90e186, confirmed against the supplied index.

The decisive supplier passages were read, rather than inferred from matching names:

| Contract | Exact evidence and boundary |
| --- | --- |
| Valuation proper specialization | `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:3143`, §6.2: proper X over a strictly henselian valuation ring with separably closed fraction field; natural derived generic/nearby-special comparison. The ensuing valuation-base-change statement requires a surjection on valuation spectra; isometric extensions of the rank-one algebraically closed valued fields here have this property. |
| Smooth ULA | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:540`, §F.2.3: smooth ULA for finite lisse invertible coefficients, strict-local comparisons and base-change stability, without a noetherian-base restriction. Constant Λ is finite lisse here. |
| Wrong original valuation locator | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3867`, §2.15: Gabber's affine theorem, Galois comparison, limits and Hochschild–Serre, rather than the needed smooth-proper specialization. |
| Localized support | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:6818`, §5.5: refined Gysin for a regular closed immersion and arbitrary base-change map; values lie on the fibre product. The same paragraph supplies excess, Chern commutation and self-intersection; preceding zero-section/homotopy-invariance comparison supplies the top-Chern pushforward. No regularity of the new common zero scheme is assumed. |
| Remaining positivity and cuts | SchemeAndStackFoundations §§5.3–5.4 supply Chern operations but not the stated general ample-degree positivity export. §4.13's Bertini smoothness theorem assumes a smooth scheme and an immersive linear system; arbitrary possibly nonreduced W and component-avoiding cuts are the narrower, separate missing export recorded here. |
| Closed face maps | `TauCetiRoadmap/ShimuraCompactifications/README.md:498` and line 513, C0.6–C0.7: coefficient compatibility for face projection and off-face ideal. |
| Open face maps and gluing | The same roadmap line 568, C0.9: ordinary localization at an exposing monomial; line 747, C0.16: arbitrary-ring finite-fan scheme and coherent coefficient change. C0.17–C0.18 supply properness and regular boundary coordinates. |
| Completed colimit | `TauCetiRoadmap/PerfectoidSpaces/README.md:16687`, within P7.11: completed-colimit criterion, compatible rings/ideals of definition, sheafy finite stages and perfectoid completion. `TauCetiRoadmap/AdicSpacesPartII/README.md:8136`, R0.20.1, also records finite-stage detection for powers of the ideal. Isometric monomial embeddings give that detection here. |
| Residue-field relation | PerfectoidSpaces P7.3 defines it; P7.15, line 17140, converts a chart-density perfectoid tilde-limit with qcqs locally noetherian analytic levels. SCH12 line 2317 uses residue-field density, not chart-density. |
| Constructible compactness | AdicSpacesPartII R0.19.1, line 7466, gives profiniteness of a spectral space's constructible topology; R0.19.2–R0.19.3 give pro-constructible closedness and specialization calculus. |
| Affinoid spectra | `TauCetiRoadmap/AdicSpaces/README.md:354`, Layer 2, contains Spa and rational subsets; Layers 3–5 supply the remaining localization, sheaf and gluing infrastructure. |

All other cross-roadmap locators were re-resolved against those heads or main: AnalyticToricGeometry Layer 0; AdicSpacesPartII R0/R1 including R1.3/R1.6; AdicSpacesPartIII R2.2–R2.4/R2.8/R2.10; PerfectoidSpaces P1.30, P2.1–P2.12, P3.18/P3.20 and P7.1–P7.15 as cited; AdicEtaleGeometry A1.6; SchemeAndStackFoundations §§0.7/0.17/0.18/0.23a/0.29/2.1/2.2/3.4/4.13/5.1–5.6; ClassicalAdicEtaleCohomology §§1.1/6.2/8.2; EtaleCohomologyFoundations §F.2.3; WeilConjectures WC.6. AnalyticToricGeometry, AdicSpaces and AdicSpacesPartIII were also read as main-branch shape examples.

Pinned objects were inspected by object as well as name. `AddMonoidAlgebra` is in `Mathlib/Algebra/MonoidAlgebra/Defs.lean:64`; exponent functoriality is `MonoidAlgebra.mapDomainRingHom` in `Mathlib/Algebra/MonoidAlgebra/MapDomain.lean:285`; `ZeroAtInftyContinuousMap` in `Mathlib/Topology/ContinuousMap/ZeroAtInfty.lean:45` only bundles continuity and convergence along cocompact, rather than a discrete normed convolution algebra. `PointedCone` and `ConvexCone.Salient` were checked in their cone modules. Tau Ceti's `Fan` in `TauCeti/Geometry/Toric/Algebraic/Fan/Basic.lean:83` does not require a nonempty cone family; `IsToricCone` in `TauCeti/Geometry/Toric/Algebraic/Cone/Basic.lean:147` explicitly requires salience. Primitive generators and dual-semigroup finite generation remain the parent's pinned imports.

The native Weil-divisor carrier, order system and sheaf were inspected in `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Basic.lean:46`, `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Principal.lean:126` and `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Sheaf.lean:250`. The sheaf's integral, locally noetherian and codimension-one DVR hypotheses occur at lines 75–82; the linear-equivalence comparison at line 642 additionally uses the noetherian hypothesis. These hold on the specified normal toric field fibres. `PreAdicSpace.isAdic` and `AdicSpace` in `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:206` and line 243 supply the ambient category, without perfectoidness or a toric model. The actual fan scheme at `TauCeti/Geometry/Toric/Algebraic/Fan/Scheme.lean:136` uses `affineCoordinateRing`, whose coefficients are ℂ (`TauCeti/Geometry/Toric/Algebraic/AffineScheme.lean:60`). Searches of both pins find no arbitrary-coefficient fan scheme, operational Chow theory, perfectoid-space carrier, toric analytification or tilde-limit carrier that would make the missing headlines statable by a few simple definitions.

Ownership searches used the provided `roadmaps list`, `roadmaps grep` and `roadmaps show` tools, plus the board packages. Searches by toric perfectoid spaces, Minkowski weights, fan displacement, operational Chow groups, valuation smooth-proper comparison, degree positivity and geometric component cuts found no competing owner for the toric specializations retained here. The related AInfCohomology and PadicHodgeTheory hits concern framed root covers and coefficient sheaves, not these finite-fan comparison and approximation endpoints. General algebraic and perfectoid constructions retain their named suppliers. The new positivity/cutting contracts are supplier gaps, not assertions that another roadmap has already added targets. No sibling or supplier file was edited.

Legal-source checks used SCH12's published text, FS94's arXiv v1, FS25's author version 0.27 and STACKS's Varieties chapter. Relevant anchors are SCH12 line 91, line 186, line 271, line 1344, line 1752, line 2317, line 2335, line 2344, line 2349 and line 2381 through line 2506; FS94 line 117, line 176, line 198, line 235, line 373, line 393 and line 491 through line 509; FS25 line 299 through line 322; STACKS line 223 and line 229. No source passage was copied into the package or report.

## Adversarial mathematics pass

The tables give one row per distinct mathematical statement, including definitions and API laws; repeated formulations of a statement share that statement's row. Values are mathematical computations, not claims that a sorry build proves the result. Write r=∣ϖ∣ with 0<r<1. In unchanged rows, “retained” means the computation did not require changing the statement. Every altered route and newly written contract is included. All Checks and worked examples using the same objects were recomputed with these conventions.

| Statement | Instances tried | Values on the two sides / negative control | Result | Change |
| --- | --- | --- | --- | --- |
| Nonempty salient finite-fan convention | Rank 0; positive ray; whole real line | Zero cone has span dimension 0 and realization Spec k; positive ray intersects its negative in {0}; the whole line intersects its negative in ℝ≠{0} | Salience and nonemptiness are independent | Retained explicit restrictions |
| Regularity versus simpliciality | Rays (1,0),(1,2) | Determinant 2≠±1, although both rays are primitive | Simplicial does not imply regular | Retained |
| Completeness versus projectivity | FS25's ten maximal cones | Determinants in source order: 1,−1,1,1,−1,−1,1,−1,1,−1; the three primitive-relation sides are respectively (0,0,−1), (−1,0,0), (0,−1,0) on both sides. Summing strict ample inequalities gives 0>0 | Smooth complete nonprojective fixture is consistent | Retained supplier-owned fixture |
| Principal-divisor convention | ℙ¹, t and t⁻¹ | Ray orders (1,−1) and (−1,1); inverse signs exchange zero and infinity | Positive-zero convention fixed | FS94 equation locator corrected |
| Section-generator versus equation weights | O(D₋) on ℙ¹ | Section weights (0,1); equation weights (0,−1); first/second frame ratio 1/t=t⁻¹ | Opposite weights are necessary | Explicit conversion in §6.1 |
| Arbitrary coefficient convention | k[ε]/ε²; zero ring | Constant coefficient ε remains nonzero with ε²=0; over the zero ring every coefficient is 0 | No reducedness or nonzero-ring hypothesis inserted | Retained |
| p-local coefficients | p=2 and p=3 | 1/2∈ℤ[1/2], 1/3∉ℤ[1/2]; 1/3∈ℤ[1/3], 1/2∉ℤ[1/3] | Localizing at p alone is required | Retained |
| Pseudouniformizer normalization | Characteristic p; p=2, ε=1/2 | In characteristic p, p=0=ϖᵖ·0; error factor r^(1/2)<1; ϖ≠0 since r>0 | Divisibility and strict error bound compatible | Retained |
| Fractional bounds at all valuation ranks | c=1/2; valuation of ϖ=(1,0) additively | 2v(f)≥v(ϖ) is the defining inequality; v(f)=(0,1) fails it, while f=0 satisfies every threshold | No real-valued restriction or division by a value-group element | Retained |
| Sharp and its direction | Mixed p=2; equal characteristic p; 0,1 | (1+1)♯=0 but 1♯+1♯=2 in mixed characteristic; equal-characteristic sharp=id; 0♯=0 and 1♯=1 | Additivity cannot be imported in mixed characteristic | Retained |
| Cohomological coefficients and degrees | Point, Λ=ℤ/3, i=−1,0,1 | Cohomology values 0, Λ, 0; m=0 would instead give the zero coefficient ring | m≥1 and prime-to-p convention coherent | Retained |
| Universe convention | Rank-zero point; arbitrary allowed coefficient field | The chosen point/chart belongs to the small universe; its sheaf category is formed in the next; no finite-cardinality condition occurs | Universe enlargement preserves the same one-point geometry | Retained |
| Toric field-fibre supplier gap | Positive ray; dual-number base | k[t] is integral and has boundary prime (t); (k[ε]/ε²)[t] contains ε≠0 with ε²=0 | Normality is only claimed on field fibres | Retained gap |
| Perfected cone supplier gap, including lineality | C=ℝ≥0; C=ℝ; C={0} in rank 0 | Exponent sets ℤ[1/p]≥0, ℤ[1/p], {0}; t⁻¹ occurs only in the lineality example; rank-zero algebra is K | Disc-only replacement loses lineality | Retained gap |
| Homogeneous-cone approximation gap | Degree-one monomial; f=ϖ²χᵘ, p=2, c=0 | Exact monomial has error 0; g=0 for the second has error r²≤r^(1/2), but refined c′>2 requires r²≤r^(5/2), false | Estimate alone need not force nonzero output | Gap consumed only in §5.2 |
| Finite split-orbit operational duality gap | Spec k; Spec ℂ over ℝ | Degree evaluation is multiplication by 1 for Spec k and by 2 for Spec ℂ/ℝ; the latter is not an isomorphism ℤ→ℤ | Split orbit condition distinguishes the false model | Retained gap |
| Ample-degree positivity gap | ℙ², H=O(2), V=ℙ²; d=0 rational point | Degree (2h)² is 4>0; degree of a rational point is 1>0; the zero cycle has degree 0 | Nonzero effectivity is essential; arbitrary dimensions retained | Split from compound gap |
| Generic ample-cut gap | W=ℙ²; W=double line; W a point | A line cut has dimensions 1 and 0 respectively and degrees 1 and 2; a point admits an empty cut, so d>0 is essential | Smoothness/reducedness not needed; positive dimension is | Separate gap with explicit embedding |
| Geometric-morphism cup pullback gap | Identity map on point, Λ=ℤ/3 | Pullback sends 1·2=2 to 1·2=2; composition of two identities sends 2 to 2 | Identity, composition and cup normalization fixed | Retained gap |
| Split-torus divisor gap | k[t,t⁻¹], t and t−1 | t·t⁻¹=1 so div(t)=0 on the torus; t−1 vanishes at 1 and is not a unit | Units must be scalar monomials, not all Laurent polynomials | Retained gap |

| Statement | Instances tried | Values on the two sides / negative control | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 invariant-divisor map | ℙ¹, coefficient vectors (1,0),(2,0); zero-cone fan | Coefficients at D₊ are 1 and 2; outside boundary they are 0; with no rays the domain and image are 0 | Multiplicity and injectivity witnesses hold | Closed-face supplier clarified |
| §0.1 character-order law | t² on ℙ¹ | Pairings with rays ±1 are 2,−2, equal to div(t²)'s coefficients | Correct sign and integer multiplicity | Retained |
| §0.1 closed versus open face maps | Positive ray and zero cone | k[t]→k sends t↦0; k[t]→k[t,t⁻¹] sends t to a unit with inverse t⁻¹ | Quotient and localization have different codomains | Added README Check |
| §0.2 global weight definition | d=0,1,2,−1 on ℙ¹ | W(dD₋) is {0}, {0,1}, {0,1,2}, ∅ respectively; zero-cone W(0)=M | Zero/negative degree and torus distinguished | Retained |
| §0.2 local weight module | Positive ray, D=−D₊ | Wσ={u≥1}=1+ℕ; 1+2=3 remains allowed; 0 is excluded | A monoid action does not make W a monoid | Retained |
| §0.2 principal translation | D=D₋ and m=1 on ℙ¹ | D+div(t)=D₊; W(D₊)={−1,0}={0,1}−1 | Both directions of the weight equality hold | Retained |
| §0.2 addition of admissible weights | D=E=D₋, weights 0 and 1 | 0+1=1∈W(2D₋)={0,1,2} | Correct target divisor | Retained |
| §0.3 monomial-section definition | ℙ¹, d=2, d=−1, A=0 | Sections A⊕At⊕At²; 0; 0 respectively | Free support preserves arbitrary coefficients | Localization citations repaired |
| §0.3 Cartier versus divisorial interpretation | Regular ray; singular determinant-two cone | The ray module generated by t is free rank 1 after translation; singular-ray coefficient data need not solve an integral Cartier equation (e.g. 2y=−1) | Invertibility is not claimed without Cartier data | Retained |
| §0.3 coefficient extensionality | f=1+2t and g=1+3t over ℤ | Constant coefficients both 1; t-coefficients 2≠3, hence f≠g; equal lists give the same finite sum | Both directions hold | Retained |
| §0.3 tensor base change | ℤ→ℤ/2, d=1; ℤ/4→ℤ/2 | (ℤ/2)⊗ℤ ℤ²=(ℤ/2)²; coefficient 2 maps to 0 on both coefficient-change paths | No flatness requirement | Retained |
| §0.3 convolution and target | (1+t)∈S(D₋), (1−t)∈S(D₋) | Product 1−t²∈S(2D₋); coefficient at t is −1+1=0 | Product adds divisors and sums weights | Retained |
| §0.3 multiplication is not an isomorphism | O(1) on ℙ¹ | Source tensor rank 4, target O(2) rank 3; t⊗1−1⊗t maps to 0 | No accidental tensor-product isomorphism | Retained |
| §0.3 associativity/unit | Monomials 2χ⁰,3χ¹,5χ¹ | Both parenthesizations give 30χ²; multiplying by 1χ⁰ gives the original coefficient and weight | Algebra laws agree with convolution | Retained |
| §0.4 invariant representative | x² on A¹; [a] on ℙ¹, a≠0 | Order of x² is 2; div(t−a)=[a]−D₋, so [a] and D₋ have equal class of degree 1 | Reduction would lose multiplicity | Duplicate paragraph deleted |
| §0.5 integral frames/transition | O(2D₋), D=0 | Weights 0,2 give transition t⁻²; D=0 gives transition 1; t⁻²·t²=1 | Correct frame direction | Retained |
| §0.5 triple cocycle | Local weights 0,1,2 | t^(0−1)t^(1−2)=t⁻²=t^(0−2) | Triple-overlap law excludes arbitrary rescaling maps | Retained |
| §0.5 frame norms and section scale | Integral unit u; scalar ϖ | ∣u∣≤1 and ∣u⁻¹∣≤1 imply ∣u∣=1; multiplying f by ϖ changes its norm to r∣f∣ | Integral frames preserve bounds; arbitrary scalars do not | Retained |
| §0.5 coefficient change | O(D₋) over ℤ/4→ℤ/2 | Frames 1,t and transition t⁻¹ survive; the scalar 2 alone becomes 0 | Bundle gluing commutes with nonflat change | Retained |
| §0.6 class-group presentation | ℙ¹ | u↦(u,−u); (a,b)↦a+b; kernel={(u,−u)} and cokernel ℤ | Exactness in both directions | Retained |
| §0.6 principal iff character | ℙ¹ vectors (2,−2) and (1,0) | First is div(t²) with degree 0; second has degree 1 and is not principal | Converse and forward direction distinguished | Retained |
| §0.6 first map may have kernel | Rank-one zero-cone fan | ℤ→0 has kernel ℤ; Cl=0 | Incomplete case does not force injectivity | Retained |
| §0.6 complete regular Picard freeness | ℙ¹; incomplete separate rays (1,0),(1,2) | Quotients ℤ and ℤ/2; determinant of the latter character matrix is 2 | Completeness is needed for asserted freeness | Duplicate moved into Check |
| §0.6 nonzero effective class under powering | d=1 and p=2, N=2 on ℙ¹ | Degree 1 becomes 4 over either field; neither is 0 | Positive powered class stays nontrivial | Observation retained in Check and §5.3 route |

| Statement | Instances tried | Values on the two sides / negative control | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 unit-model definition | Positive ray; rank-one zero cone; ℙ¹ | Charts are K⟨t⟩; K⟨t,t⁻¹⟩; two discs with overlap ∣t∣=1 | Unit model retains its intended carrier | C0.9/C0.16 citations |
| §1.1 Gauss multiplicativity/plus ring | (1+ϖt)(1−ϖt), t, ϖ⁻¹ | Product 1−ϖ²t² has norm 1=1·1; ∥t∥=1 and ∥ϖ⁻¹∥=r⁻¹>1 | Plus ring excludes the unbounded scalar | Retained |
| §1.1 face overlap | Positive-ray face τ=0 | Formal inversion requires ∣t∣≤1 and ∣t⁻¹∣≤1, hence ∣t∣=1; algebraic inversion alone allows ∣t∣=r<1 | Entire analytic torus is too large | Open-localization ownership repaired |
| §1.1 valued-field base change | Rank-zero point; disc K→L | Completed coefficients become L and L⟨t⟩; the monomial t still has Gauss norm 1 | Chart maps and integral frames preserved | Retained |
| §1.2 analytification comparison | A¹ at t=ϖ⁻¹; ℙ¹ | r⁻¹>1 excludes the point from the disc; its inverse has norm r<1 in the second ℙ¹ chart | Complete fan gives equality; incomplete need not | Duplicate paragraph deleted |
| §1.2 completeness without projectivity | FS25 model | Ten regular maximal cones remain ten unit charts; the three ample inequalities sum to 0>0 while properness follows from complete support | Projectivity not inserted | Retained |
| §1.3 coefficient-linear power map | q=1,2,3 on χ²; coefficient a | χ²,χ⁴,χ⁶; a remains a at every q | Exponents multiply, coefficients fixed | C0.9/C0.16 citations |
| §1.3 composition/unit | q=2,r=3 and t | (t³)²=t⁶; q=1 gives t | Correct composition law | Retained |
| §1.3 stratum preservation | Origin on A¹, q=1,2,0 | t↦t and t↦t² preserve 0; t↦1 sends origin to 1 | q≥1 is essential | Retained |
| §1.3 Frobenius twist | p=2, a∈𝔽₄ with a²=a+1 | φ₂(a)=a; absolute Frobenius(a)=a+1≠a | Relative coefficient-linear map is the one used | Retained |
| §1.3 divisor pullback | D₊ on ℙ¹, q=2 | Zero divisor of t² is 2D₊; section weight 1 becomes 2 | Pullback scaling fixed | Retained |
| §2.1 perfected chart definition | Disc; unit torus; rank 0 | Exponents ℤ[1/p]≥0; ℤ[1/p]; {0}; rank-zero algebra K | Arbitrary cone generality retained | Unused approximation gap deleted |
| §2.1 compatible projections | p=2,n=1 and monomial t | pr₁*(t)=t^(1/2); pr₂*(t²)=t^(2/4)=t^(1/2) | φ∘pr₂=pr₁ | Retained |
| §2.1 field/fan functoriality | Character exponent map u↦2u; K→L | Both orders send cχ^(u/pⁿ) to image(c)χ^(2u/pⁿ) | Construction and projections commute | Retained |
| §2.2 perfected weights | ℙ¹, D=D₋, p=2 | 0,1/2,1/4,1 are allowed; 2 and −1 are excluded | Rational ray inequalities are correct | Retained |
| §2.2 c₀ definition/norm | Coefficients ϖⁿ at 1/pⁿ; all coefficients 1 | First tail norm r^(N+1)→0; second tail norm 1 for every N | Unrestricted product is a wrong model | Duplicate warning deleted |
| §2.2 complete-fan degree-zero sections | ℙ¹, D=0; zero-cone incomplete fan | Only u=0 survives both u≥0 and −u≥0; incomplete zero cone admits u=1 | Complete-fan section space K | Retained |
| §2.2 coefficient extensionality/singletons | 3χ^(1/p) and 2χ^(1/p) | At 1/p coefficients are 3 and 2; all other coefficients 0 | Coefficients determine sections | Retained |
| §2.2 dense monomials/complete target | Sum ϖⁿχ^(1/pⁿ) | Truncation error r^(N+1); full limit has infinitely many nonzero coefficients and is absent from the finite span | Completeness needed for extension theorem | Retained |
| §2.2 bounded extension uniqueness | Coefficient evaluation at weight 0 | On any finite sum it returns f₀ and satisfies ∣f₀∣≤∥f∥; on the c₀ limit it still returns f₀ | Continuity fixes the extension | Retained |
| §2.2 convolution coefficients | χ⁰∈Ŝ(D₋),χ¹∈Ŝ(D₋) | Coefficient of weight 1 in product is 1·1=1; pointwise coefficient product would be 0 | Disjoint supports must still multiply | Retained |
| §2.2 summability/norm bound | Coefficients ϖⁿ and ϖᵐ | Product coefficients have norm r^(n+m); for fixed rᴺ only pairs n+m≤N occur, finitely many | Convergent convolution has the stated bound | Retained |
| §2.2 denominator clearing includes divisor | p=2,D=(1/4)D₋, weight 0 | One square leaves (1/2)D₋; two leave D₋; weight was already integral throughout | Weights alone are insufficient | Retained |
| §2.3 divisor-cone definition/degree fibre | ℙ¹,D=D₋,j=1,0,−1 | Inequalities 0≤u≤j give [0,1]∩ℤ[1/p], {0}, ∅ | Negative degrees not silently removed | Retained |
| §2.3 negative degree for D=0 | Complete fan, j=−1 | (0,−1) is allowed since every ray inequality is 0≥0 | Degree zero K does not imply total algebra K | Retained |
| §2.3 addition and division by p | p=2, pairs (0,1),(1,1) | Sum (1,2) satisfies 0≤1≤2; half (1/2,1) satisfies 0≤1/2≤1 | Cone and p-divisibility laws hold | Retained |
| §2.3 principal-divisor translation | D=D₋, D′=D₊, m=1 | (u,j)↦(u−j,j) sends 0≤u≤j to −j≤u−j≤0; inverse adds j | Graded monoid isomorphism in both directions | Retained |
| §2.4 Gauss completed grading | ℙ¹,D=D₋ | (u,j)↦(u,j−u) has inverse (a,b)↦(a,a+b); degree a+b=j | Exact two-variable perfected algebra | Unused estimate removed from route |
| §2.4 c₀ outer direct sum | Coefficient 1 at (0,j) for infinitely many j | Every finite-degree truncation leaves norm-1 terms; error is 1 | Product completion would be wrong | Retained |
| §2.4 degree-zero and tilt/sharp | D=0 complete; characteristic p | R_D=K⟨z^(±1/p∞)⟩; its degree-zero part K; sharp(z)=z has degree 1 | Total and degree-zero algebra distinguished | Estimate used only in §5.2 |
| §2.4 multiplication/singletons | D=0, monomials (0,1),(0,−1) | Product χ^(0,0) has coefficient 1 and degree 0=1+(−1); pointwise product 0 | Convolution adds both character and degree | Retained |
| §2.4 convolution norm | 2χ^(0,1),3χ^(0,−1) | Product 6χ^(0,0); ∣6∣=∣2∣∣3∣ | Norm bound exact for monomials | Retained |

| Statement | Instances tried | Values on the two sides / negative control | Result | Change |
| --- | --- | --- | --- | --- |
| §3.1 toric tilt | Positive ray; unit torus; rank 0 in characteristic p | Tilted coefficient field is K♭, exponent sets stay ℤ[1/p]≥0 or ℤ[1/p]; rank-zero tilt equals Spa(K,K°) under canonical identification | Tilt of T over K is T over K♭ | Fixed non-tautological notation |
| §3.2 completed-colimit tilde-limit | Disc, stages n and n+1 | t at n maps to t^(1/pⁿ); tᵖ at n+1 maps to the same exponent p/p^(n+1)=1/pⁿ | Exponent orientation correct | Correct theorem locators |
| §3.2 density and integral detection | f=ϖ²t at any stage; a c₀ series | ∥f∥=r² before and after embedding; f∈ϖ²A° but f∉ϖ³A° at both stages; series tail norm tends to 0 | Shared ideal powers and density verified | Explicit finite-stage detection |
| §3.2 topological and residue-field relations | Constant rank-zero tower | Limit is one point; colimit of its rings and residue fields is K, dense in K | Both relations hold, but definitions remain distinct | Clarified SCH12 relation |
| §3.3 inverse-limit homeomorphism | Coordinate x, x=0,1,∞ | ((x^(1/pⁿ))♯)ᵖ at n+1 equals (x^(1/pⁿ))♯ at n; 0,1,∞ give constant towers | Boundary strata and direction preserved | Duplicate paragraph deleted |
| §3.3 characteristic-p perfection | x∈K perfect of characteristic p | x has the unique sequence x,x^(1/p),x^(1/p²),…; zero has the unique zero sequence | No extra root branch | Retained |
| §3.4 level-zero projection | Classical x=0,1; strata 0,∞ | π(0)=0,π(1)=1,π(∞)=∞; tower evaluation returns its zeroth coordinate | Correct continuous-map direction | Retained |
| §3.4 projective sharp well-definedness | Coordinates (1,x), scalar λ≠0 | (λ,λx)♯=λ♯(1,x♯), giving the same projective point; λ♯≠0 | Multiplicativity supplies scalar independence | Retained |
| §3.4 φ commutation | Character x, p=2 | (x²)♯=(x♯)² | π∘φ=φ∘π | Retained |
| §3.4 field naturality and open pullback | K→L, x=1 and coordinate monomial | Embedded 1♯=1=(embedded 1)♯; for χᵘ both paths use the identical embedded coefficient and exponent u | Base-change diagrams have the same maps | Retained |
| §3.4 mixed/equal-characteristic line test | p=2, [1:1:0] | Tilted sum 0; sharp coordinate sum 2≠0 in mixed characteristic; equal-characteristic sum remains 0 | No additive transport of arbitrary equations | Retained |
| §3.5 étale-topos limit | Rank-zero algebraically closed point; finite cover with two sheets | Finite étale algebras K×K and K♭×K♭ each have two sheets; zero-sheet algebra is the empty object | Same site normalization | P7.15 conversion locator corrected |
| §3.5 inseparable invariance | Characteristic-p torus, t↦tᵖ | Generic residue-field extension has inseparable degree p and separable degree 1; it adds zero separable root branches | Does not create a finite étale p-cover | Retained |
| §3.6 open restriction/commuting square | U=∅; U=whole space | Preimages ∅ and whole space; sheaves on ∅ form a one-object category up to unique isomorphism; full restriction is identity | Both extremes agree with global projection | Retained |
| §3.6 changing finite-level opens | U:∣t−ϖ∣≤r², t=ϖ | Initial difference 0≤r²; after φ_p difference ∣ϖᵖ−ϖ∣=r>r² | φ-stability is unnecessary and generally false | Duplicate paragraph deleted |
| §3.7 full affine-line endpoint | t=ϖ⁻¹; 0,1,∞ | r⁻¹>1 retains the point in A¹ but not the unit disc; 0 and 1 remain; ∞ is deleted at every level | Full line statement is stronger than disc instance | Duplicate paragraph deleted |
| §4.1 valuation specialization | ℙ¹ over nondiscrete O_C; ℓ≠p | Generic and special (H⁰,H¹,H²(Λ(1)))=(Λ,0,Λ); RΨΛ=Λ | Existing proper specialization plus smooth ULA suffice | Deleted redundant gap |
| §4.1 power pullback | p=2,ℓ=3,m=1; rank-zero point | On ℙ¹ generator: 1↦2 with inverse 2↦1; point H⁰ map 1↦1, higher groups 0 | Automorphism need not be identity | Strengthened specialization Check |
| §4.1 excluded coefficient range | Mixed characteristic, p=ℓ=2,m=1 | On generic ℙ¹ H²(ℤ/2(1)), 1↦0, which has no inverse | Prime-to-p hypothesis essential | Retained |
| §4.2 π cohomology comparison | ℙ¹, p=2,Λ=ℤ/3 | Tower generator sequence 1,2,1,2,…; identify stage n by inverse multiplication 2ⁿ, giving constant colimit Λ and level-zero identity under this identification | Colimit is not the quotient by p−1 | Supplier route corrected |
| §4.2 cup and automorphism naturality | Unit 1 and hyperplane class h | 1∪h=h before and after π*; σ* h=h in twisted H² | Cup and field compatibility use the declared geometric-morphism gap | Explicit specialization inputs |
| §4.2 negative degrees | i=−1 | Both cohomology groups 0 and the unique map 0→0 is invertible | No suppressed inverse-limit claim | Retained |

| Statement | Instances tried | Values on the two sides / negative control | Result | Change |
| --- | --- | --- | --- | --- |
| §5.1 section-tube definition | f=t,c=1; c=1/2 | N₁ has radius r, so 0 belongs and 1 does not; N_(1/2) is t² bounded by r | Denominator ϖ is nonzero; fractional bound defined | Added constructible supplier |
| §5.1 cofinality | U:∣t∣≤r on the disc; empty family | N₂ has radius r²<r and lies in U; empty family gives X and its only containing open is X | Strictly finer c can be chosen | Retained |
| §5.1 nonreduced and rescaling laws | f=t²,threshold 2c; f replaced by ϖf | ∣t²∣≤r^(2c) iff ∣t∣≤rᶜ; r∣f∣≤rᶜ iff ∣f∣≤r^(c−1) | Same support alone does not fix the tube | Duplicate paragraph deleted |
| §5.1 constructible finite-intersection route | Unit-disc point t=1; t=0 | t=1 misses every N_c with c>0; t=0 belongs to every N_c; intersection is the zero locus in this example | Compactness applied to complement of U, not an arbitrary noncompact cover | R0.19.1–R0.19.3 supplied |
| §5.2 homogeneous estimate and bounded maxima | f=χᵘ,g=χᵘ | Error 0; max(∣f∣,rᶜ)=max(∣g♯∣,rᶜ) pointwise | Exact monomial fixes sharp/degree normalization | Estimate remains in this layer |
| §5.2 nonzero refinement | f=ϖ²χᵘ,p=2,ε=1/2 | At c=0, r²≤r^(1/2) permits g=0; c′>2 requires r²≤r^(5/2), false | Refined Gauss threshold excludes zero | Duplicate paragraph deleted |
| §5.2 chart monomial map | ℙ¹,D=D₋,j=1,u=1/2 | Positive chart exponent 1/2−0=1/2; negative-chart character exponent 1/2−1=−1/2, regular in t⁻¹ | Map lands in both correct cone monoids | Retained |
| §5.2 perturbation retains nonzero coefficient | b≠0 and ∣b−b′∣<∣b∣ | Ultrametric equality gives ∣b′∣=∣b∣>0; b′=0 would make the error ∣b∣ | Nonzero equation retained without root extraction | Retained |
| §5.2 dense-field denominator clearing | p=2,g₀=a+b t^(1/2),b≠0 | g₀²=a²+b²t; cross coefficient 2ab=0; divisor degree 1 becomes 2; coefficients remain in k₀ | Works over imperfect k₀ | Retained |
| §5.2 zero-locus containment | h=g₀^(pᴺ) | h(x)=0 iff g₀(x)=0 for a field-valued point; 0≤rᶜ | Powering preserves support inside the pulled-back tube | Retained |
| §5.3 hypersurface endpoint | Line in ℙ²; doubled line; rank-zero fan | Divisor classes 1→pᴺ and 2→2pᴺ stay nonzero; rank-zero nonzero scalar has empty zero locus and fails the input | Output cannot be empty or whole space | p. 306 locator and duplicate cleanup |
| §5.3 no projectivity requirement | Nonempty effective divisor on FS25 model | Proper geometrically integral model has only constant global functions; a nonempty effective principal divisor would have degree-zero class and come from a constant, whose nonzero divisor is 0, contradiction | Torsion-free Picard argument still applies | Retained source-owned nonprojective Check |
| §6.1 balanced-weight definition | ℙ¹ codimension 0 weights a,b | Balancing is a−b=0, so (1,1) belongs and (1,0) does not | Kernel and membership equivalence hold | Sign translation added |
| §6.1 character-basis independence | ℙ¹ annihilator generator 1 versus −1 | Rows [1,−1] and [−1,1] have the same kernel {(a,a)} | Changing bases changes matrix, not the object | Retained unique paragraph |
| §6.1 cone-value extensionality | ℙ¹ weights (1,1),(2,2) | Their values at either maximal cone differ by 1; equal cone values give identical functions | Equality iff all values agree | Retained |
| §6.1 rank-two balance | ℙ¹×ℙ¹ ray order +e₁,+e₂,−e₁,−e₂ | (1,0,1,0) gives (0,0); (1,0,0,0) gives (1,0) | Correct relations and negative control | Retained |
| §6.1 operational Chow identification | ℙ¹, j=0,1 | MW⁰=ℤ via (a,a); MW¹=ℤ at the zero cone, matching A⁰ and A¹ | Operational, not arbitrary cycle ring | Retained general complete-fan target |
| §6.1 Cartier wall law | O(D₋) on ℙ¹ | u₊−u₋=0−(−1)=1; m₋−m₊=1−0=1=c·b₊ with b₊=1 | FS94 and section conventions agree | Explicit u=−m conversion |
| §6.2 fan-displacement product | ℙ¹×ℙ¹, O(2,0),O(1,1) and O(1,0)² | 2·1+0·1=2; 1·0+0·1=0 | Coordinatewise degree multiplication is false | Duplicate paragraph deleted |
| §6.2 quotient direction | Rank-two fan, γ a ray | dim(N/Nγ)=1; projection of every vector in Nγ is 0 | Displace in the quotient, not the ray's own line | Retained |
| §6.2 lattice multiplicity | (1,0),(1,2); rank 0 | Index is ∣det∣=2; rank-zero empty-product degree 1 | Finite lattice index is essential | Retained |
| §6.2 coefficient independence | O(a,b)·O(c,d), over fields of characteristics 0,2,3 | Degree is the same integer ad+bc; for (2,0),(1,1), all three give 2, not 0 in characteristic 2 | Degrees remain integers, not field scalars | Removed unused positivity prerequisite |
| §6.3 positive complete-intersection degree | Y two disjoint ruling fibres, H=O(1,1),c=1 | Degree (2,0)·(1,1)=2; support has two components of dimension 1 | Positive degree does not force connectedness | Exact positivity gap supplied |
| §6.3 scaling divisor classes | Two lines in ℙ², p=2,N₁=1,N₂=2 | Initial degree 1; powered degree 2·4=8=2^(1+2) | Multiplicative scaling, not additive | Retained |
| §6.3 localized top-Chern support | ℙ²,E=O(1)⊕O(1),s=(ℓ,ℓ) | Z(s)=L,dim=1; excess quotient O(1) on L; 0_s^![ℙ²]=c₁(O(1))∩[L] has degree 1 | Excess support still excludes emptiness | Existing refined-Gysin supplier replaces gap clause |
| §6.3 arbitrary sections and top-Chern pushforward | Two independent lines; same line twice; hypothetical empty zero scheme | First localized degree 1 on a point; second degree 1 on L; empty CH₀ is 0 and would force degree 0≠1 | No regularity assumed of the pulled-back zero scheme | Route names source, target and homotopy input |
| §6.3 c=0 and rank 0 | ℙ²,H=O(1); Spec k | Empty section tuple has Z=X and top Chern c₀=1; degrees h²=1 and [Spec k]=1 | Degenerate case remains positive | Retained |
| §6.4 complete-intersection codimension | Two distinct versus identical lines in ℙ² | Distinct: c=2,dim=0; identical: codim 1 despite two equations, so not a codimension-two input | Equation count hypothesis matters | Duplicate paragraph deleted |
| §6.4 dimension cutting | W=ℙ²,target dimension 0 | One line cut gives dimension 1, second distinct line gives dimension 0 and a degree-one point | Cuts preserve nonemptiness while reducing maximum dimension | Separate generic-cuts gap |
| §6.4 field of definition and reduction | k₀=𝔽ₚ(t), equation xᵖ−t | Over k₀: reduced length p point; after adjoining t^(1/p): (x−t^(1/p))ᵖ of length p; geometric reduction length 1, dimension 0 throughout | Reduced geometric structure need not descend | Original discriminating Check retained |
| §6.4 perfect-field control | Perfect k₀, equation xᵖ−aᵖ | Its reduced equation x−a is already over k₀ and remains a reduced point after extension | Perfect-field conclusion agrees with STACKS line 223 | Retained |
| §6.4 support and boundary outputs | Two disjoint fibres; c=0 | Output dimension is 1 in the first case, n in the second; extra cuts needed for c=0 are zero | Neither connectedness nor an extra equation is promised | Retained |
| Worked ℙ¹ graded example | D=D₋, monomials (0,1),(1,1) | Product has pair (1,2); quadrant coordinates are (0,1),(1,0), summing to (1,1), inverse pair (1,2) | Weights, degree and frame conventions agree across layers | Recomputed |
| Worked ℙ¹×ℙ¹ example | Ruling classes H₁,H₂ | H₁H₂=1,H₁²=H₂²=0; degree O(2,0) against O(1,1) is 2 | Disconnected input, positive degree and dimension conclusions agree | Recomputed |

The general groups in these targets are lattices and split tori; the finite-orbit contract concerns split connected solvable algebraic groups. No statement asserts a group identity for arbitrary discrete groups, so S₃ and Q₈ introduce no additional cases. Characteristic 2 and 3, inseparable base change, nilpotents, zero rings, empty equation families, rank zero, identity maps, incomplete and nonprojective fans, and higher-rank adic point inequalities have explicit witnesses above. All denominators are positive integer powers of the fixed nonzero ϖ or powers of the positive prime p; neither an out-of-range index nor a totalized division by zero enters a target.

## Maintainer notes

No headline, Lean declaration name, layer order or consumer-facing mathematical conclusion changed. No commit or GitHub write was made. The original eight gaps remain eight in number: valuation specialization is removed, and the compound intersection request becomes two; their remaining obligations still belong to the named earlier suppliers, rather than being treated as implemented.

Supplier-gap references using valuation-smooth-proper or intersection-positivity-cuts should use the exact existing specialization imports or the new ample-degree-positivity / ample-generic-cuts contracts respectively. DeligneWeightsAndPurityPartII and MotivesAndAlgebraicCyclesPartII retain their stated projection, cohomology, neighbourhood and approximation interfaces.

The brief permits editing only the plan's top-level gaps. All other design text, including its older Proposition 8.7 page range and historical notes about supplier requests, was therefore preserved byte for byte; the reader-facing README and source coverage carry the repaired locators. Suggested.lean and metadata.toml required no edits. A fresh independent review remains the acceptance authority.
