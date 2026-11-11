<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13091#issuecomment-6783866466 -->
Review (codex) of f96a673

Verdict: needs_changes

1. **F01** (P2) Choose the crystalline frame after extending the residue field

   **Location.** `packages/ShimuraVarietiesPartII/README.md:959`, also the convention at line 29 and the explanation/API at lines 963 and 969: “At p descend D_x to W(F_q)[1/p] and choose δ∈G(W(F_q)[1/p])”.

   **Claim.** Descent of the crystalline realization and its tensors to the original finite residue field supplies a tensor-compatible frame there, before taking a sufficiently divisible extension. The resulting length-r norm is then identified with the original q-Frobenius.

   **Witness.** HT lines 1051–1055 descend the realization; HT lines 1056–1065 choose its tensor frame only over F_(q^m), for sufficiently divisible m, and use a length-rm norm. Descent of a tensor torsor does not imply its neutrality.

   The named input also does not supply the omitted step: BunGAndNewtonStrata, PR #1241, `TauCetiRoadmap/BunGAndNewtonStrata/README.md:592` (§1.16), starts with δ∈G(K₀) and proves its finite-period centralizer comparison. It assumes the frame. The integral-frame supplier works over algebraically closed k in its relevant layers (`TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md:27`, PR #1843). HT's geometric frame in §1.3.8 similarly uses L=Frac W(F̄_p), not the original finite unramified field.

   **Exact repair.** In the convention and §4.9, first choose a positive sufficiently divisible m₀ for which the tensor-frame torsor is trivial over K₀=W(F_(q^m₀))[1/p], as in HT §2.1.7, equations (2.1.7.1)–(2.1.7.2), pp.23–24. Then choose δ∈G(K₀), and use the norm with r m₀ factors. Its standard realization is γ_x^m₀ and its contragredient is π_x^m₀. Take subsequent stabilizing exponents to be positive sufficiently divisible multiples of m₀. State the length-r formula over F_q only conditional on an F_q tensor frame; the unframed F_q realization remains a tensor torsor. Update the proof sketch and API accordingly. Keep γ_x=π_x⁻¹ and the exact q-Frobenius conclusions of §§5.10 and 7.6; do not replace those conclusions by powers. Add the field/frame distinction as a Check. No new supplier or change of scope is needed.

   **Repair test.** For E:y²=x³+x over F₅, #E(F₅)=4, so π has trace 2 and determinant 5. The tower γ has trace 2/5 and determinant 1/5. Choosing m₀=2 makes the norm represent γ², with trace −6/25 and determinant 1/25, not γ. Its dual represents π², with trace −6 and determinant 25. These are exactly the repaired length-rm₀ formulas.

   A separate control on the unjustified torsor inference is T=ker(N:Res_(Q₂₅/Q₅)G_m→G_m). The T-torsor N(z)=5 has no Q₅-point because valuations of norms are even, while v₅(5)=1. After the unramified quadratic extension it becomes uv=5, with point (5,1). This is a control on descent versus neutrality, not a claim that this particular torsor is the realization of a specified Shimura point. The finding is the unsupported strengthening of the cited construction, witnessed directly by HT's required extension.

One new P2 finding. Both findings from round 3 are repaired. The package's Lean file elaborates without warnings and the dependency check reports no problems. The remaining defect concerns the field over which a crystalline tensor frame is chosen, not the positivity repair or the final away-from-p common-Frobenius theorem.

## Verified sound

### Previous findings and repair adversarial pass

| Previous finding | Repaired passage | Verification and status |
|---|---|---|
| F01: zero exponent in stable cyclic closure | `packages/ShimuraVarietiesPartII/README.md:100`: “for every positive integer n divisible by e”; line 959: “m positive and sufficiently divisible”. | **Repaired.** The matching plan contract has the same positivity condition. For diag(2,4), closure dimensions are 0 at n=0 and 1 at n≥1; centralizer dimensions are 4 and 2. The new elliptic Checks at lines 977–978 are correct. |
| F01 pattern: Noot power | `packages/ShimuraVarietiesPartII/README.md:162`: “a neat Frobenius power with sufficiently divisible positive exponent”. | **Repaired.** Its plan gap agrees. Exponent 0 gives class 1 and centralizer G, providing no comparison with the stable nontrivial class. Positive powers are used throughout the consumers. |
| F02: rational versus geometric conjugacy of global tori | `packages/ShimuraVarietiesPartII/README.md:891`: “the Q-defined torus T′=gTg⁻¹ for some g∈G_sc(Q̄)”; line 98 separately retains g_p∈G_sc(Q_p). | **Repaired.** The supplier gives geometric conjugacy with a Q-defined image and rational local conjugacy, not a global G(Q)-conjugator. The norm obstruction at line 895 is correct. Applying the supplier to μ_T⁻¹ gives precisely μ_(h_x)⁻¹=Int(g_p)(μ_T). |

