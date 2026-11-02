# Review of GrothendieckTeichmuller (pull request #1058 at fd05ad5)

**Verdict:** needs changes

🤖 Independent AI review. Incremental re-review of 20 changed lines since 24d0caf. Both previous defects are repaired. One new missing-hypothesis finding concerns the example added to the Bar-Natan paragraph. The gate, targeted build, dependency check and direct Lean elaboration pass.

## R01 (P2) — Qualify the exponent-minus-one example for the coefficient algebra

**Location:** TauCetiRoadmap/GrothendieckTeichmuller/README.md:57–61: “a commutative ℚ-algebra k” and “it is the subgroup of exponent one, so (−1, 1) is not in it”.

**Claim:** The exclusion is asserted for every commutative ℚ-algebra. That includes the zero algebra; no nontriviality hypothesis is stated.

**Witness:** Take k to be the zero ℚ-algebra. Then −1 = 1, so (−1,1) = (1,1), the identity of GT₁(k). Mathlib's PUnit.commRing and PUnit.algebra provide this coefficient example at the pin.

This does not invalidate the corrected identification with the exponent-one subgroup. It invalidates the added assertion that the minus-one parameter always distinguishes that subgroup from full GT(k). Over the zero ring every coefficient module is zero and every exponent equals one; the identity cannot be excluded.

**Exact repair:** Keep the definition for arbitrary commutative ℚ-algebras and replace the example clause with “over ℚ, (−1, 1) is not in it”, or qualify that clause alone by “if k is nonzero”. Do not restrict the whole construction.

**Repair tested:** Over ℚ, the two exponents are −1 and 1, hence distinct; on the abelianized unipotent pure two-strand group they send log(σ²) to −t and t. Over the zero algebra these values are both 0 and the parameter is the identity, as the qualified sentence permits. A scratch Lean probe at the pin proves both (-1 : PUnit) = 1 and, for every nontrivial commutative ℚ-algebra k, (-1 : k) ≠ 1.

## Previous findings

- R01 — repaired: README:669–674 now states the S₃ counterexample and limits the cited open question to parameters satisfying (I)–(III). Sections 3.2–3.3 retain bijectivity and the units construction.
- R02 — repaired: README:57–62 now identifies GT₁(k), gives the coefficient algebra and structure-preservation conditions, and fixes the crossing. This report's R01 concerns the newly added exclusion example at the zero algebra.

## Verified sound

**Review scope and principles.** The actual diff has 12 insertions and 8 deletions, all in the two README paragraphs. Suggested.lean and metadata.toml are unchanged from 24d0caf. There are no changes outside TauCetiRoadmap/GrothendieckTeichmuller. The checkout remains clean at fd05ad56c71a45eaa32db7ee9fcaa318b8fea443. No pull-request file, manifest, toolchain or source manifest was edited.

The changes add no construction, supplier, algorithm, sorry'd data, shortcut or replacement for existing roadmap work. The excluded unipotent theory remains excluded. The counterexample does not weaken any profinite target. Unchanged substantive audits are inherited from [r8](PRREVIEW-GrothendieckTeichmuller~8.md), as required for an incremental review.

**Gate and dependency order.** Independent reruns report:

~~~text
gate GrothendieckTeichmuller: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 205 roadmaps, 1588 edges, 0 problem(s)
~~~

The gate invocation did not include a build field, so the targeted build was also run explicitly: lake build TauCetiRoadmap.GrothendieckTeichmuller.Suggested exited 0, reporting successful completion of 9023 jobs. There is no UPWARD or CYCLE line. The candidate order places InverseGaloisAndArithmeticFundamentalGroups at 43, PeriodsAndSpecialValues at 296, and this roadmap at 370. All *Needs:* lines were read; none changed or introduces a cross-roadmap input. The scope citations designate other owners, not new suppliers.

