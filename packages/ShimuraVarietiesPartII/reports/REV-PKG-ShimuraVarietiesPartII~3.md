<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13091#issuecomment-6782290748 -->
Review (codex) of 1374c85

Verdict: needs_changes

1. **F01** (P2) The stable-power contract must exclude exponent zero

   **Location.** `packages/ShimuraVarietiesPartII/README.md:100`: “for every n divisible by e”. The same quantifier is in `packages/ShimuraVarietiesPartII/design/plan.json:3968`, in the `rg3-cyclic-torus-and-neatness` needs sentence.

   **Claim.** Divisibility by the component-group order suffices for the cyclic closure of γⁿ to equal S°, and for its centralizer to equal Z_G(S°).

   **Witness.** In GL₂/Q take γ=diag(2,4). Then S=S°={diag(t,t²)}, e=1. At n=0, the cyclic closure is {1}, of dimension 0 rather than 1; the centralizer has dimension 4 rather than 2.

   **Exact repair.** In both copies of the contract, require a **positive integer n divisible by e**. Add the zero-exponent example as a negative-control Check beside the use in §4.9. Keep the characteristic-zero, semisimplicity and component-divisibility hypotheses. This is a missing hypothesis in the contract, not a finding about its future implementation or its declared ownership.

   **Repair test.** For the same γ and every n≥1, the powers of 2ⁿ are Zariski dense in G_m, so the cyclic closure is {diag(t,t²)} and its centralizer is the diagonal torus, dimension 2. For γ=diag(1,−1), e=2: n=2 gives γ²=1, S°=1 and centralizer GL₂, dimension 4; n=1 gives a dimension-2 centralizer and fails divisibility. For γ=1, e=1 and every positive power has closure 1. Thus positivity fixes the failure without weakening the positive-power theorem needed by §4.9. HT line 1013 explicitly indexes the Frobenius powers by positive integers.

2. **F02** (P2) The cocharacter adjustment gives a geometric conjugate defined over Q

   **Location.** `packages/ShimuraVarietiesPartII/README.md:891`: “replaces T by a rational conjugate T′”.

   **Claim.** The cited global cocharacter adjustment supplies rational conjugacy of the global tori, in addition to rationality of the resulting torus and the specified local conjugacy.

   **Witness.** HT lines 675–683 use g∈G_sc(Q̄), then descend the conjugate torus. PR #2131, `TauCetiRoadmap/ReductiveGroupsPartIII/README.md:914`, likewise gives g∈G_sc(Q̄), with a Q_p-conjugator only after a torus correction.

   **Exact repair.** Replace the quoted clause with “replaces T by a Q-defined geometric conjugate T′”. Explicitly retain g∈G_sc(Q̄), the descended torus T′, and the supplied g_p∈G_sc(Q_p) transporting the local cocharacter. Do not claim a global Q-rational conjugating element. No new gap or theorem is needed. The added BunGAndNewtonStrata §1.39 and ReductiveGroupsPartIII §§2.3, 2.5 imports should remain.

   **Repair test.** Rationality of a conjugate does not imply rational conjugacy: take T=SO(x²+y²)⊂SL₂/Q, d=diag(3,1), and T′=dTd⁻¹. Conjugation by g=d/√3∈SL₂(Q̄) defines this Q-torus. A rational SL₂-conjugator would give an element of N_GL₂(T)(Q) with determinant 1/3. Those determinants are ±Norm_Q(i)/Q(a); their 3-adic valuations are even, whereas v₃(1/3)=−1. Thus no such rational conjugator exists. At p=5 the norm torus splits, and a centralizer correction of determinant 1/3 gives an SL₂(Q₅)-conjugator; over R the positive determinant is also correctable. These are precisely the separate global geometric, rational-definition and local rational properties retained by the repair. In the adjustment proof, the inversion Weyl element of SO(2) has real cocycle −1, while a rational G_sc conjugator has cocycle 1; suppressing the twist loses that distinction. This finding corrects the proof route, not the nonemptiness conclusion of §4.5.

Two P2 findings concern the revised stable-centralizer contract and the revised special-point proof route. The previous supplier renumbering, lattice-chain moduli repair, conjugation-coaction inventory and internal-reference repair are otherwise effective. The delivered Lean file elaborates without warnings. None of the four package inputs was changed.

## Previous findings: repair verification

The previous review and repair report were read before the new pass. The quotations below are from the repaired package, not from source texts.