The repaired patterns were searched in the rest of the README, including the two gap sentences and all finite-power consumers. The round-4 repair report does not mark either previous finding “not actionable”. R01 above is new: it concerns the existence of the finite-field frame before the power is chosen. The old immutable design-target text is not being promoted to a new package target or silently edited.

For the new positive-power Checks, the ordinary elliptic curve has Frobenius roots 1±2i, non-associate Gaussian primes. The two inverse roots have no multiplicative relation, so the cyclic closure has dimension 2 and component index 1. For y²=x³−x over F₃, #E=4, π²=−3 and the relation lattice of the inverse roots is Z(2,−2); the component index is 2. Centralizer dimensions 2 at exponent 1 and 4 at exponent 2 agree with the new Check. The nonsplit norm-one element (3+4i)/5 has infinite order and connected one-dimensional closure, so positivity does not impose a splitting assumption.

### Principles, shape and exhaustive coverage

Read all 63 numbered targets, their APIs and Checks, all 71 standalone Needs lines, the conventions, supplier contracts, layer dependencies and downstream scope. There are eight layers, each with Examples and Dependencies. All 26 Definition/Construction sections have an API and at least three Checks. The target-level computed ledger was retained in the review scratch work; the table below includes all sampled targets, the headline results, repaired passages and the new finding.

The scope continues the generic ShimuraVarieties tower. It does not re-plan it. General local models, tensor deformation theory, B(G), reductive quotients and PEL Newton strata stay with their named owners; this package constructs and compares them on normalized Hodge models. Exceptional factors, ramified primes and arbitrary odd-p connected parahorics remain in scope. The restriction p>2 matches these source theorems; no further “good primes” restriction was inserted. The source's known exceptional-cover and display corrections are reflected in the hypotheses.

The layer order is supported by the listed inputs: models/tensors precede local geometry; auxiliary covers precede integral descent; Newton and isogeny theory precede ordinary lifts; KR geometry supplies the curves used for Frobenius comparison. No layer is named after a source chapter, no sentence makes a source's expository order the plan, and no computational algorithm or copied source passage was found. The normalizations, duality and map directions have discriminating examples. Apart from R01, no contradiction between a Check and its target was found. The numerical tests below are controls, not proofs of the general targets.

No process residue, HTML anchor, machine path, pull-request identifier, forbidden Lean declaration form or own backticked undeclared API name was found in the roadmap text. Backticked mathematical expressions are notation, and the named library declarations are imported contracts rather than claimed new declarations. The house shape was compared with the main-branch ReductiveGroupsPartII and SchemeAndStackFoundations roadmaps.

### Seeded source verification

All five manifest entries (KZ, HT, KPZ, KP, K17) were readable in their legal cached extractions. All 15 sampled targets were checked at the indicated statements/proof steps, including hypotheses and printed pagination. No author-flagged unverified locator was found. All works cited by this package are recorded in its manifest; no additional source or missing-reference request was needed. The versions actually recorded by the author were used.