**Elaboration and signatures.** Direct lake env lean elaboration of TauCetiRoadmap/GrothendieckTeichmuller/Suggested.lean exits 0 with 15 warnings, all for sorry, at lines 102, 106, 110, 114, 118, 134, 171, 205, 209, 223, 246, 254, 276, 281 and 287. A scratch copy with #check @name for all 43 named declarations also elaborates successfully. Its 43 types equal the supplied signature record after whitespace and explicit-argument-marker normalization; no binder changed or disappeared. The additional coefficient probes establish R01's counterexample and repair.

The unchanged definitions were compared with the relevant prose: beta uses x↦x^λ and y↦f⁻¹y^λf; IsGT includes the unit exponent, closed-commutator membership and all three relations; IsGT0 additionally requires bijectivity and the two outer commutation conditions; the units/bijectivity theorem quantifies over gtMonoid, not arbitrary parameters. Thus the repaired research paragraph does not remove a needed Lean hypothesis.

**Headline inventory.** The eight unchanged headlines remain present: eq_of_beta_eq (§1.4), closure_artin (§2.2), isUnit_iff_bijective_beta (§3.3), isGT0_iff (§3.4), GTHat.isGT0 (§4.1), GTHat.injective_mk_betaEquiv (§4.2), isClosed_setOf_isGT and GTHat.isClosedEmbedding_betaEquiv (§4.5). The module docstring treats §3.5's five-term form as a non-headline retained in the README. No headline or Lean declaration changed; the prior padding audit is carried forward without repeating one-tactic probes for unchanged declarations.

**Pinned evidence reopened.** Mathlib is f6090c7095e1e56b3464c1daba5f24631f1290d2 and Tau Ceti is 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a. Six declarations were reopened in their pinned source files:

| Declaration | Repository-relative file and line | Contract checked |
|---|---|---|
| PUnit.commRing | Mathlib/Algebra/Ring/PUnit.lean:24 | The one-element type is a commutative ring. |
| PUnit.algebra | Mathlib/Algebra/Algebra/Basic.lean:42 | It is an algebra over every commutative semiring, including ℚ; no Nontrivial instance is required. |
| TauCeti.freeProfiniteGroup.dense_closure_range_of | TauCeti/Topology/Algebra/Group/Profinite/Free/Basic.lean:94 | Canonical generators topologically generate. |
| TauCeti.freeProfiniteGroup.hom_ext | Same file:108 | Equality on generators determines maps into a Hausdorff target. |
| TauCeti.freeProfiniteGroup.lift | Same file:124 | The two S₃ generator images extend continuously; compactness and total disconnectedness are explicit. |
| TauCeti.IsTopologicallyFinitelyGenerated.bijective_of_surjective | TauCeti/Topology/Algebra/Group/Profinite/Hopfian.lean:87 | Requires surjectivity as well as continuity and finite generation. A unit exponent alone supplies no surjectivity. |

**Ownership and cross-roadmap citations.** Searches by object using roadmaps grep, the readable board package tree and pinned libraries found no competing parenthesized-braid or unipotent GT₁ construction introduced by the changes. The indexed unipotent-completion hits concern the excluded motivic and fundamental-group theories. There are no new declarations or fully qualified names. The profinite construction's ownership is inherited from r8. BelyiMaps and completed ProfiniteArithmetic were reopened as main-branch shape examples; completed ProfiniteProPGroups was also inspected.

Every cross-roadmap citation was resolved again against main fa41b374 or the available open text:

- TauCetiRoadmap/BelyiMaps/README.md:3772–3774 names Layer 12 and its owner BelyiArithmeticActions.
- TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:989 and :5316 identify IG.1.2, tangential fibres, and IG.5.1, configuration spaces. The headings and their actual constructions were read through roadmaps show.
- TauCetiRoadmap/PeriodsAndSpecialValues/README.md:2145, :2166, :2186 and :2460 identify PS.9.8–9.10 and PS.9.22, respectively: mixed Tate motives, their Galois group, the path torsor, and the motivic Hoffman basis.
- Completed/ProfiniteArithmetic/README.md:37 and Completed/ProfiniteProPGroups/README.md:37 record the generic profinite ownership already consumed through Tau Ceti.