| Round-2 finding | Status | Repaired passage and verification |
|---|---|---|
| R01, supplier identifiers and quotient ownership | Partly repaired | README:160 now names “§1.11, *Reductive quotients over fields and DVRs*, in its conjugation case”; README:98 names §§0.5–0.7, 1.2–1.3, 2.3, 2.5 and 3.5. All resolve at the supplied heads. The new stable-power sentence at line 100 needs R01 above. |
| R02, missing Siegel chain moduli | Repaired | README:194 distinguishes the “chain-level moduli scheme” from a “finite normalization of the good-level model”. The named ShimuraCompactifications contract is at line 178 and has the same slug in the plan. §§1.6–1.7 consume it. The genus-two Check at line 211 computes a positive-dimensional flag fibre. |
| R03, conjugation coaction inventory | Repaired | README:48 now cites `TauCeti.HopfAlgebra.conjugationAlgHom` and its evaluation and action laws. Suggested.lean:19–23 acknowledges the coaction and identifies the remaining quotient API rather than alleging that the coaction is absent. Opened all cited pinned declarations. |
| R04, local specialness and real adjustment | Partly repaired | README:891 now says “transferred-torus specialness theorem (BunGAndNewtonStrata §1.39)” and names “the real cocharacter twist (ReductiveGroupsPartIII §2.5)”. The contracts, target Needs and Layer 4 Dependencies include both. The new rational-conjugacy wording needs R02 above. |
| R05, internal design identifier | Repaired | README:1007 now says “It uses no common Frobenius class from §7.6.” No SV2.* identifier remains in the README. The §4.12 → §4.13 → §5.10 → §7.4 → §7.6 route remains acyclic. |

The deletion of the former centralizer-dimension gap is justified. ReductiveGroupsPartIII §0.7 gives an automorphism between semisimple points with the same Conj′ image; it carries their centralizers isomorphically. This directly supplies the dimension step now written in README:1023. The report does not re-raise the previous request to keep that redundant gap. Moving the stabilizer-immersion contract beside §5.3a is also justified: that section owns the corresponding equality of full fixers on points.

The pattern sweep found no RG3.*, TD.*, LM.* or SV2.* residue in the README, no renewed claim that finite normalization represents chain moduli, and no remaining assertion that the pinned coaction is absent. The original non-excellence restriction was not reintroduced into the DVR theorem. Smoothness of the maximal local-model open and irreducible companions are still imported, not requested again as gaps.

## Verified sound

### Coverage and principles

Read all 63 numbered targets, their proof sketches, APIs and Checks, all 72 Needs lines, the eight layer examples/dependency blocks, and the 20 named supplier contracts. The round-2 computed rows were used only for unchanged passages with actual values; the other passages and all new sample targets were inspected afresh. A scratch worklist records a calculation for each of the 63 targets. The table below gives the requested sample, all seven listed headlines, and the changed passages relevant to the findings and repairs.

There are 26 definition/construction sections. Each has an API and at least three Checks: §0.1 has five and §4.3 has four. The eight layers have mathematical names and end in Examples and Dependencies. Main-branch ReductiveGroupsPartII and SchemeAndStackFoundations were read as house-shape comparisons. The dependency order is justified by the construction: canonical tensors feed local geometry; auxiliary covers feed component descent; tensor isogenies feed special lifts; same-field curves feed Frobenius comparison. No source-chapter ordering claim or source-named layer was found.

The introduction states where ShimuraVarieties stops and imports its generic tower and connected descent. No re-planning, computational algorithm, copied source paragraph, upward dependency, cyclic proof route, sorry'd data, free-Prop surrogate or good-primes-only workaround was found. The odd-p range is that of the general integral-model theorem cited, and includes ramified and exceptional abelian-type cases. The narrower strongly acceptable hypotheses of the final Frobenius theorem are explicit. Non-neat levels retain stack inertia.

The backtick sweep finds only imported names, mathematical notation and Suggested.lean: zero purported declarations owned here. Metadata is the single math.NT topic. There are no machine paths, job identifiers, pull-request numbers, hand-off notes, HTML anchors or internal design identifiers in the mathematical roadmap. Bibliographic version dates identify the source versions rather than narrating the review process.

### Seeded source verification

All 15 requested targets were checked against the legal cached texts, including their surrounding hypotheses and the indicated proof steps. There are no additional author-flagged unverified locators. Page numbers below are printed pages of the versions named by the manifest. No source fetch or manifest modification was needed.