| Sampled target | Locator and text read | Result |
|---|---|---|
| 0.3 Prime-to-p integral tower | HT §2.1.1, p.21, HT lines 940–968; KZ §4.1.5, p.30, KZ lines 1299–1303 | Finite étale tame transitions and extension of the prime-to-p action; no claim that changing parahoric level is étale. |
| 0.4 Integral étale Hodge tensors | KZ §§4.1.6–4.1.7, pp.30–31, KZ lines 1304–1355; §5.1.1, p.47, KZ lines 2063–2079 | Canonical sections and tower tensor frames. The tower uses H₁ and H¹ is its dual; the multiplier twist agrees. |
| 1.1 Pointwise Hodge comparison | KZ §4.1.7, p.31, KZ lines 1331–1355; Proposition 3.3.2, KZ lines 1073–1103 | Pointwise comparison and integral tensor frame; no illicit assumption that every embedding is very good. |
| 1.2 Adapted normalization branches | KZ Proposition 4.1.9, pp.31–32, KZ lines 1361–1391; hypotheses at KZ lines 1272–1275 | Adapted branch comparison retains its very-goodness/setup hypotheses. |
| 1.6 Strict comparison with lattice-chain level | KPZ Theorem 7.1.8 and Remark 7.1.9, p.74, KPZ lines 3250–3277 | Actual chain-level Siegel model and fixer equality; modern theorem is not narrowed to the older good-prime setting. |
| 1.8 Pro-level DVR extension | KPZ Theorem 7.1.3(1) and proof, p.73, KPZ lines 3191–3216; HT Lemma 1.3.6, p.17, HT lines 764–773 | Full prime-to-p level yields the extension; the arbitrary-DVR good-reduction input is supplied explicitly. |
| 2.2 Reflex splitting for auxiliary covers | KPZ §7.2.3, pp.77–78, KPZ lines 3394–3423; Proposition 7.2.19(2), p.83, KPZ line 3675 | Splitting of target p-places in the reflex composite, not merely an unspecified finite extension. |
| 2.6 Strongly acceptable auxiliary cover | KZ Proposition 4.2.3 and Lemma 4.2.4, pp.34–35, KZ lines 1491–1523; KPZ Proposition 7.2.19, KPZ lines 3682–3683 | Torsion-free coinvariants and full-fixer equality; the KZ typo is corrected rather than copied. |
| 3.4 Integral adjoint twisting action | KP Lemmas 4.5.2, 4.5.4, 4.5.7, 4.5.9, pp.194–197, KP lines 2947–3056 | Central torsor twist, polarization and conjugated level, including the coefficient-isogeny interpretation. |
| 4.3 Newton strata on the special fibre | HT Theorem 1.3.14, pp.19–20, HT lines 885–906 | Locally closed strata and specialization. Nonemptiness is separated and requires the rational-Newton witness; the definition itself does not assert it. |
| 4.10 Rosati compactness | HT §2.1.2, p.21, HT lines 969–981; K17 Corollary 2.1.7, p.31, K17 lines 1381–1394 | Compactness modulo weight scalars; reductivity and later connectedness are distinguished. |
| 4.12 Auxiliary-prime comparison and full rank | HT Proposition 2.1.6, p.23, HT lines 1011–1047; K17 Corollary 2.1.7, p.31, K17 lines 1381–1394 | Split auxiliary primes and the compact-quotient argument supply the comparison, not full rank alone. |
| 5.1 Integral maps under derived isomorphisms | KZ Proposition 4.3.2 and Corollaries 4.3.5–4.3.6, pp.37–40, KZ lines 1626–1672 and 1690–1745 | Integral extension and formal comparison; derived isomorphism is not replaced by an arbitrary central isogeny. |
| 5.5 Product comparison of abelian fibres | KZ Proposition 4.4.8 and equation (4.4.9.1), pp.44–45, KZ lines 1930–1993 | Matched multipliers and projection tensors give the product comparison in the stated setup. |
| 6.1 KR strata at very special level | KZ §5.2.1, pp.48–49, KZ lines 2112–2166 | Very-special Schubert indexing and top stratum; individual geometric strata descend over their index-orbit fields. |

The additional source check that produced R01 is HT §2.1.7, pp.23–24, HT lines 1051–1078. It explicitly separates realization descent from tensor-frame existence after a sufficiently divisible finite extension.

### Computed adversarial table

“Keep” means the stated hypotheses and convention survive the displayed test, not that the general theorem follows from that test. Boundary controls outside the standing odd-p, characteristic-zero-group or finite-field assumptions were not treated as alleged counterexamples inside the scope.

