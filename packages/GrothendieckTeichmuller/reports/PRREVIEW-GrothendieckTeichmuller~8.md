# Review of GrothendieckTeichmuller (pull request #1058 at 24d0caf)

**Verdict:** needs changes

🤖 Independent AI review. Incremental re-review of 17 changed lines since c780f75. Two new blocking findings; no unresolved previous finding. The gate, targeted build, dependency check and standalone Lean elaboration pass. Unchanged mathematics is carried forward from the previous report.

## R01 (P1) — The unrestricted bijectivity question already has a counterexample here

**Location:** TauCetiRoadmap/GrothendieckTeichmuller/README.md:668–670: “Whether every (λ, f) ∈ ẑˣ × F̂₂', or every one satisfying (I), (II) and (III), gives a bijective β_{λ,f} is open”.

**Claim:** Automatic bijectivity for arbitrary unit-exponent, commutator-valued parameters is called open. This contradicts §3.2's existing negative control, lines 483–486.

**Witness:** Set λ=1, f=[y,x], x↦(12), y↦(13) in S₃. Then f↦(132) and both generator images under β are (12): image order 2, target order 6.

The quotient map q from F̂₂ is surjective, whereas q∘β is not. Hence β is not surjective. The parameter is in the stated domain: 1∈ẑˣ and a commutator lies in F̂₂'. It even satisfies (I). At m=0, the product in (II) maps to (132)≠1, so it does not refute the question with all three relations imposed.

**Repair:** Separate the cases. State that a unit exponent and commutator membership do not ensure bijectivity, referring to §3.2's Check. Retain the question for pairs satisfying (I)–(III), citing the second part of Lochak–Schneps Question 1.1. The example then agrees with the prose and falls outside the remaining question. Keep §3.2's bijectivity condition and §3.3's units construction.