| Target | Source locator and inspected text | What the source supports |
|---|---|---|
| 0.3 Prime-to-p integral tower | HT §§2.1.1–2.1.2, p.21, HT lines 940–968; KZ §4.1.5, p.30, KZ lines 1299–1303 | Finite étale tame transitions, right action and extension of tensor-compatible sections; arbitrary tame level through quotient stacks. |
| 0.5 Lift-independent crystalline tensors | HT Proposition 1.3.7, pp.17–18, HT lines 774–807 | One rational Frobenius-invariant tensor family for lifts through the fixed normalization point; comparison with parallel transport. This is not an assertion of integral tensors. |
| 1.2 Adapted normalization branches | KZ Proposition 4.1.9, pp.31–32, KZ lines 1350–1391 | Neat level and very-goodness at y; both directions of adapted-lift recognition. The proof identifies the selected component with Spf A_G. |
| 2.2 Reflex splitting | KPZ §7.2.3, pp.77–78, KPZ lines 3394–3423; Proposition 7.2.19(2), p.83, KPZ line 3675 | Auxiliary CM splitting at every p-place and splitting of every target reflex p-place in the composite. |
| 2.6 Strongly acceptable cover | KZ Proposition 4.2.3 and Lemma 4.2.4, pp.34–35, KZ lines 1491–1523; KPZ lines 3682–3683 | Very-good cover and connected fixer. The package correctly uses torsion-free coinvariants rather than KZ's printed torsion slip. |
| 3.4 Integral adjoint twisting | KP Lemmas 4.5.2, 4.5.4, 4.5.7, 4.5.9, pp.194–197, KP lines 2947–3055 | Central torsor twist in the localized isogeny category, conjugated tame level, normalization extension and adjoint-frame action. |
| 3.6 Conjugated-level gluing | KPZ §7.3.1(3), pp.86–87, KPZ lines 3811–3847 | The j-piece uses the j-conjugated parahoric; the corrected stabilizer calculation and disjoint union are retained. |
| 4.6 Mu-ordinary locus | KZ Definition 4.4.3 and preceding assumption, p.43, KZ lines 1883–1896; HT §1.3.15, p.20, HT lines 909–916 | Existence of the class with the exact averaged Newton point is an explicit premise. A maximum for an inner form is not substituted. |
| 4.9 Isogeny realizations | HT §§2.1.5–2.1.7, pp.22–24, HT lines 1011–1078; K17 §2.1.2, p.29 | Frobenius powers, descent and finite-period twisted norm centralizers, with stabilization after sufficiently divisible extension. H₁ versus contravariant D is translated using the stated dual representation. The positive-power supplier defect is R01. |
| 4.11 Tensor detection on a Hecke orbit | HT Lemma 2.1.4 and Proposition 2.1.6, pp.22–23, HT lines 982–1047 | Equality of tower points implies equality of left cosets, giving the surjection in the stated direction; no converse branch-identification claim is used. Here Aut is in the explicitly specified prime-to-p isogeny category. |
| 5.1 Integral derived-isomorphism maps | KZ §4.3.1, Proposition 4.3.2 and Corollary 4.3.4, pp.37–40, KZ lines 1626–1672 and 1690–1745 | General extension under the stated good embedding/fixer/level compatibility; completed local isomorphisms require a derived isomorphism and associated parahorics. |
| 5.10 Rational ordinary Frobenius | KZ Corollary 4.4.13 and Remark 4.4.14, p.46, KZ lines 2035–2054 | Exact q-Frobenius, a rational representative and real ellipticity. No finite power replaces the element in the conclusion. |
| 6.1 KR strata | KZ §5.2.1, pp.48–49, KZ lines 2112–2165 | Very-special dominant coinvariant indices, Bruhat closure order, unique maximal index and Frobenius-orbit fields of definition. |
| 6.2 Rational frame lifting | KZ proof of Corollary 5.2.7, pp.52–53, KZ lines 2322–2349 | The connected smooth adjoint fibre supplies an F_q-frame and a local-model point over that same field. |
| 7.6 Common rational class | KZ Theorem 5.1.4, p.48, KZ lines 2104–2109; proof §5.3.6, p.55, KZ lines 2428–2439 | Strong acceptability, odd p and finite residue extension; common quotient point and descent to Q. Uniqueness follows from injectivity of Q→Q_ℓ on affine coordinates. |

Additional repaired passages were checked at KPZ Theorem 7.1.8, p.74, KPZ lines 3254–3276 (the actual chain-level ambient model), HT Proposition 1.2.5, pp.14–15, HT lines 648–683 (the torus adjustment), and HT Corollary 2.1.9, p.24, HT lines 1095–1105 (the coarser quotient dimension argument). K17 Corollary 2.1.7, p.31, K17 lines 1381–1394 supplies the split compact-quotient proof step used in §4.12.

### Computed adversarial table

These are discrimination tests and convention checks, not substitutes for the source theorems. Standing restrictions were enforced: p≥3, q=p^r with r≥1, ℓ≠p, finite-type groups, smooth connected reductive fibres, and neat levels when schemes rather than stacks are used. Thus p=2, q=1 and the zero ring are not allowed finite-field instances, and q is nonzero in the characteristic-zero coefficient fields. Torus examples test zero-dimensional Shimura spaces. Square-zero rings test tensor stabilizers as functors rather than just their geometric points.