The resolver reports no unresolved cross-roadmap citation. Its rerun did not inspect library names, so library evidence comes from the pinned files and the signature probe. The worker's three original name leads are this roadmap's own declarations, successfully checked at Suggested.lean:254, :276 and :287.

**Sources and seeded sample.** The two affected works were fetched through the sources service from legal author/editor copies:

- [Bar-Natan's author text](https://www.math.toronto.edu/drorbn/papers/GT1/GT1.pdf): barnatan98 line 153 supplies the unital commutative ℚ-algebra; lines 294–304, Definition 2.4, printed p. 7, supply the skeleton, strand, coproduct and crossing conditions; lines 1006–1012, Proposition 5.3, printed p. 23, give the pentagon in the pure four-strand completion and hexagons in the three-strand completion. These support the repaired normalized-group attribution. The new zero-ring exclusion is the roadmap's inference, not a statement made at these source locators.
- [Lochak–Schneps in the editor's manuscript](https://www.math.uchicago.edu/~farb/papers/mcgbook.pdf): lochakschneps06 lines 6664–6668, Question 1.1, printed p. 178, distinguish the unrestricted and relation-constrained questions. Lines 6685–6693, Questions 1.6–1.7, printed p. 179, support the finite-quotient context. The repaired paragraph correctly cites the second part of Question 1.1.

All 15 targets in this round's seeded sample (§§0.1, 1.1–1.3, 1.5, 2.2–2.3, 3.1, 3.3–3.5, 4.1–4.4) are textually unchanged. Their unchanged locator checks and adversarial rows are carried from r8 and its expressly cited earlier reports. The diff's references to §§3.2–3.3 were read in context and the counterexample was recomputed below; no other sampled locator was reopened as a full review. No new unverified-locator flag was introduced.

**Adversarial table: changed claims and immediate dependencies.** Permutations compose right to left and [a,b]=aba⁻¹b⁻¹. The S₃ computations, including all generating pairs, were independently executed.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| README:669–670, unit exponent does not imply bijectivity | λ=1, f=[y,x], x=(12), y=(13) | f=(132); qβ(x)=qβ(y)=(12); image orders 2 for qβ and 6 for q | Correct repaired assertion | r8 R01 repaired |
| README:671–674, restriction to (I)–(III) | Same parameter, m=0, z=(123) | (I) gives (123)(132)=1; (II) gives [x,z][z,y][y,x]=(132)≠1 | Counterexample lies outside the remaining question | r8 R01 repaired |
| README:57–60, fixed-crossing subgroup has exponent one | k=ℚ, identity versus c=(−1,1) | Identity sends σ² to σ², log to t; c sends σ² to σ⁻², log to −t; t≠−t | Normalized identification supported | r8 R02 repaired |
| README:60–61, c excluded for arbitrary commutative ℚ-algebra | k=0, then k=ℚ | At k=0, −1=1=0 and c=(1,1), so membership is true; at ℚ, −1≠1, so membership is false | Missing coefficient qualification | R01 |
| Tested repair of README:61 | Any nontrivial commutative ℚ-algebra; zero algebra as excluded test | Algebra map from ℚ injective, so −1≠1; at k=0 both map to 0 | Qualify only the exclusion example | R01 repair |
| README:61–62, pentagon and hexagons for normalized group | Σ=1 over ℚ and over zero algebra | Pentagon 1·1·1=1·1=1; hexagon σ₂σ₁=1·σ₂·1·σ₁·1; at zero coefficients all coefficients coincide | Correct normalized attribution | None |
| §§1.3,3.2–3.3 used by changed paragraph | Bad parameter, identity, c | Bad quotient image order 2; identity fixes x,y; β_c²(x)=x, β_c²(y)=y and c²=(1,1) | Existing bijectivity/units conditions remain necessary | None |
| Same negative control on cyclic/trivial quotients | Abelian quotients | f=[y,x] maps to 1; β maps x to x and y to y; on trivial group 1=1 | Abelian tests alone miss the failure | None |
| Finite-quotient sentence and §4.4 | Surjections F̂₂→S₃, c action | 18 generating pairs; inversion fixes 6 and permutes remaining 12 in 6 two-cycles | Finite action computed, no classification inferred | None |

**Adversarial table: unchanged rows carried forward.** Each row below cites r8 as its immediate provenance. Older round labels within the row identify r8's inherited evidence, not a new audit in this round. These rows preserve the earlier coverage of the sampled targets, the eight headlines and their definitions.

| Statement carried by r7 | Instances | Values | Result | Change |
|---|---|---|---|---|
| §4.5 line-wrap repair | Old versus new sentence | Word sequence unchanged; lengths 169→87/67/13 | r7 repair preserved; [r8](PRREVIEW-GrothendieckTeichmuller~8.md) | None |
| §4.5 closed embedding and outer embedding | Units and characteristic finite quotients | Units embed as uv=vu=1; finite action determined by λ mod exp(F̂₂/N), f mod N; compact domain, Hausdorff target, injective map | r7/r5; [r8](PRREVIEW-GrothendieckTeichmuller~8.md) | None |
| Public header and headline signatures | 43 signatures, eight headlines | r6 public olean about 78 KB; 43/43 signatures still equal here | r7/r6, comparison rerun; [r8](PRREVIEW-GrothendieckTeichmuller~8.md) | None |
| Scope: motivic ownership | Four PeriodsAndSpecialValues targets | Lines 2145,2166,2186,2460; merge positions 296<370 | r7/r6, citations re-resolved; [r8](PRREVIEW-GrothendieckTeichmuller~8.md) | None |
| §4.5 sources | ihara91 §3.3; harbaterschneps00 §0; schneps97 §1.3(3) | Earlier source lines 9635–9638,71–73,278–284; parameters recovered from generator images, group recovered as inverse limit of finite images | r7/r6; [r8](PRREVIEW-GrothendieckTeichmuller~8.md) | None |
| Scope: Brown and HLS | Weights 5–7; λ=±1; four surfaces | Basis counts 2,2,3; c∉GT̂¹ since −1≠1; modular dimensions 1,1,2,2; Γ₀³≅ℤ³ with trivial action | r7/r4; [r8](PRREVIEW-GrothendieckTeichmuller~8.md) | None |
| Conventions; §§0.1,1.3,3.2–3.3,4.3,4.5; §2.4 Check 3 | Noncommuting parameters; rank one; dihedral tests | Products (−1,x⁻¹) versus (−1,x); rank-one centralizer is whole group; (II) at f=1 gives r^(−m) or r^(−m−1), forcing λ=±1 | r7/r3; [r8](PRREVIEW-GrothendieckTeichmuller~8.md) | None |
| subst; §§0.2–0.4,1.1–1.2,1.4–1.5,2.1–2.4,3.1–3.5,4.1–4.2,4.4; HMM scope | Generators, commutators, parameter inverse, outer equality | 1(a,b)=1, x(a,b)=a, y(a,b)=b; [(12),(23)]=(132); δ²(x)=yxy⁻¹; inverse-parameter products (1,1); outer equality forces abelianized conjugator exponents a=b=0 | r7/r2; [r8](PRREVIEW-GrothendieckTeichmuller~8.md) | None |

| Target | Instances | Values | Result | Change |
|---|---|---|---|---|
| §0.1 | Rank 1 and 2 | Rank 1: C(g)=ẑ; coordinate retraction π_i(lift(a))=a; rank 2: xy fails to centralize y in the S₃ quotient | r7/r3; [r8](PRREVIEW-GrothendieckTeichmuller~8.md) | None |
| §0.2 | f=1,x,y,z | Substitution yields 1,a,b,(ab)⁻¹ respectively | r7/r2; [r8](PRREVIEW-GrothendieckTeichmuller~8.md) | None |
| §0.4 | x,y | θ²=id; ω:x→y→z→x; δ²(x)=yxy⁻¹, δ²(y)=y | r7/r2; [r8](PRREVIEW-GrothendieckTeichmuller~8.md) | None |
| §1.2 | p=(λ,f), q=(μ,g) | Both compositions send x→x^(λμ), y→(fβ_p(g))⁻¹y^(λμ)(fβ_p(g)) | r7/r2; [r8](PRREVIEW-GrothendieckTeichmuller~8.md) | None |
| §§1.3–1.4 | λ=0; omit commutator membership | β_{0,1}=β_{0,[x,y]}=1 while [x,y]→(132)≠1; β_{λ,f}=β_{λ,y^cf}, but y^cf abelianizes to (0,c) | r7/r2–r3; [r8](PRREVIEW-GrothendieckTeichmuller~8.md) | None |
| §§2.2–2.3 | Six Artin words; linking-coordinate quotient | Squares and conjugates have permutation 1; coordinate 13 maps x₁₃→1 in ℤ/2 and adjacent generators to 0 | r7/r2; detects omitted nonadjacent generators; [r8](PRREVIEW-GrothendieckTeichmuller~8.md) | None |
| §2.4 | f=1; abelianized exponent sums (a,b) | 1=1; coordinates 12,34 give (a,b)=(2a,2b), forcing a=b=0 | r7/r2; [r8](PRREVIEW-GrothendieckTeichmuller~8.md) | None |
| §§3.2,3.4 | c=(−1,1) | β_cθ=θβ_c; β_cδ(x)=xy, δβ_c(x)=yx=y(xy)y⁻¹; (I),(II) hold with m=−1 | r7/r2; [r8](PRREVIEW-GrothendieckTeichmuller~8.md) | None |
| §3.3 | Bijective β_{λ,f} | Inverse parameter (λ⁻¹,β⁻¹(f)⁻¹); product second coordinates ff⁻¹=1 and β⁻¹(f)⁻¹β⁻¹(f)=1 | r7/r2; [r8](PRREVIEW-GrothendieckTeichmuller~8.md) | None |
| §4.1 | 1,c,pq | Character 1,−1,λμ; c²=1; mod 3, χ(c)=2≠1 | r7/r2; [r8](PRREVIEW-GrothendieckTeichmuller~8.md) | None |
| §4.2 | Inner equality; excluded (1,x) | Equality forces λ=μ, conjugator exponents a=b=0; β_{1,x}=conj(x⁻¹), but x∉F̂₂' | r7/r2; [r8](PRREVIEW-GrothendieckTeichmuller~8.md) | None |
| §4.3 | (±1,1); dihedral quotients | (II): m=0 gives 1; m=−1 gives (xyz)⁻¹=1; all dihedral tests force m=0 or −1 | r7/r3; [r8](PRREVIEW-GrothendieckTeichmuller~8.md) | None |
| §4.4 | p,q,φ | p·(q·φ)=φ∘β_q⁻¹∘β_p⁻¹=φ∘β_{pq}⁻¹; x maps to a^(λ⁻¹) | r7/r2; [r8](PRREVIEW-GrothendieckTeichmuller~8.md) | None |
| §4.5 | Unit-exponent slice f=1; inverse pairs | Intersection with GT̂^{mon} is {(1,1),(−1,1)}; units image is uv=vu=1, closed in the compact product | r7/r3–r5; [r8](PRREVIEW-GrothendieckTeichmuller~8.md) | None |

## Not verifiable

- Exact journal pagination was not independently certified for the two affected references; the numbered statements and the author/editor manuscript pages above were read. Bar-Natan's author PDF contains later notes. The previous report's version comparison is inherited.
- The 2006 question list and the limited search for later literature do not prove continuing openness in 2026. No resolution of the relation-constrained invertibility question or full nonabelian finite-quotient classification was established. The repaired counterexample assertion is independently verified.
- Unchanged source limitations are carried from r8: the versions of Hatcher–Lochak–Schneps, Brown 2012 and Grothendieck's French text; Ribes–Zalesskii §9.1 cited by its paywalled locator with the previously checked Herfort–Ribes substitute; Ihara 1994, Belyi 1979 and Montpellier folder 145. No settled source request was reopened.
- Ownership was checked against the readable indexed roadmap files and supplied package/library copies. Open work without readable files was not independently audited.

## Source issues

- none