| Statement | Instances tried | Values computed on the compared sides | Result / change |
|---|---|---|---|
| Conventions; 0.4 | E:y²=x³+x/F₅; dual and multiplier twist | Affine counts 1,0,1,1,0 plus infinity give 4. H¹ trace/determinant 2,5; H₁ geometric trace/determinant 2/5,1/5. Multiplying the inverse roots by 5 restores trace 2, determinant 5. | Keep duality and Tate-line convention. |
| 0.3 | GL₂ full tame level 9→3 at p=5; identity level | Kernel 1+3M₂(F₃) has 3⁴=81 elements; identity transition degree 1. | Keep finite étale tame tower. |
| 0.6 | Constant ordinary elliptic family | Geometric monodromy is 1; F-isocrystal slopes are 0,1 and determinant slope 1, so the Frobenius group is not 1. | Keep subgroup, not equality with the full tensor stabilizer. |
| 1.1 | Ordinary étale and multiplicative factors | D(Q_p/Z_p): F=σ; D(μ_(p∞)): F=pσ. Direct sum rank 2, determinant p and Fil¹ rank 1. | Keep contravariant comparison. |
| 1.2 | Ordinary branch and square-zero tensor frame | Both ordinary deformation rings W[[t]] have relative dimension 1. For u=[[1,ε],[0,1]], u e₁₁ u⁻¹=e₁₁−εe₁₂, whereas reduction is e₁₁. | Integral tensors distinguish branches invisible at the reduced point. |
| 1.6; 0.1 | Hyperspecial curve; superspecial chain level in GSp₄ | Completed strict local rings W(F̄_p)[[t]] on both sides in the smooth curve case. Chain choices over E² give a P¹ fibre of dimension 1; a finite normalization has fibres of dimension 0. | Keep chain-moduli contract, not a finite-normalization substitute. |
| 1.8 | Good elliptic scheme versus split multiplicative Tate curve | Inertia I versus nontrivial upper-unipotent matrix. Full compatible prime-to-p level forces I; a single small finite level need not. | Keep pro-level hypothesis and arbitrary-DVR supplier. |
| 2.2 | Q(i) at p=5 and p=3 | X²+1 has roots 2,3 at 5: local degrees 1+1. It has no root at 3: local degree 2. | Splitting gives the stated trivial local extension. |
| 2.6 | Inertia coinvariants Z² versus Z/2 | Torsion subgroup 0 versus order 2. | Torsion-free hypothesis correct; KZ misprint not propagated. |
| 3.4 | Diagonal conjugator and unipotent; commutative group control | diag(ℓ,1)[[1,1],[0,1]]diag(ℓ⁻¹,1) has upper entry ℓ; inverse convention gives ℓ⁻¹. On G_m both conjugations are identity. | Nonabelian example fixes orientation. |
| 3.6 | Iwahori and diag(p,1) | Lower entry p becomes 1 under conjugation; the original Iwahori requires p-divisibility. | Keep jK_p°j⁻¹ for the j-piece. |
| 3.8 (headline) | Modular curve, hyperspecial and Iwahori | Relative dimension 1 in both cases; node has 2 special branches versus 1 smooth branch. | Normal integral model does not promise smooth good reduction everywhere. |
| 4.3 | Ordinary and basic elliptic points | D slopes (0,1) and (1/2,1/2); p-ranks 1 and 0; both ranks 2. | Reduced Newton strata distinguish classes; no unconditional nonemptiness. |
| 4.4 | Dominant tower Newton order | Ordinary top coordinate 0; basic top coordinate −1/2. In ascending D polygons midpoint heights are 0 and 1/2 respectively. | Closure direction agrees after duality. |
| 4.5 and repaired supplier contract | SO(x²+y²)⊂SL₂/Q, d=diag(3,1), p=5; w=1 | det(d/√3)=1. A rational normalizer correction would have determinant 1/3, v₃=−1, but ±(a²+b²) has even v₃. At 5 the split norm is onto. For w=1, g=1 and T′=T. | F02 repaired: geometric global conjugacy, rational local conjugacy. |
| 4.7 (headline) | Ordinary elliptic curve locus | Ordinary open dimension 1; supersingular closed set dimension 0; ordinary closure dimension 1. | Keep ordinary-class existence and local-integrality hypotheses. |
| 4.9 and positive-power contract | diag(2,4); diag(1,−1); identity | First closure dimensions at n=0/n>0: 0/1; centralizers 4/2. Second e=2, centralizers at n=1/n=2: 2/4. Identity closure 1 and centralizer G for every n≥1. | F01 repaired: positivity and divisibility both retained. |
| 4.9 new elliptic Checks | E/F₅ above; y²=x³−x/F₃ | First: X*(S)=Z², e=1, stable centralizer dim 2. Second: #E=4, trace 0, π²=−3, X*(S)=Z⊕Z/2, e=2; centralizers dim 2 then 4. | Both added Checks recomputed successfully. |
| 4.9 norm and finite-period group | ζ of order 24 over W(F₂₅); matrix [[0,−1],[5,0]] | ζσ(ζ)=ζ⁶≠ζ²; standard scalar ζ⁻⁶. Matrix square −5I; inverse-transpose square −I/5. Before extension finite-period group is quadratic-torus dimension 2, whereas J_δ is quaternion dimension 4. | Twisted norm and duality correct; finite-period group need not equal J_δ. |
| 4.9 finite-field frame (R01) | E/F₅; extension degree 2; norm-torsor control | γ trace/det 2/5,1/5; γ² trace/det −6/25,1/25. N(z)=5 over unramified quadratic Q₂₅/Q₅ has no point (even versus odd valuation); over Q₂₅, uv=5 has (5,1). | Extend before choosing frame; norm length rm₀ and γ^m₀. |
| 4.10 | CM isogeny group over R | I(R)=C×, scalar 2ⁿ unbounded; I(R)/R× is a circle, compact. | Keep quotient by weight scalars. |
| 4.12 | Ordinary and scalar GL₂ Frobenius | Centralizer dimensions/ranks 2/2 and 4/2 respectively. | Equal rank alone is insufficient; auxiliary split compact-quotient input is explicit. |
| 4.13 (headline) | Ordinary CM and supersingular E; nonsemisimple control | I and realization centralizers have dimensions 2=2 or 4=4. Identity and nontrivial unipotent share quotient coordinates but centralizers have dimensions 4≠2. | Keep semisimplicity in Conj′ dimension comparison. |
| 5.1 | Identity derived isomorphism; nontrivial central isogeny | Completed local map W[[t]]→W[[t]] is identity; a degree-2 central isogeny has kernel order 2 rather than 1. | Strong formal conclusion retains derived-isomorphism hypothesis. |
| 5.5; 5.2 | Product E×E; unequal multipliers | Dimension 2=1+1, H¹ rank 4=2+2; projection e₁₁²=e₁₁, e₁₁e₂₂=0. Blocks 2J and 3J have no common multiplier; 2J and 2J do. | Product and projection tensors enforce intended comparison. |
| 5.9 (headline) | Ordinary CM E/F₅ | Slopes 0,1; isogeny torus dimension/rank 2. Scalar 1/5 is a rational quasi-isogeny but not an integral automorphism. | Full rational action, not just automorphisms, is retained in the lift. |
| 5.10 (headline) | γ=(1−2i)/5 | Trace 2/5, norm 1/5 versus γ² trace −6/25, norm 1/25. | Exact q-Frobenius conclusion must remain unchanged by R01. |
| 6.1 | Hyperspecial GU(1,1) curve | Minuscule P¹ model has 1 KR stratum; Newton p-ranks give 2 possibilities, 1 and 0. | Top KR is not identified with ordinary. |
| 6.3 (headline) | Marked curve of residue degree 1 or 2; torus target | Degree 1 preserves trace 2/5; degree 2 gives −6/25. Constant A¹ into an ordinary torus point has ordinary preimage all A¹. | Same-field conclusion and zero-dimensional target handled. |
| 7.4–7.5 | Standard, determinant, trivial; t↦diag(t,t⁻¹) | At ℓ=3,7: T²−2T/5+1/5, T−1/5, T−1. t=2 and 1/2 both give trace 5/2, but weight-one character gives 2 versus 1/2. | All characters, not just one faithful representation, supply separation. |
| 7.6 (headline) | CM class; one-prime and nonabelian controls | Common quotient coordinates (2/5,1/5). Q(i) embeds in Q₅ but not Q₃. An order-2 subgroup of S₃ misses both 3-cycles. | Almost-all local realizations support rational descent; one local realization does not. |