| Statement | Instances | Values computed on the two sides / wrong-model comparison | Result / change |
|---|---|---|---|
| Conventions; 0.4; 7.2 | E:y²=x³+x over F₅; extension to F₂₅ | Affine point counts 1,0,1,1,0 plus infinity give 4. H¹ trace/determinant=(2,5); inverse roots give H₁=(2/5,1/5). Squaring gives H¹=(−6,25), H₁=(−6/25,1/25). | Signs, duality, determinant and exact residue-field power agree throughout. |
| 0.1; repaired chain contract; 1.6–1.7 | Supersingular E:y²=x³−x over F₃, A=E²; hyperspecial control | #E=4, trace 0. ker F_A=α₃² has order 9; order-3 subgroup flags form P¹, dimension 1. A finite-normalization fibre has dimension 0. Hyperspecial normalization is identity. | The new ambient-model distinction detects the earlier error. |
| 0.3 | Full GL₂ level 9→3; identity level | Kernel 1+3M₂(F₃) has 3⁴=81 elements; identity transition degree 1. | Consistent with the finite étale tower and Layer 0 example. |
| 0.5 | Two ordinary elliptic Serre–Tate lifts through the same point | Both give D=W e₀⊕W e₁ with F=diag(1,p)σ; determinant Frobenius p, Tate-normalized polarization Frobenius 1. | Rational tensor values agree; no integral comparison inferred without its hypotheses. |
| 1.2 | Hyperspecial GL₂; a frame over k[ε]/ε² | Adapted and branch rings W[[t]]=W[[t]]. For U=[[1,ε],[0,1]], (Ue₁U⁻¹)₁₂=−ε whereas (e₁)₁₂=0. | The specified integral tensors discriminate an unmarked deformation/frame. |
| 1.4; 1.9 | Hyperspecial GL₂ and Iwahori crossing | dim S=dim M=1; dim S̃=5; q relative dimension 4. In k[[u,v]]/(uv), u,v≠0 and uv=0; two components versus one integral P¹. | Torsor and smooth filtration map are distinguished; no arbitrary-parahoric integrality claim. |
| 2.2 | Q(i), p=5 versus p=3 | X²+1 has roots 2,3 mod 5 and none mod 3; local degrees 1+1 versus 2. | Complete splitting is substantive and retains the target local field. |
| 2.6 | Induced split central torus versus finite torsion | X_*=Z² has torsion subgroup 0; Z/2 has torsion subgroup of order 2. | Correct torsion-free condition; no copied source slip. |
| 3.4 | γ=diag(ℓ,1), ℓ≠p; γ=1 | E₁₂ entry 1 becomes ℓ; E₂₁ entry 1 becomes ℓ⁻¹. Identity leaves both 1. | Transported tame level is γKγ⁻¹, not generally K. |
| 3.6 | Iwahori and j=diag(p,1) | Lower entry c=p becomes c/p=1, violating c∈pZ_p; j=1 leaves c=p. | Correct conjugated parahoric in the repaired gluing formula. |
| 3.8 (headline) | Modular datum at hyperspecial and Iwahori levels | Local model and Shimura dimension 1=1; Iwahori special fibre has two components. | Integral model existence does not assert smoothness at every parahoric. |
| 3.10; 6.2 | GU(1,1); torus; disconnected control | Adjoint dimension 3 gives frame dimension 1+3=4, whereas full dimension 5 gives 6. Torus relative dimension 0. H¹(F_q,connected smooth)=1; nontrivial C₂-torsor has 0 F_q-points and class 1∈Z/2. | Connected frames, same residue field and correct relative dimension retained. |
| 4.5 revised route | Ordinary versus basic local GL₂ torus; global norm obstruction | Split average (0,−1), nonsplit average (−1/2,−1/2). Real Weyl cocycle −1 versus rational-conjugator cocycle 1. In R02, norm determinants have even v₃; 1/3 has v₃=−1. | Existing specialness and adjustment imports are necessary; correct the rational-conjugacy overclaim. |
| 4.6 | Ordinary/basic elliptic; quaternion inner form | D slopes (0,1) versus (1/2,1/2). The inner-form putative ordinary transfer has (1/2,−1/2), each with multiplicity 1 instead of a multiple of denominator 2. | Actual ordinary-class existence is retained. |
| 4.7 (headline) | Modular component; nodal crossing | Ordinary open dimension 1, supersingular subset dimension 0; crossing has 2 local branches. | Density keeps its existence, rational-witness and local-integrality premises. |
| R01; 4.9 supplier | γ=diag(2,4), n=0,1,2; γ=diag(1,−1) | First γ: closure dimensions at n=0 and n>0 are 0 and 1; centralizers 4 and 2. Second γ: e=2, centralizers at n=1,2 have dimensions 2 and 4. | Require n≥1 and e∣n. |
| 4.9 | ζ of order 24 over W(F₂₅); supersingular matrix | ζσ(ζ)=ζ⁶≠ζ²; dual tower scalar ζ⁻⁶. D-matrix [[0,−1],[5,0]] has square −5I; inverse transpose has square −I/5. Finite-period centralizer dimensions change 2→4 after squaring. | Norm is not a power; finite-period group is distinguished from J_δ. |
| 4.11 | −1 and [2] at p=5 | −1 represents the same Hecke-orbit coset. [2] has degree 4, with inverse [1/2] in End(A)⊗Z_(5), but no inverse in End(A). | The theorem explicitly places A in the prime-to-p isogeny category; its localized Aut interpretation is essential. No converse normalization criterion is asserted. |
| 4.13 (headline); removed dimension gap | Ordinary CM E; regular SO₈ points; nonsemisimple control | CM I and every realization centralizer have dimension 2. Outer-conjugate regular SO₈ elements have centralizers of dimensions 4=4. Unipotent and identity in GL₂ share quotient coordinates but centralizer dimensions are 2≠4. | Semisimplicity makes the new direct dimension argument valid; deleted gap is redundant. |
| 5.1 | Identity derived-isomorphism; tame change | Completed local map W[[t]]→W[[t]] is identity; an étale tame change preserves this geometric completion. An isogeny of degree 2 is not an isomorphism of degree 1. | Integral extension and stronger formal comparison have separate hypotheses. |
| 5.2; 5.6 | Two symplectic planes; norm-matched CM tori | Multipliers 2 and 3 give 2J⊕3J, no common scalar. Matched tori have dimensions 3→2 with kernel dimension 1, so 3=1+2. | Common multiplier and projection tensors are necessary. |
| 5.8–5.9 (headline) | Ordinary CM E/F₅ | D slopes 0,1; isogeny torus rank/dimension 2. The element 1/5 is a rational quasi-isogeny, not an integral automorphism. | Lift preserves the full rational action, with finite extension allowed. |
| 5.10 (headline) | γ=(1−2i)/5∈Q(i) | Trace 2/5 and norm 1/5; γ² has trace −6/25 and norm 1/25. Norm-one real torus is compact. | Exact q-Frobenius, not a substituted power; ellipticity agrees. |
| 6.1 | GU(1,1) hyperspecial curve | P¹ minuscule model has 1 KR stratum; ordinary/basic Newton classes number 2 with p-ranks 1/0. | Top KR is not identical with ordinary. |
| 6.3 (headline) | Degree-one marked curve; degree-two control; torus point | Degree 1 preserves trace 2/5; degree 2 changes it to −6/25. For a zero-dimensional ordinary point, constant A¹ has ordinary inverse image A¹. | Same-field conclusion and zero-dimensional case both work. |
| 7.4–7.5 | Standard, determinant and trivial representations; faithful torus embedding | At ℓ=3,7 polynomials are T²−2T/5+1/5, T−1/5, T−1. In t↦diag(t,t⁻¹), t=2 and 1/2 both give trace 5/2, while character t distinguishes 2 and 1/2. | All characters are used for separation; finite faithful quotient map alone is insufficient. |
| 7.6 (headline) | CM point; one-prime negative control; nonabelian descent test | Common coordinates (2/5,1/5). Q(i) embeds in Q₅ but not Q₃. An order-2 subgroup of S₃ misses both 3-cycles. | Almost-all local realizations of one algebraic point give rational descent; one prime does not. |
| Repaired pinned coaction contract | g=diag(2,1), x=[[1,1],[0,1]]; G_m | gxg⁻¹ upper entry 2; g⁻¹xg upper entry 1/2. For G_m both actions are trivial. | Pinned coaction orientation and the new nonabelian witness agree. |