The source poses both questions, but that does not establish the first one's continuing openness: lochakschneps06 lines 6664–6668, Question 1.1, editor's manuscript p. 178 ([legal text](https://www.math.uchicago.edu/~farb/papers/mcgbook.pdf)).

## R02 (P2) — Bar-Natan's cited group fixes the crossing and has exponent one

**Location:** TauCetiRoadmap/GrothendieckTeichmuller/README.md:57–60: “Bar-Natan 1998 obtains GT(k) as the automorphism group of the unipotent completion of the category of parenthesised braids”.

**Claim:** The cited definition is identified with full GT(k), omitting the structure-preservation requirements and fixed-crossing normalization.

**Witness:** barnatan98 lines 294–304, Definition 2.4, p. 7, requires fixing σ. Over ℚ, (−1,1) in full GT(ℚ) sends σ² to σ⁻²; their abelianized logarithms are t and −t.

The full group therefore contains an element excluded by the cited definition. In conventional parameter notation, the fixed-crossing group is the exponent-one subgroup GT₁(k). Proposition 5.3 describes that same normalized group.

**Repair:** Identify the source's group as GT₁(k), for a commutative ℚ-algebra k, whose automorphisms preserve the skeleton, strand operations and coproduct and fix the basic crossing. Apply the pentagon/hexagon sentence to this variant. Alternatively remove the added identification. The identity fixes σ, whereas (−1,1) does not: the repaired distinction separates these examples.

The coefficient assumption is at barnatan98 lines 152–155; Proposition 5.3 is at lines 1006–1012, p. 23 ([author's text](https://www.math.toronto.edu/drorbn/papers/GT1/GT1.pdf)). Numbers agree with arXiv:q-alg/9606021v4. Pages here are those of the author version.

## Previous findings

The r7 report at c780f75 has no new finding. Its inherited repair remains intact:

- R01 — repaired: The former long sentence occupies README lines 630–632, with lengths 87, 67 and 13. The wrapping accepted in r7 remains unchanged; preceding lines were inserted.

## Verified sound

**Scope.** The diff changes only the README, with 16 insertions and one deletion. Suggested.lean and metadata.toml are identical to c780f75. The pull request has no changes outside this roadmap folder. No pull-request file or source manifest was edited.

**Gate and dependency order.** The independently rerun gate, including the targeted build of TauCetiRoadmap.GrothendieckTeichmuller.Suggested, reports:

~~~text
gate GrothendieckTeichmuller: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
~~~

The separate dependency check with the supplied candidate order and main content reports:

~~~text
depcheck: 205 roadmaps, 1561 edges, 0 problem(s)
~~~

No UPWARD or CYCLE line. InverseGaloisAndArithmeticFundamentalGroups is at position 43, PeriodsAndSpecialValues at 296, and GrothendieckTeichmuller at 370. Neither addition introduces a supplier or a construction target; the research questions are background.

**Elaboration and signatures.** Standalone lake env lean on TauCetiRoadmap/GrothendieckTeichmuller/Suggested.lean exits 0 with exactly 15 warnings, all for sorry, at lines 102, 106, 110, 114, 118, 134, 171, 205, 209, 223, 246, 254, 276, 281 and 287. A scratch copy with #check @name for all 43 named declarations also exits 0. All 43 signatures match the supplied record after whitespace normalization. None changed or lost a binder. In particular, IsGT0 includes bijectivity, IsGT does not, and isUnit_iff_bijective_beta quantifies over gtMonoid. R01 has not entered those signatures.

The eight unchanged headlines remain: eq_of_beta_eq (§1.4), closure_artin (§2.2), isUnit_iff_bijective_beta (§3.3), isGT0_iff (§3.4), GTHat.isGT0 (§4.1), GTHat.injective_mk_betaEquiv (§4.2), isClosed_setOf_isGT and GTHat.isClosedEmbedding_betaEquiv (§4.5). The module docstring identifies §3.5's five-term form as a non-headline retained in the README. The previous padding audit is carried forward: no Lean declaration changed, so no new one-tactic probe was run. The resolver's three leads are the roadmap's own declarations at Lean lines 254, 276 and 287.

**Pinned declarations reopened.** Checkouts match the manifest: Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a and Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2. These nine declarations were inspected in their respective source repositories:

| Declaration | File and line | Contract checked |
|---|---|---|
| TauCeti.freeProfiniteGroup.hom_ext | TauCeti/Topology/Algebra/Group/Profinite/Free/Basic.lean:108 | Equality on generators determines continuous maps into a Hausdorff target. |
| TauCeti.freeProfiniteGroup.lift | Same file:124 | Native lift with explicit group, topology, topological-group, compactness and total-disconnectedness hypotheses. |
| TauCeti.freeProfiniteGroup.lift_of | Same file:129 | Prescribed generator values. |
| TauCeti.zpowHat_intCast | TauCeti/Topology/Algebra/Group/Profinite/ZHat/Pow.lean:100 | Integer exponents agree with ordinary powers. |
| TauCeti.zpowHat_mul | Same file:136 | x^(ab)=(x^a)^b. |
| TauCeti.IsTopologicallyFinitelyGenerated.bijective_of_surjective | TauCeti/Topology/Algebra/Group/Profinite/Hopfian.lean:87 | Needs finite generation, continuity and surjectivity; a unit exponent alone does not supply surjectivity. |
| Units.instTopologicalSpaceUnits | Mathlib/Topology/Algebra/Constructions.lean:100 | Topology induced by embedProduct, recording the unit and inverse. |
| TauCeti.ContinuousAut.t2Space | TauCeti/Topology/Algebra/Group/ContinuousAut/Congruence.lean:258 | Hausdorffness under topological finite generation. |
| TauCeti.ContinuousAut.compactSpace | TauCeti/Topology/Algebra/Group/ContinuousAut/Profinite.lean:209 | Compactness under topological finite generation. |

**Ownership and citations.** Object searches with roadmaps grep, the package tree and pinned libraries for parenthesized braids and pro-unipotent GT/GRT found no competing construction introduced by this diff. Both additions concern exclusions or background; ownership of the unchanged profinite construction is carried from r7. BelyiMaps and completed ProfiniteArithmetic were read as main-branch shape examples; completed ProfiniteProPGroups was also reopened.

Cross-roadmap citations were resolved again:

- TauCetiRoadmap/BelyiMaps/README.md:3772 at main assigns Layer 12 to BelyiArithmeticActions.
- TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:989 and :5316, at the head returned by roadmaps show, contain §IG.1.2 (tangential fibres) and §IG.5.1 (configuration spaces).
- TauCetiRoadmap/PeriodsAndSpecialValues/README.md:2145, :2166, :2186 and :2460, at the supplied open head, contain §§PS.9.8–9.10 and PS.9.22: mixed Tate motives, their Galois group, the path torsor and the Hoffman basis.
- Completed/ProfiniteArithmetic/README.md and Completed/ProfiniteProPGroups/README.md confirm ownership of the generic profinite constructions. Their completed status is not treated as new work.

No new dependency follows from these scope deferrals.

**Sources and sample.** Both added works were fetched through the sources service from legal copies. In this report barnatan98 lines refer to the author's revised PDF; lochakschneps06 lines refer to the editor's book manuscript. Bar-Natan's arXiv v4 has the same numbered definition and proposition. Lochak–Schneps' standalone version has Question 1.1 on p. 5, lines 216–220, and Questions 1.6–1.7 on p. 6, lines 236–243. The editor's manuscript has the same numbering on pp. 178–179. Its Question 1.7 ends with a finite-quotient question (lines 6692–6693), so citing both 1.6 and 1.7 is supported; that last sentence is absent from the shorter standalone version.

The 15 seeded targets are §§0.1, 0.2, 0.4, 1.2, 1.3, 2.2, 2.3, 2.4, 3.2, 3.4 and 4.1–4.5. None of their statements or locators changed. The new paragraph invokes §§3.2–3.3 and conflicts with the negative control also used in §1.3; those dependencies were recomputed. Other sampled source checks are carried from r7 and its cited reports. No new unverified-locator flag was introduced.

**Adversarial table: new passages and immediate dependencies.** Permutations compose right to left; [a,b]=aba⁻¹b⁻¹.

| Statement | Instances | Computed values on each side | Result | Change |
|---|---|---|---|---|
| New unrestricted bijectivity question | λ=1, f=[y,x]; x=(12), y=(13) in S₃ | f=(132); qβ(x)=qβ(y)=(12); im(qβ) has 2 elements, im(q) has 6 | Already refuted | R01 |
| Restricted question with (I)–(III) | Same example, m=0, z=(123) | (I): [x,y][y,x]=1; (II): [x,z][z,y][y,x]=(132)≠1 | Example fails (II), so does not answer this question | R01's repair tested |
| §§1.3, 3.2, 3.3: bijectivity and units | Negative control; identity; c=(−1,1) | Negative control has quotient image size 2; identity fixes x,y; β_c²(x)=x and β_c²(y)=y; c²=(1,1) | Existing conditions correct | None |
| Same control on cyclic and trivial quotients | Any abelian quotient | [y,x]→1 and β_{1,[y,x]} induces id; trivial quotient gives 1=1 | Abelian quotients do not detect failure | None |
| New Bar-Natan identification | k=ℚ; q=σ²; identity and (−1,1) | Fixed crossing gives q→q, log(q)→t; exponent −1 gives q→q⁻¹, log(q)→−t≠t; modulo t², 1+t versus 1−t | Full group exceeds cited normalized group | R02 |
| New pentagon/hexagon attribution | Normalized identity Σ=1 | Pentagon 1·1·1=1·1=1; hexagon σ₂σ₁=1·σ₂·1·σ₁·1 | Correct for the normalized group | R02's restriction |
| Finite-quotient context and §4.4 | Surjections F̂₂→S₃; action by c | 18 ordered generating pairs: 6 distinct transposition pairs, 12 transposition/3-cycle pairs. Inversion fixes 6 and has 6 two-cycles | Concrete finite action; no classification implied | None |

The permutation products and the entire 18-element set of generating pairs were independently computed.

**Adversarial table: inherited rows.** Each following row carries the corresponding unchanged statement from [r7](PRREVIEW-GrothendieckTeichmuller~7.md). Where r7 abbreviated values by reference, the cited earlier report's values are repeated. These are inherited checks, not a new full review.

| Statement carried by r7 | Instances | Values | Result | Change |
|---|---|---|---|---|
| §4.5 line-wrap repair | Old versus new sentence | Word sequence unchanged; lengths 169→87/67/13 | r7 repair preserved | None |
| §4.5 closed embedding and outer embedding | Units and characteristic finite quotients | Units embed as uv=vu=1; finite action determined by λ mod exp(F̂₂/N), f mod N; compact domain, Hausdorff target, injective map | r7/r5 | None |
| Public header and headline signatures | 43 signatures, eight headlines | r6 public olean about 78 KB; 43/43 signatures still equal here | r7/r6, comparison rerun | None |
| Scope: motivic ownership | Four PeriodsAndSpecialValues targets | Lines 2145,2166,2186,2460; merge positions 296<370 | r7/r6, citations re-resolved | None |
| §4.5 sources | ihara91 §3.3; harbaterschneps00 §0; schneps97 §1.3(3) | Earlier source lines 9635–9638,71–73,278–284; parameters recovered from generator images, group recovered as inverse limit of finite images | r7/r6 | None |
| Scope: Brown and HLS | Weights 5–7; λ=±1; four surfaces | Basis counts 2,2,3; c∉GT̂¹ since −1≠1; modular dimensions 1,1,2,2; Γ₀³≅ℤ³ with trivial action | r7/r4 | None |
| Conventions; §§0.1,1.3,3.2–3.3,4.3,4.5; §2.4 Check 3 | Noncommuting parameters; rank one; dihedral tests | Products (−1,x⁻¹) versus (−1,x); rank-one centralizer is whole group; (II) at f=1 gives r^(−m) or r^(−m−1), forcing λ=±1 | r7/r3 | None |
| subst; §§0.2–0.4,1.1–1.2,1.4–1.5,2.1–2.4,3.1–3.5,4.1–4.2,4.4; HMM scope | Generators, commutators, parameter inverse, outer equality | 1(a,b)=1, x(a,b)=a, y(a,b)=b; [(12),(23)]=(132); δ²(x)=yxy⁻¹; inverse-parameter products (1,1); outer equality forces abelianized conjugator exponents a=b=0 | r7/r2 | None |

The following expanded inherited rows make the sample and headline witnesses explicit.

| Target | Instances | Values | Result | Change |
|---|---|---|---|---|
| §0.1 | Rank 1 and 2 | Rank 1: C(g)=ẑ; coordinate retraction π_i(lift(a))=a; rank 2: xy fails to centralize y in the S₃ quotient | r7/r3 | None |
| §0.2 | f=1,x,y,z | Substitution yields 1,a,b,(ab)⁻¹ respectively | r7/r2 | None |
| §0.4 | x,y | θ²=id; ω:x→y→z→x; δ²(x)=yxy⁻¹, δ²(y)=y | r7/r2 | None |
| §1.2 | p=(λ,f), q=(μ,g) | Both compositions send x→x^(λμ), y→(fβ_p(g))⁻¹y^(λμ)(fβ_p(g)) | r7/r2 | None |
| §§1.3–1.4 | λ=0; omit commutator membership | β_{0,1}=β_{0,[x,y]}=1 while [x,y]→(132)≠1; β_{λ,f}=β_{λ,y^cf}, but y^cf abelianizes to (0,c) | r7/r2–r3 | None |
| §§2.2–2.3 | Six Artin words; linking-coordinate quotient | Squares and conjugates have permutation 1; coordinate 13 maps x₁₃→1 in ℤ/2 and adjacent generators to 0 | r7/r2; detects omitted nonadjacent generators | None |
| §2.4 | f=1; abelianized exponent sums (a,b) | 1=1; coordinates 12,34 give (a,b)=(2a,2b), forcing a=b=0 | r7/r2 | None |
| §§3.2,3.4 | c=(−1,1) | β_cθ=θβ_c; β_cδ(x)=xy, δβ_c(x)=yx=y(xy)y⁻¹; (I),(II) hold with m=−1 | r7/r2 | None |
| §3.3 | Bijective β_{λ,f} | Inverse parameter (λ⁻¹,β⁻¹(f)⁻¹); product second coordinates ff⁻¹=1 and β⁻¹(f)⁻¹β⁻¹(f)=1 | r7/r2 | None |
| §4.1 | 1,c,pq | Character 1,−1,λμ; c²=1; mod 3, χ(c)=2≠1 | r7/r2 | None |
| §4.2 | Inner equality; excluded (1,x) | Equality forces λ=μ, conjugator exponents a=b=0; β_{1,x}=conj(x⁻¹), but x∉F̂₂' | r7/r2 | None |
| §4.3 | (±1,1); dihedral quotients | (II): m=0 gives 1; m=−1 gives (xyz)⁻¹=1; all dihedral tests force m=0 or −1 | r7/r3 | None |
| §4.4 | p,q,φ | p·(q·φ)=φ∘β_q⁻¹∘β_p⁻¹=φ∘β_{pq}⁻¹; x maps to a^(λ⁻¹) | r7/r2 | None |
| §4.5 | Unit-exponent slice f=1; inverse pairs | Intersection with GT̂^{mon} is {(1,1),(−1,1)}; units image is uv=vu=1, closed in the compact product | r7/r3–r5 | None |

## Not verifiable

- Both added works were legally readable. Numbered locators were verified in author/editor versions; exact journal pagination was not independently certified. Bar-Natan's author PDF contains later explanatory notes; the relevant numbered statements agree with arXiv v4. Lochak–Schneps' two versions differ at the end of Question 1.7 as recorded above.
- A 2006 question list alone cannot certify continuing openness in 2026. This review did not establish a complete nonabelian finite-quotient classification or a resolution of the restricted automatic-bijectivity question. R01 rests on a computed counterexample, not the age of a reference.
- Unchanged limitations carried from r7: the versions of Hatcher–Lochak–Schneps, Brown 2012 and Grothendieck's French text; Ribes–Zalesskii §9.1 cited by its paywalled locator with the previously checked Herfort–Ribes substitute; Ihara 1994, Belyi 1979 and Montpellier folder 145. No settled missing-text request was reopened.
- Ownership checks used the readable indexed roadmap files and supplied package/library copies. Open work without readable files was not independently audited.

## Source issues

- none