### Pinned libraries, acceptance file and padding

The actual pins agree with the README: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Opened the declarations below at those pins, including the definition bodies and relevant hypotheses.

| Pinned declaration | File and line | Content / limitation checked |
|---|---|---|
| WittVector.Isocrystal; Isocrystal.frobenius | `Mathlib/RingTheory/WittVector/Isocrystal.lean:112`, :124 | Module over the Witt fraction field and semilinear Frobenius equivalence; no finite dimension, family or G-structure field. |
| TauCeti.AlgebraicGeometry.AbelianVariety | `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | Proper geometrically integral group object, no polarization field. |
| TauCeti.AlgebraicGeometry.AbelianVariety.End | `TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean:74` | Additive endomorphism carrier with composition multiplication. |
| Matrix.transpose_mul_J_mul_eq_det_smul | `TauCeti/LinearAlgebra/Matrix/SymplecticMultiplier.lean:63` | Rank-two block identity with Unique index and commutative ring hypotheses. Imported as a Check, not duplicated. |
| TauCeti.reductiveCommHopfAlgProperty | `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean:71` | Smoothness, geometric connectedness and absence of geometric connected normal smooth unipotent subgroups. |
| TauCeti.HopfAlgebra.conjugationAlgHom | `TauCeti/Algebra/AlgebraicGroup/Hopf/Conjugation.lean:66` | Coordinate map of left conjugation; conjugator is first factor. |
| productMap_comp_conjugationAlgHom | Same file, :107 | Evaluates to gxg⁻¹. diag(2,1) and upper-unipotent entry 1 give entry 2, not 1/2. |
| conjugationAlgHom_counit_left; conjugationAlgHom_counit_right; conjugationAlgHom_coassoc | Same file, :176, :196, :248 | Identity action, fixed identity and associativity laws. |
| TauCeti.ComoduleAlgebra.coinvariants | `TauCeti/Algebra/Bialgebra/ComoduleAlgebra.lean:136` | Right-comodule equalizer coact(a)=a⊗1; conjugation is not registered with the quotient finiteness/semisimple-class API needed here. |

Object searches in both pinned libraries covered integral Shimura models, parahoric/local models, canonical Hodge tensors, Newton strata, tower local systems and reductive conjugacy quotients. Pointwise isocrystals, abelian varieties, the Hopf conjugation coaction and ordinary class functions do not supply these geometric carriers. A simple invariant-subalgebra definition would not create the missing Shimura tower or its canonical tensors.

| Headline from README | README target | Suggested.lean docstring | Missing carrier |
|---|---|---|---|
| Common rational Frobenius class | 7.6 | Lines 13–23 | Integral Shimura special fibre and group-valued tower local systems. |
| Integral abelian-type models | 3.8 | Lines 24–26 | Shimura data, parahoric group schemes and integral/local models. |
| Ordinary special lifts with full isogeny action | 5.9 | Lines 27–29 | Ordinary integral Shimura points and tensor quasi-isogeny groups. |
| Rational ordinary Frobenius | 5.10 | Lines 30–31 | Ordinary locus and its realization local systems. |
| Tate comparison | 4.13 | Lines 32–34 | Canonical Hodge tensors, I_x and finite-period crystalline group. |
| Ordinary density | 4.7 | Lines 35–37 | B(G), universal G-isocrystal and Shimura Newton strata. |
| Same-field curves | 6.3 | Lines 38–39 | Integral Shimura models and KR strata. |

The summary's intermediate adapted-branch, henselian, canonical-model and DVR-extension results need the same missing integral Shimura/local-model carriers. No headline that is faithfully statable using a few simple definitions at these pins was identified as omitted.

Ran the prescribed `lake env lean` invocation on the delivered `packages/ShimuraVarietiesPartII/Suggested.lean` from the content checkout: **exit 0, no output, no warnings**. It contains exactly one `import Mathlib`, the module docstring and the prescribed empty namespace. No TauCeti module needed building. Exhaustive padding probe: **0 sorried theorems**. Mechanical `#check @name` signature comparison: **0 declared names**, so there are no disappearing section variables or signatures to compare. No Lean changes were made. The preflight “Unknown identifier of” error does not reproduce on the delivered file. Successful elaboration establishes import/syntax compatibility, not the truth of the README.