### Pins, Lean elaboration and headline coverage

The manifest pins match README:44 and README:48: Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5. Opened the following declarations at those pins:

| Declaration | Pinned file and line | Verified content / limitation |
|---|---|---|
| WittVector.Isocrystal; Isocrystal.frobenius | `Mathlib/RingTheory/WittVector/Isocrystal.lean:112`, :124 | Module and Frobenius-semilinear equivalence; no finite-dimensionality, family or G-structure field. |
| TauCeti.AlgebraicGeometry.AbelianVariety | `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | Proper geometrically integral group object; no polarization field. |
| TauCeti.AlgebraicGeometry.AbelianVariety.End | `TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean:74` | Additive endomorphism carrier, multiplication by composition. |
| Matrix.transpose_mul_J_mul_eq_det_smul | `TauCeti/LinearAlgebra/Matrix/SymplecticMultiplier.lean:63` | Rank-two block matrix, [Unique l], commutative coefficient ring. Kept only as an imported Check. |
| TauCeti.reductiveCommHopfAlgProperty | `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean:71` | Smoothness, geometric connectedness and geometric absence of a nontrivial connected normal smooth unipotent subgroup. |
| TauCeti.HopfAlgebra.conjugationAlgHom | `TauCeti/Algebra/AlgebraicGroup/Hopf/Conjugation.lean:66` | Real-bodied left-conjugation coaction with conjugating variable first. |
| productMap_comp_conjugationAlgHom | Same file, :107 | Evaluation g x g⁻¹, not its inverse-orientation alternative. |
| conjugationAlgHom_counit_left; conjugationAlgHom_counit_right; conjugationAlgHom_coassoc | Same file, :176, :196, :248 | Identity action, fixed identity point and action associativity, respectively. |
| TauCeti.ComoduleAlgebra.coinvariants | `TauCeti/Algebra/Bialgebra/ComoduleAlgebra.lean:136` | Right-comodule equalizer coact(a)=a⊗1; not a registered conjugation invariant subalgebra with finite generation and geometric quotient classification. |

Object searches in both pins covered Shimura data and models, parahorics, local models, Newton strata and conjugacy quotients. Nearby hits were the actual Hopf coaction, ordinary group class functions, pointwise isocrystals and unrelated local models (for example divisor germs and topology). These do not supply integral Shimura moduli, canonical Hodge tensors or the tower local systems needed by the headlines. The finite-group class-function carrier is not the coordinate ring of a reductive conjugacy quotient. No omitted headline can be stated faithfully using a few simple native definitions.

| Listed headline | README | Suggested.lean docstring | Missing carrier |
|---|---|---|---|
| Common rational Frobenius class | §7.6 | lines 13–23 | Integral Shimura special fibre and group-valued tower local systems, with the reductive quotient API. |
| Integral abelian-type models | §3.8 | lines 24–26 | Abelian-type Shimura data, parahoric models and local models. |
| Ordinary special lifts with full action | §5.9 | lines 27–29 | Ordinary integral Shimura points and their tensor-isogeny groups. |
| Rational ordinary Frobenius | §5.10 | lines 30–31 | Ordinary Shimura locus and realization local systems. |
| Tensor Tate comparison | §4.13 | lines 32–34 | Canonical Hodge tensors, I_x and finite-period crystalline comparison group. |
| Density of ordinary locus | §4.7 | lines 35–37 | Universal G-isocrystal on the Shimura special fibre and Newton strata. |
| Same-field curves | §6.3 | lines 38–39 | Integral Shimura models and KR strata. |

The intermediate local-model diagram, adapted branches, henselian comparisons, canonical integral model and DVR extension discussed in the summary require the same missing integral Shimura/local-model carriers. None has been replaced with a weaker free-variable statement.

Ran `lake env lean` on the absolute path of the delivered `packages/ShimuraVarietiesPartII/Suggested.lean` from the content checkout, as prescribed: **exit 0, no output, no warnings**. No TauCeti import required building. The file has one `import Mathlib`, one module docstring, the prescribed namespace, and zero declarations. The exhaustive one-tactic probe therefore has **zero sorried theorems**; the `#check @name` signature comparison has **zero declared names**. There is no disappearing section hypothesis to compare and nothing changed. The preflight “Unknown identifier of” failure does not reproduce on this actual file.

### Suppliers, ownership and order

The prescribed dependency command returned exactly:

```text
depcheck: 236 roadmaps, 2156 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. The citation resolver reports no unresolved cross-roadmap identifiers or owned Lean names. Its warning that it did not inspect external Lean names was addressed by opening the pinned files listed above.

Every supplier named in the contract block was retrieved at its permitted copy and its cited sections inspected. The following table records the resolved objects. Numbers are section identifiers, not remembered design labels.

| Supplier and version | Resolved sections / ownership |
|---|---|
| ShimuraVarieties, PR #933 | 4.5, 5.6, 6.3–6.6, 8.1: toric canonical models, CM reduction, generic component descent and canonical tower. |
| ShimuraData, PR #1038 | Layers 1 and 4: Mumford–Tate groups and Hodge/abelian type; four further cover, centre and invariant-form contracts remain explicit. |
| PELModuli, PR #966 | M2.8, M4.5–M4.6, M6.1–M6.4: good-level algebraic-space moduli, finite normalizations, tame maps, polarized stacks and universal objects; no chain-moduli interpretation is inferred. |
| AbelianSchemesAndArithmeticModuli, PR #849 | A4.1, A4.3, A4.8–A4.9, A6.7, A6.14, A6.20–A6.22, A6.28–A6.29: Tate/de Rham, polarized effectivity, Serre–Tate, Hom, Rosati, descent, Frobenius, coefficient Hom and localized twists. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory, PR #879 | R07.2, specifically .6, .7, .12, .14 and .20: contravariant Dieudonné modules, descent and convention comparison. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, PR #1843 | 2.10–2.11, 3.13–3.17, 4.3–4.4, 4.12, 6.4–6.5: very-goodness, chains, integral tensor frames, adapted deformations and ordinary rational action. |
| GeometricSatakeAndFusion, PR #1235 | GS0: affine flags and Schubert geometry. |
| GeometricSatakeAndFusionPartII, PR #1836 | 1.4, 3.1, 3.4, 3.7, 5.5, 7.6: local-model comparisons, normal representatives, admissible special fibre, smooth maximal orbits and same-field curves. The tame polynomial comparison alone is not used as the general normal-model theorem. |
| ReductiveGroupsPartII, main | RG2.0, RG2.1, RG2.3: point topologies, root data, full fixers, connected parahorics, the very-special criterion and Lang. R-smoothness and its immersion extensions remain outside its stated scope. |
| ReductiveGroupsPartIII, PR #2131 | 0.5–0.7, 1.2–1.3, 2.3, 2.5, 3.5, 5.3a: characters, finite quotient map, selected outer quotient, descent, algebraicity, tori, cocharacter twist, cyclic closures and fixer intersections. Section 5.5 is conditional on an auxiliary common class, so its downstream use creates no cycle. R02 concerns the strength of one imported assertion. |
| BunGAndNewtonStrata, PR #1241 | 0.6, 0.8, 1.16, 1.22–1.26, 1.28–1.29, 1.34, 1.37, 1.39, 2.16: B(G), families, finite-period centralizers, ordinary/admissible classes, rational witnesses, specialness and Kottwitz constancy. |
| HeckeStacksAndLocalShtukas, PR #1252 | HS2.1, HS2.10–HS2.11, HS2.13: framed shtukas and generic period towers; full integral completion comparisons and unrestricted connected reduction are declared extensions. |
| CrystallineCohomology, PR #857 | CR.7.1, CR.7.3: coefficients and relative comparison. The two particular transport/descent results are explicit additional contracts. |
| PadicDifferentialEquationsAndRigidCohomology, PR #1002 | RD.3.43 and RD.5.116: family Newton semicontinuity and Zarhin enlargement. |
| PadicHodgeTheory, PR #1062 | 5.5: tensor torsors, general-residue crystalline comparison and integral Kottwitz difference. |
| MotivesAndAlgebraicCycles, PR #1313 | Layer 6 and 6.3: tensor reconstruction and image/subquotient criterion. |
| AutomorphicBundles, PR #1069 | 3.4–3.8: full-group Betti, étale and de Rham coefficients, comparisons and coherence. Dual/Tate conventions were compared. |
| SchemeAndStackFoundations, main | 1.17–1.23: quotients, stacks, inertia and descent. |
| AlgebraicModuliForArithmeticGeometry, PR #853 | Layers 1, 4, 6: moduli foundations and approximation; the two prescribed rational-point/curve assertions remain named contracts. |
| ArithmeticGaloisRepresentations, PR #856 | 1.11, paragraph “Reductive quotients over fields and DVRs”, at README:1436, with conjugation specialization at :1456; 5.1, 5.13: number-field and curve Chebotarev. The independent Noot comparison remains a Layer 6 gap. |
| GlobalShtukasAndFunctionFieldLanglands, PR #1490 | 6.1–6.2: constant twists and irreducible companions; the common-coefficient semisimple extension remains declared. |
| NeronModelsAndSemistableAbelianVarieties, PR #852 | 5.1–5.2: henselian criterion and descent to an arbitrary DVR; no excellence premise reintroduced. |
| ShimuraCompactifications, PR #1053 | Layer 7, especially 7.18–7.19: good-level quasi-projectivity and finite normalizations. Both Hodge component specialization and chain-level representability are explicitly requested extensions. |
| IgusaVarietiesAndTorsionConcentration, PR #1090 | 0.1–0.2, 0.12: PEL invariants and Newton strata, compared only on the common hyperspecial Siegel case. |

The board-package index was read before ownership searches. `roadmaps grep` was used by object (chain Siegel moduli, stable centralizers, R-smooth centralizers, normalized Hodge models and tensor quasi-isogenies), together with the pinned libraries, main checkout and board packages. The five closest open roadmaps in the supplied overlap file were compared by scope and their relevant targets. Generic tensor deformations, general local models, B(G) theory and PEL Newton strata retain their earlier owners; this package applies them to its normalized Hodge models. No duplicate fully qualified Lean name is possible in a file declaring nothing.

The supplied overlap report records no conflicting head, dropped cited identifier or citation depending only on an open revision. A fresh `roadmaps overlaps ShimuraVarietiesPartII` lookup cannot address this unported package: it reports that the roadmap is not yet on main or in an open roadmap pull request. The supplied package overlap file and the current supplier heads were therefore used, rather than interpreting that lookup as a clean overlap scan.

The new chain-moduli contract follows the existing ownership assignment in `packages/PELModuliPartII/README.md:279` (gap:bad-prime-projectivity) to ShimuraCompactifications. Its Siegel specialization needs the universal chain and tame transition maps; PELModuli's finite normalization does not supply them. The moduli-versus-normalization counterexample was recomputed above.

The earlier repair report's external R-smooth ownership observation remains visible: PR #1836, `TauCetiRoadmap/GeometricSatakeAndFusionPartII/README.md:77`, directs its R-smooth full-fixer gap to ReductiveGroupsPartII, whereas that roadmap's main scope excludes it and this package directs the extension to Part III. Changing this package back to the excluded owner would not repair the external citation. This is not counted as a requested package edit or a new finding against the present choice of owner.

### Declared gaps

The README and the plan contain exactly the same **20 slugs**, all with named suppliers. The supplier contents were compared with the missing conclusions, rather than treating the declarations as implemented theorems. R01 requires a hypothesis correction in one contract. The new lattice-chain gap is specific and follows the existing multichain owner. The local-model gap asks only for the unique maximal admissible element and ensuing integrality, not for the already supplied smooth open. The companion gap asks for the semisimple/common-coefficient extension, not for the already supplied irreducible theorem. The deleted centralizer-dimension gap is unnecessary for the reason given above.

Future acceptance would remain conditional on these contracts; this needs-changes verdict does not mark them fulfilled. The stale references outside the editable gaps list mentioned by the repair report were not silently rewritten or treated as new package targets.

## Not verifiable

- No unreadable source blocked this review. All five cached works were available and the entire seeded sample was inspected. No new reference request was created.
- Published numbering was not independently collated for the KZ, HT and K17 preprints/manuscripts. The manifest and README explicitly identify the versions used; the citations above are to those versions. KP and KPZ use their published pagination.
- The standalone overlap command does not know this unported package; coverage of package-specific overlaps relies on the supplied overlap artifact plus the supplier-head inspections, as explained above.
- The 20 supplier contracts describe future work. Their ownership and requested statements can be reviewed; this review does not certify their future proofs.
- These mathematical calculations and source comparisons are not formal proofs of the roadmap. Successful elaboration of the declaration-free Suggested.lean establishes syntax/import compatibility only.

## Source issues

- **Misprint** in KZ at Proposition 4.2.3(5), printed p.34: the source says inertia coinvariants are torsion; it should be torsion-free, consistent with the next lemma and KPZ Proposition 7.2.19; affects a stated result.
- **Gap** in HT at the proof of Corollary 1.3.13, printed p.19: the source says the generated realization category has the full tensor-stabilizer group; it should be a subgroup, with restriction of representations supplying the functor; affects the proof.
- **Error** in HT at §1.3.15 and Corollary 1.3.16, printed p.20: the source says an ordinary class exists without a separate existence premise; it should be assumed to exist or guaranteed, for example by quasi-splitness; affects a stated result.
- **Misprint** in HT at §2.1.8, printed p.24: the source says the cyclic subgroup is generated by an unintroduced x when defining neatness of γ; it should be generated by γ; affects nothing.
- **Error** in KP at the proof of Theorem 4.2.7, printed p.187: the source says the relevant action map is a torsor; it should be smooth, with the frame projection carrying the torsor property; affects the proof; corrected in print at KPZ §7.3.1(1), p.85.
- **Gap** in KP at Lemma 3.1.17, printed p.169: the source says its auxiliary topology justifies the logarithmic limit; it should use p-adic completeness and the shifted logarithmic-tail convergence argument; affects the proof; corrected in print at KPZ §7.3.1(2), pp.85–86.
- **Error** in KP at Lemma 4.6.13 and Corollary 4.6.15, printed pp.202–203: the source says all component pieces use one fixed parahoric; it should use jK_p°j⁻¹ for the j-piece; affects a stated result; corrected in print at KPZ §7.3.1(3), pp.86–87.
- **Gap** in KP at Theorem 4.2.7, printed p.186: the source says a good embedding suffices for the display comparison; it should require the very-good first-order tensor compatibility for that proof; affects the proof; corrected in print at KPZ Remark 7.1.4(1), p.73.
- **Error** in KP at §4.6.21, printed p.205: the source says the auxiliary central cover is defined for every classical adjoint Shimura datum; it should retain the additional abelian-type compatibility condition; affects a stated result; corrected in print at KPZ §7.2.3, footnote 8, p.77.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "1374c85edfbdee79c34cd73dfbb6150a3060f2ff", "job": "REV-PKG-ShimuraVarietiesPartII~3", "model": "gpt-6-astra", "worker": "chris-9"} -->