### Supplier resolution, duplication, overlaps and order

The prescribed dependency check returned exactly:

```text
depcheck: 236 roadmaps, 2156 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The citation resolver returned no unresolved cross-roadmap citations or owned Lean names; its external-Lean inspection limitation was covered by the direct pin checks above. All supplier contracts were compared with the named sections at their permitted main/head copies, rather than accepting a resolver hit as evidence of the claimed mathematics.

In the following table all supplier paths are `TauCetiRoadmap/<Supplier>/README.md`; file line anchors identify an inspected section or scope, and the full section lists record the citations resolved.

| Supplier / inspected version | Resolved sections and file anchors | Ownership result |
|---|---|---|
| ShimuraVarieties, #933 | 4.5 (:1227), 5.6 (:1592), 6.3–6.6 (:1804), 8.1 (:2362) | Generic canonical tower, CM reduction and generic component descent imported. |
| ShimuraData, #1038 | Layers 1 (:162), 4 (:761) | Hodge/abelian-type data imported; four specialized cover/centre/form extensions remain gaps. |
| PELModuli, #966 | M2.8 (:2380), M4.5–M4.6 (:3298), M6.1–M6.4 (:3766) | Finite normalization and single-lattice moduli do not supply chain-level moduli. |
| AbelianSchemesAndArithmeticModuli, #849 | A4.1 (:1838), A4.3, A4.8–A4.9, A6.7, A6.14, A6.20–A6.22, A6.28–A6.29 (:3648) | Tate/de Rham, effectivity, Serre–Tate, Hom, Rosati, descent, Frobenius and coefficient-torsor twists imported. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory, #879 | R07.2.6–.7 (:3236), .12, .14, .20 (:3698) | Contravariant Dieudonné and covariant comparison conventions agree. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, #1843 | 2.10–2.11 (:762), 3.13–3.17 (:959), 4.3–4.4 (:1079), 4.12 (:1195), 6.4–6.5 (:1603) | General tensor deformation theory imported. These geometric frames do not settle R01 over the original finite field. |
| GeometricSatakeAndFusion, #1235 | GS0; affine flags 0.8 (:388), equal-characteristic companion 0.29 (:807), Witt flags 0.31 (:847), admissibility 0.37 (:972) | General Schubert/flag geometry retained by supplier. |
| GeometricSatakeAndFusionPartII, #1836 | 1.4 (:389), 3.1 (:571), 3.4, 3.7 (:651), 5.5 (:927), 7.6 (:1113) | General normal models and same-field Schubert curves imported. Tame comparison 1.4 alone is not substituted for the general theorem. |
| ReductiveGroupsPartII, main | RG2.0 (:437), RG2.1 (:1445), RG2.3 (:3760) | Root/building/fixer theory and Lang imported; R-smooth extensions assigned separately. |
| ReductiveGroupsPartIII, #2131 | 0.5–0.7 (:467), 1.2–1.3 (:601), 2.3 (:858), 2.5 (:910), 3.5 (:1109), 5.3a (:1500) | Characters, finite/outer quotients, descent, global tori and fixer intersection imported. Conditional downstream §5.5 (:1588) creates no back edge. |
| BunGAndNewtonStrata, #1241 | 0.6, 0.8, 1.16 (:592), 1.22–1.26, 1.28–1.29, 1.34, 1.37, 1.39, 2.16 (:1241) | B(G), rational Newton witnesses and finite-period centralizers imported. §1.16 assumes δ; see R01. |
| HeckeStacksAndLocalShtukas, #1252 | HS2.1 (:1041), HS2.10–HS2.11, HS2.13 (:1530) | Generic towers are supplied; full integral completions/reductions remain declared contracts. |
| CrystallineCohomology, #857 | CR.7.1 (:11243), CR.7.3 (:11344) | Relative comparison/coefficients supplied; the two particular transport/descent assertions remain gaps. |
| PadicDifferentialEquationsAndRigidCohomology, #1002 | RD.3.43 (:6767), RD.5.116 (:11340) | Newton semicontinuity on noetherian bases and Zarhin enlargement. |
| PadicHodgeTheory, #1062 | 5.5 (:1071) | Tensor torsors and Kottwitz comparison; a torsor is not automatically neutral over a finite residue field. |
| MotivesAndAlgebraicCycles, #1313 | Layer 6 and 6.3 (:1149) | Tensor reconstruction and subquotient criterion; no equality with generated monodromy is inferred. |
| AutomorphicBundles, #1069 | 3.4–3.8 (:1423–1575) | Full-group Betti/étale/de Rham coefficients and comparison, including the Tate line. |
| SchemeAndStackFoundations, main | 1.17–1.23 (:2728–3124) | Quotients, stacks, inertia and descent imported. Specific arithmetic-kernel effectiveness remains here. |
| AlgebraicModuliForArithmeticGeometry, #853 | Layers 1, 4, 6; 6.1 (:8773) | Approximation/algebraization supplied; finite-field Bertini and rational stack presentation remain explicit gaps. |
| ArithmeticGaloisRepresentations, #856 | 1.11, “Reductive quotients over fields and DVRs” (:1436), conjugation specialization (:1456); 5.1 (:3461), 5.13 (:3828) | Quotient, number-field and curve Chebotarev imported. Independent coarse Noot comparison remains a gap. |
| GlobalShtukasAndFunctionFieldLanglands, #1490 | 6.1 (:1925), 6.2 (:1937) | Constant twists and irreducible companions supplied; semisimple common-coefficient extension remains declared. |
| NeronModelsAndSemistableAbelianVarieties, #852 | 5.1 (:3109), 5.2 (:3172) | Henselian NOS and descent to arbitrary DVR; no excellence restriction added. |
| ShimuraCompactifications, #1053 | Layer 7, particularly 7.18 (:2633), 7.19 (:2646) | Good-level quasi-projectivity/finite normalization supplied; Hodge component specialization and Siegel chain moduli remain declared extensions. |
| IgusaVarietiesAndTorsionConcentration, #1090 | 0.1–0.2 (:123), 0.12 (:452) | PEL Newton theory, compared on the common hyperspecial Siegel case, not re-owned here. |

The board-package index was read before absence/ownership searches. Used `roadmaps grep` by object across the supplied open heads and main, and inspected relevant board packages. Searches included normalized Hodge models, tensor quasi-isogenies, stable centralizers, lattice-chain Siegel moduli and R-smooth centralizers. The five closest roadmaps in the supplied overlap file were inspected by scope and relevant target: FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII #1843, GeometricSatakeAndFusionPartII #1836, ReductiveGroupsPartIII #2131, BunGAndNewtonStrata #1241 and IgusaVarietiesAndTorsionConcentration #1090. Their generic constructions remain imported; this package owns the Shimura-model specialization and its integral descent. It declares no Lean name that could duplicate a sibling's fully qualified name.

The supplied overlap artifact lists no conflicting head, dropped cited id or revision-only id requiring a dependency declaration. The standalone overlap lookup cannot identify this unported package, so it was not interpreted as an additional clean scan; package overlap coverage uses the supplied artifact and inspected supplier heads. No numbering repair is requested.

The earlier external R-smooth ownership observation is not re-raised against this package: #1836, `TauCetiRoadmap/GeometricSatakeAndFusionPartII/README.md:77`, assigns its full-fixer extension to ReductiveGroupsPartII, whose main scope excludes that extension. This package instead assigns it to Part III. Reverting this package to the excluded owner would not fix the external citation.

### Declared supplier gaps

The README's contract block and the plan's top-level gaps list contain exactly the same **20 slugs**, with no unnamed supplier. They were compared with the supplier statements, not treated as already implemented. The supplied gaps are precise extensions: local-model integrality excludes already supplied extremal-stratum smoothness; semisimple companions exclude already supplied irreducible companions; full integral shtuka completion exceeds the generic tower; the Hodge-cover, centre, invariant-form and R-smooth contracts state their actual hypotheses. The chain-moduli contract distinguishes its universal chain from finite normalization. The stable-centralizer gap now includes positive divisibility, and the coarse Noot comparison remains independent of the final common-Conj(G) theorem. No additional gap defect was identified.

Any later acceptance remains conditional on those contracts. This needs-changes verdict does not mark their future results as supplied or demand their implementation in this package.

## Not verifiable

- No unreadable source blocked the review. All five cached texts and all 15 seeded locators were read. No missing-reference request was created.
- Published numbering of the KZ, HT and K17 manuscript versions was not independently collated against a different published edition; this report certifies the versions recorded in the manifest. KP and KPZ were checked with their published pagination.
- Package-specific overlap coverage depends on the supplied overlap artifact because the standalone service does not yet identify this unported package. Relevant supplied heads were inspected directly.
- The 20 declared supplier gaps are future mathematical contracts. Their ownership, precision and overlap can be checked; their future proofs cannot be certified here.
- The computed tests and source comparisons are not formal proofs. The declaration-free Lean elaboration checks imports and syntax only.

## Source issues

- **Misprint** in KZ at Proposition 4.2.3(5), printed p.34: the source says inertia coinvariants are torsion; it should be torsion-free, consistently with Lemma 4.2.4 and KPZ Proposition 7.2.19; affects a stated result.
- **Gap** in HT at the proof of Corollary 1.3.13, printed p.19: the source says the generated realization category has the full tensor-stabilizer group; it should be a subgroup, with restriction of representations supplying the functor; affects the proof.
- **Error** in HT at §1.3.15 and Corollary 1.3.16, printed p.20: the source says an ordinary class exists without a separate existence premise; it should be assumed to exist or guaranteed, for example by quasi-splitness; affects a stated result.
- **Misprint** in HT at §2.1.8, printed p.24: the source says the cyclic subgroup is generated by an unintroduced x when defining neatness of γ; it should be generated by γ; affects nothing.
- **Error** in KP at the proof of Theorem 4.2.7, printed p.187: the source says the relevant action map is a torsor; it should be smooth, with the frame projection carrying the torsor property; affects the proof; corrected in print at KPZ §7.3.1(1), p.85.
- **Gap** in KP at Lemma 3.1.17, printed p.169: the source says its auxiliary topology justifies the logarithmic limit; it should use p-adic completeness and shifted logarithmic-tail convergence; affects the proof; corrected in print at KPZ §7.3.1(2), pp.85–86.
- **Error** in KP at Lemma 4.6.13 and Corollary 4.6.15, printed pp.202–203: the source says all component pieces use one fixed parahoric; it should use jK_p°j⁻¹ for the j-piece; affects a stated result; corrected in print at KPZ §7.3.1(3), pp.86–87.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "f96a673908667febf9bcf801fa77405e61f965a7", "job": "REV-PKG-ShimuraVarietiesPartII~4", "model": "gpt-6-astra", "worker": "chris-4"} -->
